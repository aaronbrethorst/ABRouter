// Copyright (c) 2011 Aaron Brethorst

// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

#import "ABRouter.h"
#import "SOCKit.h"
#define kPatternKey @"PatternKey"
#define kViewControllerKey @"ViewControllerKey"


static ABRouter *_sharedRouter = nil;

@implementation ABRouter

+ (ABRouter*)sharedRouter
{
    @synchronized(self)
    {
        if (!_sharedRouter)
        {
            _sharedRouter = [[ABRouter alloc] init];
        }
    }
    
    return _sharedRouter;
}

- (id)init
{
	self = [super init];
	if (self)
	{
		routePatterns = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc
{
	[routePatterns release];
	[super dealloc];
}

#pragma mark - Public Methods

- (void)match:(NSString*)pattern to:(Class)aClass
{
    if (![aClass conformsToProtocol:@protocol(Routable)])
    {
        [NSException raise:@"View Controller must conform to Routable protocol." format:@"%@", NSStringFromClass(aClass), nil];
    }
    
	[routePatterns addObject:[NSDictionary dictionaryWithObjectsAndKeys:[SOCPattern patternWithString:pattern], kPatternKey, aClass, kViewControllerKey, nil]];
}

- (void)modallyPresent:(NSString*)route from:(UIViewController*)viewController parameters:(NSDictionary *)parameters
{
    UIViewController<Routable> * pushMe = [self match:route];
    pushMe.apiPath = route;
    if ([pushMe respondsToSelector:@selector(setParameters:)] && parameters) [pushMe performSelector:@selector(setParameters:) withObject:parameters];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:pushMe] autorelease];
    [viewController presentModalViewController:nav animated:YES];
}

- (void)modallyPresent:(NSString*)route from:(UIViewController*)viewController
{
    [self modallyPresent:route from:viewController parameters:nil];
}

- (void)display:(id)obj withNavigationController:(UINavigationController*)navController
{
    UIViewController<Routable> * pushMe = [self match:[obj path]];
    pushMe.entity = obj;
    [navController pushViewController:pushMe animated:YES];
}

- (void)navigateTo:(NSString*)route navigationController:(UINavigationController*)navController parameters:(NSDictionary *)parameters
{
    UIViewController<Routable> * pushMe = [self match:route];
    pushMe.apiPath = route;
    if ([pushMe respondsToSelector:@selector(setParameters:)] && parameters) [pushMe performSelector:@selector(setParameters:) withObject:parameters];
    [navController pushViewController:pushMe animated:YES];
}

- (void)navigateTo:(NSString*)route withNavigationController:(UINavigationController*)navController
{
    [self navigateTo:route navigationController:navController parameters:nil];
}

- (UIViewController<Routable> *)match:(NSString*)route
{
    NSArray *pathInfo = [route componentsSeparatedByString:@"?"];
    route = [pathInfo objectAtIndex:0];
    
    NSMutableArray *potentialMatches = [NSMutableArray array];
    for (NSDictionary *d in routePatterns)
	{
		if ([[d objectForKey:kPatternKey] stringMatches:route])
		{
            [potentialMatches addObject:d];
		}
	}
    
    if (0 == [potentialMatches count])
    {
        // TODO: figure out a better punting strategy.
        // Facebook opens up a UIWebView, which is sort
        // of lame but seems like the least terrible of
        // all solutions.
        
        return nil;
    }
    
    NSDictionary *match = [potentialMatches lastObject];
    
    SOCPattern *pattern = [match objectForKey:kPatternKey];
    Class class = [match objectForKey:kViewControllerKey];
    
    
    UIViewController<Routable> * pushMe = [[[class alloc] init] autorelease];
    pushMe.apiPath = route;
    
    if ([pushMe respondsToSelector:@selector(setParameters:)])
    {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        if (pathInfo.count > 1)
        {
            NSString *paramsString = [pathInfo objectAtIndex:1];
            NSArray *paramStringArr = [paramsString componentsSeparatedByString:@"&"];
            for (NSString *paramString in paramStringArr)
            {
                NSArray *paramArr = [paramString componentsSeparatedByString:@"="];
                if (paramArr.count > 1)
                {
                    NSString *key = [paramArr objectAtIndex:0];
                    NSString *value = [paramArr objectAtIndex:1];
                    [params setObject:value forKey:key];
                }
            }
        }
        
        [params addEntriesFromDictionary:[pattern parameterDictionaryFromSourceString:route]];
        
        [pushMe performSelector:@selector(setParameters:) withObject:params];
    }
    
    return pushMe;
}

@end

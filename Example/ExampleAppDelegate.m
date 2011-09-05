//
//  ExampleAppDelegate.m
//  Example
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "ExampleAppDelegate.h"
#import "RootViewController.h"
#import "PhotoListViewController.h"
#import "PhotoViewController.h"
#import "AlbumListViewController.h"
#import "PhotoListViewController.h"

@implementation ExampleAppDelegate

@synthesize window = _window;
@synthesize rootViewController, navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[ABRouter sharedRouter] registerURLPattern:@"/photos" forViewControllerClass:[PhotoListViewController class]];
    [[ABRouter sharedRouter] registerURLPattern:@"/photos/:id" forViewControllerClass:[PhotoViewController class]];
    [[ABRouter sharedRouter] registerURLPattern:@"/albums" forViewControllerClass:[AlbumListViewController class]];
    [[ABRouter sharedRouter] registerURLPattern:@"/albums/:id" forViewControllerClass:[PhotoListViewController class]];
    
    self.rootViewController = [[[RootViewController alloc] init] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:self.rootViewController] autorelease];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

- (void)dealloc
{
    self.rootViewController = nil;
    self.navigationController = nil;
    
    [_window release];
    [super dealloc];
}

@end

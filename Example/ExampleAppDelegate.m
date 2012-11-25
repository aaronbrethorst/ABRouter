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
#import "ObjectViewController.h"

@implementation ExampleAppDelegate

@synthesize window = _window;
@synthesize rootViewController, navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[ABRouter sharedRouter] match:@"/photos" to:[PhotoListViewController class]];
    [[ABRouter sharedRouter] match:@"/photos/:id" to:[PhotoViewController class]];
    [[ABRouter sharedRouter] match:@"/albums" to:[AlbumListViewController class]];
    [[ABRouter sharedRouter] match:@"/albums/:id" to:[PhotoListViewController class]];
    [[ABRouter sharedRouter] match:@"/object" to:[ObjectViewController class]];

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

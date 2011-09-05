//
//  ExampleAppDelegate.h
//  Example
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface ExampleAppDelegate : NSObject <UIApplicationDelegate>
@property(nonatomic,retain) IBOutlet UIWindow *window;
@property(nonatomic,retain) RootViewController *rootViewController;
@property(nonatomic,retain) UINavigationController *navigationController;
@end

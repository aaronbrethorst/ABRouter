//
//  GowallaExampleAppDelegate.h
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpotsTableViewController;

@interface GowallaExampleAppDelegate : NSObject <UIApplicationDelegate>
@property(nonatomic,retain) SpotsTableViewController *spotsTableViewController;
@property(nonatomic,retain) UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

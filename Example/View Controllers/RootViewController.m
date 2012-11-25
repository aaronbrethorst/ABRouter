//
//  RootViewController.m
//  Example
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (id)init
{
    self = [super initWithNibName:@"RootViewController" bundle:nil];
    if (self)
    {
        self.title = NSStringFromClass([self class]);
    }
    return self;
}

#pragma mark - IBActions

- (IBAction)viewAlbums:(id)sender
{
    [[ABRouter sharedRouter] navigateTo:@"/albums" withNavigationController:self.navigationController];
}

- (IBAction)viewPhotos:(id)sender
{
    [[ABRouter sharedRouter] navigateTo:@"/photos" withNavigationController:self.navigationController];
}

- (IBAction)viewObject:(id)sender
{
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:[NSDate date],@"date",nil];
    [[ABRouter sharedRouter] navigateTo:@"/object" withNavigationController:self.navigationController andQuery:query];
}


- (IBAction)modal:(id)sender
{
    [[ABRouter sharedRouter] modallyPresent:@"/photos" from:self];
}

@end

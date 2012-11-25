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
    [[ABRouter sharedRouter] navigateTo:@"/photos" navigationController:self.navigationController parameters:nil];
}

- (IBAction)viewObject:(id)sender
{
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:[NSDate date],@"date",nil];
    [[ABRouter sharedRouter] navigateTo:@"/object" navigationController:self.navigationController parameters:query];
}


- (IBAction)modal:(id)sender
{
    [[ABRouter sharedRouter] modallyPresent:@"/photos" from:self];
}

@end

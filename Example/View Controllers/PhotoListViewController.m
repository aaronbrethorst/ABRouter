//
//  PhotoListViewController.m
//  Example
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "PhotoListViewController.h"

@implementation PhotoListViewController
@synthesize apiPath;
@synthesize pathLabel;

- (id)init
{
    self = [super initWithNibName:@"PhotoListViewController" bundle:nil];
    if (self)
    {
        self.title = NSStringFromClass([self class]);
    }
    return self;
}

- (void)dealloc
{
    self.apiPath = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pathLabel.text = [NSString stringWithFormat:@"Welcome to %@", self.apiPath];
}

- (IBAction)showPhoto:(id)sender
{
    [[ABRouter sharedRouter] navigateTo:[NSString stringWithFormat:@"/photos/%d", [sender tag]] withNavigationController:self.navigationController];
}

@end

//
//  AlbumListViewController.m
//  Example
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "AlbumListViewController.h"

@implementation AlbumListViewController
@synthesize apiPath;
@synthesize pathLabel;

- (id)init
{
    self = [super initWithNibName:@"AlbumListViewController" bundle:nil];
    if (self)
    {
        self.title = NSStringFromClass([self class]);
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.pathLabel.text = [NSString stringWithFormat:@"Welcome to %@", self.apiPath];
}

#pragma mark - IBActions

- (IBAction)showAlbum:(id)sender
{
    int tag = [sender tag];
    
    [[ABRouter sharedRouter] navigateTo:[NSString stringWithFormat:@"/albums/%d", tag] withNavigationController:self.navigationController];
}

@end

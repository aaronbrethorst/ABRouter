//
//  SpotViewController.m
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/5/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "SpotViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation SpotViewController
@synthesize categoryImage, businessName;
@synthesize photoOne, photoTwo, photoThree, photoFour, photoFive;
@synthesize photoURLs;
@synthesize apiPath;
@synthesize spot;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.photoURLs = [NSMutableArray array];
    
    [[AFGowallaAPIClient sharedClient] getPath:self.apiPath parameters:nil success:^(id response) {
        self.spot = response;
        self.businessName.text = [response objectForKey:@"name"];
        [self.categoryImage setImageWithURL:[NSURL URLWithString:[response objectForKey:@"image_url"]]];
        
        [[AFGowallaAPIClient sharedClient] getPath:[response objectForKey:@"photos_url"] parameters:nil success:^(id response) {
            
            for (NSDictionary *p in [response objectForKey:@"activity"])
            {
                NSString *url = [[p objectForKey:@"photo_urls"] objectForKey:@"square_50"];
                [self.photoURLs addObject:[NSURL URLWithString:url]];
            }           
            
            if ([self.photoURLs count] > 0)
            {
                [self.photoOne setImageWithURL:[self.photoURLs objectAtIndex:0]];
            }
            
            if ([self.photoURLs count] > 1)
            {
                [self.photoOne setImageWithURL:[self.photoURLs objectAtIndex:1]];
            }
            
            if ([self.photoURLs count] > 2)
            {
                [self.photoOne setImageWithURL:[self.photoURLs objectAtIndex:2]];
            }
            
            if ([self.photoURLs count] > 3)
            {
                [self.photoOne setImageWithURL:[self.photoURLs objectAtIndex:3]];
            }
            
            if ([self.photoURLs count] > 4)
            {
                [self.photoOne setImageWithURL:[self.photoURLs objectAtIndex:4]];
            }
        }];
    }];
}

#pragma mark - IBActions

- (IBAction)viewCheckins:(id)sender
{
    [[ABRouter sharedRouter] navigateTo:[self.spot objectForKey:@"activity_url"]
               withNavigationController:self.navigationController];
}

@end

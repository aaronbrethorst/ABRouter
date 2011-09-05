//
//  SpotsTableViewController.m
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "SpotsTableViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation SpotsTableViewController
@synthesize tableData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Spots";
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
    
    self.tableView.rowHeight = 60;
    
    self.tableData = [[[NSMutableArray alloc] init] autorelease];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:47.623318], @"lat", [NSNumber numberWithFloat:-122.312937], @"lng", [NSNumber numberWithInt:50], @"radius", nil];
    
    [[AFGowallaAPIClient sharedClient] getPath:@"/spots" parameters:params success:^(id response) {
        [self.tableData removeAllObjects];
        [self.tableData addObjectsFromArray:[response objectForKey:@"spots"]];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] autorelease];
        [alert show];
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.tableData = nil;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *spot = [self.tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = [spot objectForKey:@"name"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[spot objectForKey:@"_image_url_50"]]
                   placeholderImage:[UIImage imageNamed:@"empty_50.png"]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[ABRouter sharedRouter] navigateTo:[[self.tableData objectAtIndex:indexPath.row] objectForKey:@"activity_url"]
               withNavigationController:self.navigationController];
}

@end

//
//  CheckinsTableViewController.m
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "CheckinsTableViewController.h"

@implementation CheckinsTableViewController
@synthesize tableData;
@synthesize apiPath;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.title = @"Checkins";
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
    
    self.tableData = [[[NSMutableArray alloc] init] autorelease];
    
    [[AFGowallaAPIClient sharedClient] getPath:self.apiPath parameters:nil success:^(id response) {
        
        [self.tableData removeAllObjects];
        [self.tableData addObjectsFromArray:[response objectForKey:@"activity"]];
        [self.tableView reloadData];
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
    }
    
    NSDictionary *activity = [self.tableData objectAtIndex:indexPath.row];
    
    NSString *activityType = [activity objectForKey:@"type"];
    NSString *activityUser = [[activity objectForKey:@"user"] objectForKey:@"first_name"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ by %@", activityType, activityUser];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

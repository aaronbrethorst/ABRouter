//
//  RootViewController.m
//  MappingExample
//
//  Created by Aaron Brethorst on 9/11/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Mapping Example";
    
    tableItems = [[NSMutableArray alloc] init];
    [tableItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"/map?lat=37.331676&lng=-122.030243&name=Apple", @"path", @"Apple", @"name", nil]];
    [tableItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"/map?lat=37.423097&lng=-122.082642&name=Google", @"path", @"Google", @"name", nil]];
    [tableItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"/map?lat=47.673132&lng=-122.118487&name=Microsoft", @"path", @"Microsoft", @"name", nil]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[tableItems objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[ABRouter sharedRouter] navigateTo:[[tableItems objectAtIndex:indexPath.row] objectForKey:@"path"] withNavigationController:self.navigationController];
}

@end

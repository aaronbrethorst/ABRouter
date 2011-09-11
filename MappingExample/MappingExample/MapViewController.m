//
//  MapViewController.m
//  MappingExample
//
//  Created by Aaron Brethorst on 9/11/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController
@synthesize apiPath, parameters, mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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
    
    self.title = [self.parameters objectForKey:@"name"];
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake([[self.parameters objectForKey:@"lat"] floatValue], [[self.parameters objectForKey:@"lng"] floatValue]) addressDictionary:[NSDictionary dictionary]];
    [self.mapView addAnnotation:placemark];    
    [self.mapView setRegion:MKCoordinateRegionMake(placemark.coordinate, MKCoordinateSpanMake(0.2, 0.2)) animated:YES];
    [placemark release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

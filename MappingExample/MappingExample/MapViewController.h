//
//  MapViewController.h
//  MappingExample
//
//  Created by Aaron Brethorst on 9/11/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <Routable>
@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,retain) NSString *apiPath;
@property(nonatomic,retain) NSDictionary *parameters;
@end

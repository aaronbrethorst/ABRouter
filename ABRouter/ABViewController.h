//
//  ABViewController.h
//  Example
//
//  Created by Pierre on 25/11/12.
//  Copyright (c) 2012 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABViewController : UIViewController <Routable>

@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, retain) NSString *apiPath;

@end

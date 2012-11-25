//
//  ObjectViewController.h
//  Example
//
//  Created by Pierre on 25/11/12.
//  Copyright (c) 2012 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectViewController : UIViewController <Routable>
@property (nonatomic, retain) NSString *apiPath;
@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic,retain) IBOutlet UILabel *dateLabel;
@end

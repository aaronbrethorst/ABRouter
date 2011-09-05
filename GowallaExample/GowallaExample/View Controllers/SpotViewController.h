//
//  SpotViewController.h
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/5/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotViewController : UIViewController <Routable>
@property(nonatomic,retain) NSString *apiPath;
@end

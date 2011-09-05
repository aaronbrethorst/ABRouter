//
//  SpotViewController.h
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/5/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotViewController : UIViewController <Routable>
@property(nonatomic,retain) NSMutableArray *photoURLs;
@property(nonatomic,retain) IBOutlet UIImageView *categoryImage;
@property(nonatomic,retain) IBOutlet UILabel *businessName;
@property(nonatomic,retain) IBOutlet UIImageView *photoOne;
@property(nonatomic,retain) IBOutlet UIImageView *photoTwo;
@property(nonatomic,retain) IBOutlet UIImageView *photoThree;
@property(nonatomic,retain) IBOutlet UIImageView *photoFour;
@property(nonatomic,retain) IBOutlet UIImageView *photoFive;
@property(nonatomic,retain) NSString *apiPath;
@property(nonatomic,retain) NSDictionary *spot;
- (IBAction)viewCheckins:(id)sender;
@end

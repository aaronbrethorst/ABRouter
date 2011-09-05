//
//  PhotoListViewController.h
//  Example
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoListViewController : UIViewController <Routable>
@property(nonatomic,retain) IBOutlet UILabel *pathLabel;
- (IBAction)showPhoto:(id)sender;
@end

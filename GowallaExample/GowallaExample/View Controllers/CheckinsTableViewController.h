//
//  CheckinsTableViewController.h
//  GowallaExample
//
//  Created by Aaron Brethorst on 9/4/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckinsTableViewController : UITableViewController <Routable>
@property(nonatomic,retain) NSMutableArray *tableData;
@property(nonatomic,retain) NSString *apiPath;
@end

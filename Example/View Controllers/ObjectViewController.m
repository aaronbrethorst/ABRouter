//
//  ObjectViewController.m
//  Example
//
//  Created by Pierre on 25/11/12.
//  Copyright (c) 2012 Structlab LLC. All rights reserved.
//

#import "ObjectViewController.h"

@interface ObjectViewController ()

@end

@implementation ObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    self.parameters = nil;
    self.apiPath = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDate *date = [self.parameters objectForKey:@"date"];
    [self.dateLabel setText:[NSString stringWithFormat:@"%@",date]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  RootViewController.m
//  IGUtils
//
//  Created by Francis Chong on 11年6月14日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "RootViewController.h"

#import "IGClearLabelsCellView.h"
#import "IGGradientView.h"
#import "SampleViewController.h"
#import "SampleTableViewController.h"

@implementation RootViewController

@synthesize btnCustomView, btnShadowTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)dealloc
{
    [super dealloc];
}

-(IBAction) showCustomViewController {
    SampleViewController* controller = [[[SampleViewController alloc] init] autorelease];   
    UINavigationController* navController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
    [self presentModalViewController:navController animated:YES];
}

-(IBAction) showShadowTableViewController {
    SampleTableViewController* controller = [[[SampleTableViewController alloc] init] autorelease];
    UINavigationController* navController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
    [self presentModalViewController:navController animated:YES];
}


@end

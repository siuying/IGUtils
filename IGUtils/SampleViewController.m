//
//  SampleViewController.m
//  IGUtils
//
//  Created by Francis Chong on 11年7月5日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "SampleViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation SampleViewController

@synthesize progress, loadingView, gradView, tagsView;

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
    self.progress = nil;
    self.loadingView=  nil;
    self.gradView = nil;
    self.tagsView = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [progress setWidth:4.0];
    [progress setRadius:10.0];
    [progress setColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    [progress setProgress:0.5];
    [progress setNeedsDisplay];
    
    [gradView setGradientFromColor:[UIColor blackColor] toColor:[UIColor blueColor]];

    [tagsView setFont:[UIFont systemFontOfSize:14]];
    [tagsView setTags:[NSArray arrayWithObjects:@"Hello", @"World", @"Foo", @"Bar", nil]];

    self.navigationItem.title = @"Custom Views";    
    UIBarButtonItem* item = [[[UIBarButtonItem alloc] initWithTitle:@"Done" 
                                                              style:UIBarButtonItemStyleDone 
                                                             target:self 
                                                             action:@selector(done:)] autorelease];
    self.navigationItem.rightBarButtonItem = item;
    
    UILabel* label = (UILabel*) [self.view viewWithTag:6500];
    label.layer.cornerRadius = 4;


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.progress = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) showLoading:(id)sender {
    if (!self.loadingView) {
        self.loadingView = [[IGLoadingView alloc] initWithFrame:self.view.frame];
    }
    [self.view addSubview:self.loadingView];
    [self.loadingView layoutSubviews];
    
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:5.0];
    
}

-(void) hideLoading {
    [self.loadingView removeFromSuperview];
}

@end

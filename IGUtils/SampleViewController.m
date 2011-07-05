//
//  SampleViewController.m
//  IGUtils
//
//  Created by Francis Chong on 11年7月5日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "SampleViewController.h"


@implementation SampleViewController

@synthesize progress;

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
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [progress setColor:[UIColor blackColor]];
    [progress setProgress:0.5];
    
    self.navigationItem.title = @"Custom Views";    
    UIBarButtonItem* item = [[[UIBarButtonItem alloc] initWithTitle:@"Done" 
                                                              style:UIBarButtonItemStyleDone 
                                                             target:self 
                                                             action:@selector(done:)] autorelease];
    self.navigationItem.rightBarButtonItem = item;

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
@end

//
//  SampleTableViewController.m
//  IGUtils
//
//  Created by Francis Chong on 11年7月5日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "SampleTableViewController.h"
#import "IGClearLabelsCellView.h"
#import "IGGradientView.h"

@implementation SampleTableViewController

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

-(void) loadView {
    [super loadView];
    
    self.navigationItem.title = @"IGShadowedTableView";    
    UIBarButtonItem* item = [[[UIBarButtonItem alloc] initWithTitle:@"Done" 
                                                              style:UIBarButtonItemStyleDone 
                                                             target:self 
                                                             action:@selector(done:)] autorelease];
    self.navigationItem.rightBarButtonItem = item;
}

-(void) done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[IGClearLabelsCellView alloc] initWithStyle:UITableViewCellStyleDefault 
                                             reuseIdentifier:CellIdentifier] autorelease];
        
        IGGradientView* gradientView = [[[IGGradientView alloc] init] autorelease];
        cell.backgroundView = gradientView;
        [gradientView setGradientFromColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] 
                                   toColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"Some text for row %ld", indexPath.row + 1];
	
    // Configure the cell.
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

//
//  RootViewController.m
//  IGUtils
//
//  Created by Francis Chong on 11年6月14日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "RootViewController.h"
#import "IGGradientView.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

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
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

	cell.textLabel.text = [NSString stringWithFormat:@"Some text for row %ld", indexPath.row + 1];
	
    // Configure the cell.
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc
{
    [super dealloc];
}

@end

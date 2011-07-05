//
//  RootViewController.h
//  IGUtils
//
//  Created by Francis Chong on 11年6月14日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {

}

@property (nonatomic, retain) IBOutlet UIButton* btnCustomView;
@property (nonatomic, retain) IBOutlet UIButton* btnShadowTable;

-(IBAction) showCustomViewController;
-(IBAction) showShadowTableViewController;

@end

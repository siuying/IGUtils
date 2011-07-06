//
//  SampleViewController.h
//  IGUtils
//
//  Created by Francis Chong on 11年7月5日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGProgressView.h"
#import "IGLoadingView.h"
#import "IGGradientView.h"
#import "IGTagsView.h"

@interface SampleViewController : UIViewController {
    
}

@property (nonatomic, retain) IBOutlet IGProgressView* progress;
@property (nonatomic, retain) IBOutlet IGGradientView* gradView;
@property (nonatomic, retain) IBOutlet IGLoadingView* loadingView;
@property (nonatomic, retain) IBOutlet IGTagsView* tagsView;

-(IBAction) showLoading:(id)sender;
-(void) hideLoading;

@end

//
//  IGLoadingView.h
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IGLoadingView : UIView
{
    UILabel* lblLoading;
    UIActivityIndicatorView* actLoading;
}

@property (nonatomic, retain)     UILabel* lblLoading;
@property (nonatomic, retain)     UIActivityIndicatorView* actLoading;

@end

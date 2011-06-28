//
//  IGShadowedTableView.h
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface IGShadowedTableView : UITableView
{
	CAGradientLayer *originShadow;
	CAGradientLayer *topShadow;
	CAGradientLayer *bottomShadow;
}

@end

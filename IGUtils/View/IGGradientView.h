//
//  IGGradientView.h
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IGGradientView : UIView

- (id)initWithFrame:(CGRect)frame withGradientFromColor:(UIColor*)color1 toColor:(UIColor*)color2;
- (void)setGradientFromColor:(UIColor*)color1 toColor:(UIColor*)color2;

@end

//
//  IGGradientView.m
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "IGGradientView.h"

#import <QuartzCore/QuartzCore.h>

@implementation IGGradientView

+ (Class)layerClass {
	return [CAGradientLayer class];
}

- (void)setGradientFromColor:(UIColor*)color1 toColor:(UIColor*)color2 {
	CAGradientLayer *gradientLayer = (CAGradientLayer *) self.layer;
	gradientLayer.colors = [NSArray arrayWithObjects:(id)color1.CGColor, (id)color2.CGColor, nil];
	self.backgroundColor = [UIColor clearColor];
}

- (id)initWithFrame:(CGRect)frame withGradientFromColor:(UIColor*)color1 toColor:(UIColor*)color2{
    self = [super initWithFrame:frame];
	if (self) {
		[self setGradientFromColor:color1 toColor:color2];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame 
         withGradientFromColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] 
                       toColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]];
}

@end

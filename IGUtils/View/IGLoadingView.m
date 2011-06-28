//
//  IGLoadingView.m
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "IGLoadingView.h"

@implementation IGLoadingView

@synthesize lblLoading, actLoading;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lblLoading                 = [[[UILabel alloc] init] autorelease];
        self.lblLoading.textAlignment   = UITextAlignmentCenter;
        self.lblLoading.text            = NSLocalizedString(@"Loading ...", @"");
        self.lblLoading.numberOfLines   = 1;
        self.lblLoading.backgroundColor = [UIColor clearColor];
        [self addSubview:self.lblLoading];
        
        self.actLoading                 = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
        [self.actLoading startAnimating];
        [self addSubview:self.actLoading];
    }
    return self;
}

- (void)layoutSubviews {
    [self.lblLoading sizeToFit];

    CGRect mainFrame = self.frame;   
    CGFloat x = (mainFrame.size.width-self.lblLoading.frame.size.width)/2;
    CGFloat y = (mainFrame.size.height-self.lblLoading.frame.size.height)/2;

    self.lblLoading.frame = CGRectIntegral(CGRectMake(x, y, 
                                       self.lblLoading.frame.size.width, self.lblLoading.frame.size.height));
    
    CGFloat actX = self.lblLoading.frame.origin.x - self.actLoading.frame.size.width - 5.0;
    CGFloat actY = self.lblLoading.frame.origin.y + (self.lblLoading.frame.size.height- self.actLoading.frame.size.height)/2.0;
    self.actLoading.frame = CGRectIntegral(CGRectMake(actX, actY,
                                       self.actLoading.frame.size.width, self.actLoading.frame.size.height));
}

@end

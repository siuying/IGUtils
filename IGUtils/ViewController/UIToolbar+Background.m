//
//  UIToolbar+Background.m
//  Scopy
//
//  Created by Chong Francis on 11年6月10日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#pragma LLVM diagnostic ignored "-Wno-method-not-found"

#import "UIToolbar+Background.h"

#ifndef UIBarMetricsDefault
#define UIBarMetricsDefault 0
#endif

#ifndef UIToolbarPositionBottom
#define UIToolbarPositionBottom 1
#endif

#ifndef UIToolbarPosition
#define UIToolbarPosition int
#endif

#ifndef UIBarMetrics
#define UIBarMetrics int
#endif

@interface UIToolbar (BGPrivate)
- (void)setBackgroundImage:(UIImage *)backgroundImage forToolbarPosition:(UIToolbarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics;
@end

@implementation UIToolbar (Background)

-(void) setBackgroundImage:(UIImage*)backgroundImage {
    
    if ([self respondsToSelector:@selector(setBackgroundImage:forToolbarPosition:barMetrics:)]) {
        [self setBackgroundImage:backgroundImage
              forToolbarPosition:UIToolbarPositionBottom 
                      barMetrics:UIBarMetricsDefault];        
    } else {
        UIImageView* background = [[[UIImageView alloc] initWithImage:backgroundImage] autorelease];
        background.frame = CGRectMake(0, 0, background.frame.size.width, background.frame.size.height);
        [self insertSubview:background
                    atIndex:0];
    }
}

@end

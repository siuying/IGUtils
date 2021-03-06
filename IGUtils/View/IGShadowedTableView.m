//
//  IGShadowedTableView.m
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//
//  Original ShadowedTableView.m by Matt Gallagher.
//  Created by Matt Gallagher on 2009/08/21.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//

#import "IGShadowedTableView.h"

#define SHADOW_HEIGHT 20.0
#define SHADOW_INVERSE_HEIGHT 10.0
#define SHADOW_RATIO (SHADOW_INVERSE_HEIGHT / SHADOW_HEIGHT)

@implementation IGShadowedTableView


//
// shadowAsInverse:
//
// Create a shadow layer
//
// Parameters:
//    inverse - if YES then shadow fades upwards, otherwise shadow fades downwards
//
// returns the constructed shadow layer
//
- (CAGradientLayer *)shadowAsInverse:(BOOL)inverse {
	CAGradientLayer *newShadow = [[[CAGradientLayer alloc] init] autorelease];
	CGRect newShadowFrame =
    CGRectMake(0, 0, self.frame.size.width,
               inverse ? SHADOW_INVERSE_HEIGHT : SHADOW_HEIGHT);
	newShadow.frame = newShadowFrame;
	CGColorRef darkColor =
    [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:
     inverse ? (SHADOW_INVERSE_HEIGHT / SHADOW_HEIGHT) * 0.5 : 0.5].CGColor;
	CGColorRef lightColor =
    [self.backgroundColor colorWithAlphaComponent:0.0].CGColor;
	newShadow.colors =
    [NSArray arrayWithObjects:
     (id)(inverse ? lightColor : darkColor),
     (id)(inverse ? darkColor : lightColor),
     nil];
	return newShadow;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
	if (self) {
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	//
	// Construct the origin shadow if needed
	//
	if (!originShadow) {
		originShadow = [self shadowAsInverse:NO];
		[self.layer insertSublayer:originShadow atIndex:0];
	} else if (![[self.layer.sublayers objectAtIndex:0] isEqual:originShadow]) {
		[self.layer insertSublayer:originShadow atIndex:0];
	}
	
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    
	//
	// Stretch and place the origin shadow
	//
	CGRect originShadowFrame = originShadow.frame;
	originShadowFrame.size.width = self.frame.size.width;
	originShadowFrame.origin.y = self.contentOffset.y;
	originShadow.frame = originShadowFrame;
	
	[CATransaction commit];
	
    if (self.tableHeaderView) {
        UIView *cell = [self tableHeaderView];
        if (!topShadow) {
            topShadow = [[self shadowAsInverse:YES] retain];
            [cell.layer insertSublayer:topShadow atIndex:0];
        } else if ([cell.layer.sublayers indexOfObjectIdenticalTo:topShadow] != 0) {
            [cell.layer insertSublayer:topShadow atIndex:0];
        }
        
        CGRect shadowFrame = topShadow.frame;
        shadowFrame.size.width = cell.frame.size.width;
        shadowFrame.origin.y = -SHADOW_INVERSE_HEIGHT;
        topShadow.frame = shadowFrame;
    } else {
        NSArray *indexPathsForVisibleRows = [self indexPathsForVisibleRows];
        if ([indexPathsForVisibleRows count] == 0) {
            [topShadow removeFromSuperlayer];
            [topShadow release];
            topShadow = nil;
            return;
        }
        
        NSIndexPath *firstRow = [indexPathsForVisibleRows objectAtIndex:0];
        if ([firstRow section] == 0 && [firstRow row] == 0) {
            UIView *cell = [self cellForRowAtIndexPath:firstRow];
            if (!topShadow) {
                topShadow = [[self shadowAsInverse:YES] retain];
                [cell.layer insertSublayer:topShadow atIndex:0];
            } else if ([cell.layer.sublayers indexOfObjectIdenticalTo:topShadow] != 0) {
                [cell.layer insertSublayer:topShadow atIndex:0];
            }
            
            CGRect shadowFrame = topShadow.frame;
            shadowFrame.size.width = cell.frame.size.width;
            shadowFrame.origin.y = -SHADOW_INVERSE_HEIGHT;
            topShadow.frame = shadowFrame;
        } else {
            [topShadow removeFromSuperlayer];
            [topShadow release];
            topShadow = nil;
        }
    }

    NSArray *indexPathsForVisibleRows = [self indexPathsForVisibleRows];
    if ([indexPathsForVisibleRows count] == 0) {
        [bottomShadow removeFromSuperlayer];
        [bottomShadow release];
        bottomShadow = nil;
        return;
    }
    
	NSIndexPath *lastRow = [indexPathsForVisibleRows lastObject];
	if ([lastRow section] == [self numberOfSections] - 1 &&
		[lastRow row] == [self numberOfRowsInSection:[lastRow section]] - 1) {
		UIView *cell =
        [self cellForRowAtIndexPath:lastRow];
		if (!bottomShadow) {
			bottomShadow = [[self shadowAsInverse:NO] retain];
			[cell.layer insertSublayer:bottomShadow atIndex:0];
		} else if ([cell.layer.sublayers indexOfObjectIdenticalTo:bottomShadow] != 0) {
			[cell.layer insertSublayer:bottomShadow atIndex:0];
		}
        
		CGRect shadowFrame = bottomShadow.frame;
		shadowFrame.size.width = cell.frame.size.width;
		shadowFrame.origin.y = cell.frame.size.height;
		bottomShadow.frame = shadowFrame;
	} else {
		[bottomShadow removeFromSuperlayer];
		[bottomShadow release];
		bottomShadow = nil;
	}
}

- (void)dealloc {
	[topShadow release];
	[bottomShadow release];
    
	[super dealloc];
}


@end

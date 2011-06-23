//
//  SPProgressView.h
//  Progress
//
//  Created by Francis Chong on 10年12月21日.
//  Copyright 2010 Ignition Soft Limited. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IGProgressView : UIView {
	CGFloat		_width;
	CGFloat		_radius;
	UIColor*	_color;

	CGFloat		_progress;
}

// look and feel of tghe progress bar
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, retain) UIColor* color;

// progress, 0.0 - 1.0
@property (nonatomic, assign) CGFloat progress;

-(id) initWithFrame:(CGRect)theFrame;

@end

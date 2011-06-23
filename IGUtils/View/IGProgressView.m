//
//  SPProgressView.m
//  Progress
//
//  Created by Francis Chong on 10年12月21日.
//  Copyright 2010 Ignition Soft Limited. All rights reserved.
//

#import "IGProgressView.h"

@interface UIColor (Components)
- (CGFloat) red;
- (CGFloat) green;
- (CGFloat) blue;
- (CGFloat) alpha;
@end

@implementation UIColor (Components)

- (CGFloat) red
{
	const CGFloat *c = CGColorGetComponents(self.CGColor);
	return c[0];
}

- (CGFloat) green
{
	const CGFloat *c = CGColorGetComponents(self.CGColor);
	return c[1];
}

- (CGFloat) blue
{
	const CGFloat *c = CGColorGetComponents(self.CGColor);
	return c[2];
}

- (CGFloat) alpha
{
	const CGFloat *c = CGColorGetComponents(self.CGColor);
	return c[CGColorGetNumberOfComponents(self.CGColor)-1];
}

@end


@implementation IGProgressView

@synthesize radius = _radius;
@synthesize width = _width;
@synthesize progress = _progress;
@synthesize color = _color;

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super initWithCoder:decoder])) {
		self.backgroundColor	= [UIColor clearColor];
		self.color				= [UIColor grayColor];
		self.opaque				= YES;
		self.radius				= 10.0;
		self.width				= 4.0; 
		self.clearsContextBeforeDrawing = YES;

    }
    return self;
}

-(id) initWithFrame:(CGRect)theFrame {
    if ((self = [super initWithFrame:theFrame])) {
		self.backgroundColor	= [UIColor clearColor];
		self.color				= [UIColor grayColor];
		self.opaque				= YES;
		self.radius				= 10.0;
		self.width				= 4.0; 
		self.clearsContextBeforeDrawing = YES;
		
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBStrokeColor(context, self.color.red, self.color.green, self.color.blue, self.color.alpha);
	CGContextSetRGBFillColor(context, self.color.red, self.color.green, self.color.blue, self.color.alpha);
	
	CGContextSetLineWidth(context, self.width);

	CGRect rrect = CGRectInset(rect, self.width, self.width);
	rrect = CGRectMake(rrect.origin.x, rrect.size.height / 2.0 - self.radius, 
					   rrect.size.width, 2*self.radius);

	// outline
	CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
	CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
	CGFloat radius = self.radius;
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	CGContextStrokePath(context);
	
	rrect = CGRectInset(rrect, self.width, self.width);
	rrect = CGRectMake(rrect.origin.x, rrect.origin.y, (rrect.size.width-self.radius) * _progress + self.radius, rrect.size.height);
	minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
	miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
	radius = self.radius - self.width;
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathFill);
	
}

-(void) setProgress:(CGFloat)theProgress {
	if (theProgress < 0.0) {
		_progress = 0.0;
	} else if (theProgress > 1.0) {
		_progress = 1.0;
	} else {
		_progress = theProgress;
	}	
	[self setNeedsDisplay];
}

-(void) dealloc {
	self.color = nil;
	[super dealloc];
}


@end

//
//  UIViewController+Toast.m
//  QuickNote
//
//  Created by Francis Chong on 10年8月25日.
//  Copyright 2010 Ignition Soft Limited. All rights reserved.
//

#import "UIViewController+Toast.h"
#import "CBorderView.h"

#define kToastAnimationTime	0.5

#define kImageToastHeight	220.0

#define kToastHeight		40.0

#define kToastVPadding		6.0
#define kToastHPadding		18.0

#define kToastVMargin		30.0
#define kToastBackgroundColor		[UIColor colorWithRed:60.0/255.0 green:28.0/255.0 blue:14.0/255.0 alpha:0.6]
#define kToastTextColor				[UIColor colorWithRed:247.0/255.0 green:238.0/255.0 blue:228.0/255.0 alpha:1.0]

@interface UIViewController (ToastPrivate)
-(void) toastViewDidHidden:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

-(UIView*) createToastView:(NSString*)message withSubview:(UIView*)subview;
-(UIView*) createToastView:(NSString*)message withWidth:(CGFloat)width;

-(void) fadeInView:(UIView*)theView;
@end

@implementation UIViewController (Toast)

-(UIView*) showToastOnView:(UIView*)toastHolderView message:(NSString*)message duration:(NSTimeInterval)duration {
	return [self showToastOnView:toastHolderView message:message valign:ToastVAlignBottom duration:duration];
}

-(UIView*) showProgressingView:(UIView*)toastHolderView message:(NSString*)message {
	return [self showProgressingView:toastHolderView message:message duration:0.0];
}

-(UIView*) showProgressingView:(UIView*)toastHolderView message:(NSString*)message duration:(NSTimeInterval)duration {
	UIActivityIndicatorView* activity = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
	activity.hidesWhenStopped = NO;
	[activity startAnimating];
	
	UIView* toastView		= [self createToastView:message withSubview:activity];
	toastView.frame			= CGRectMake((toastHolderView.frame.size.width - toastView.frame.size.width) / 2.0, 
										 (toastHolderView.frame.size.height - toastView.frame.size.height) / 2.0, 
										 toastView.frame.size.width, 
										 toastView.frame.size.height);
	[toastHolderView addSubview:toastView];
	[self fadeInView:toastView];
	
	if (duration > 0.0) {
		[self performSelector:@selector(hideToastView:) 
				   withObject:toastView 
				   afterDelay:duration];
	}

	return toastView;
}

-(UIView*) showToastOnView:(UIView*)toastHolderView message:(NSString*)message valign:(ToastVAlign)valign duration:(NSTimeInterval)duration {
	UIView* toastView		= [self createToastView:message withWidth:toastHolderView.frame.size.width];
	CGFloat actualSize		= 0.0;
	CGSize messageSize		= [message sizeWithFont:[UIFont systemFontOfSize:15.0]
									minFontSize:10.0 
								 actualFontSize:(&actualSize)
									   forWidth:(toastView.frame.size.width - (kToastHPadding * 2.0)) 
								  lineBreakMode:UILineBreakModeTailTruncation];
	
	// Vertical Alignment
	CGFloat top = 0.0;
	switch (valign) {
		case ToastVAlignTop:
			top = kToastVMargin;
			break;
		case ToastVAlignCenter:
			top = (toastHolderView.frame.size.height - toastView.frame.size.height) / 2.0;
			break;
		default:
			// bottom
			top = toastHolderView.frame.size.height - toastView.frame.size.height - kToastVMargin;
			break;
	}
	
	toastView.frame			= CGRectMake((toastHolderView.frame.size.width - messageSize.width)/2.0 - kToastHPadding, 
										 top, 
										 messageSize.width + 2.0 * kToastHPadding, 
										 kToastHeight);
	[toastHolderView addSubview:toastView];
	[self fadeInView:toastView];
	
	if (duration > 0.0) {
		[self performSelector:@selector(hideToastView:) 
				   withObject:toastView 
				   afterDelay:duration];
	}

	return toastView;
}

// show a toast view, which will be dismissed after duration
-(UIView*) showToastOnView:(UIView*)toastHolderView message:(NSString*)message image:(UIImage*)image duration:(NSTimeInterval)duration {
	UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
	UIView* toastView		= [self createToastView:message withSubview:imageView];
	toastView.frame			= CGRectMake((toastHolderView.frame.size.width - toastView.frame.size.width) / 2.0, 
										 (toastHolderView.frame.size.height - toastView.frame.size.height) / 2.0, 
										 toastView.frame.size.width, 
										 toastView.frame.size.height);
	[toastHolderView addSubview:toastView];
	[self fadeInView:toastView];
	
	if (duration > 0.0) {
		[self performSelector:@selector(hideToastView:) 
				   withObject:toastView 
				   afterDelay:duration];
	}

	return toastView;
}

-(void) hideToastView:(UIView*)toastView {
	[UIView beginAnimations:nil context:toastView];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(toastViewDidHidden:finished:context:)];
	[UIView setAnimationDuration:kToastAnimationTime];
	toastView.alpha = 0.0;
	[UIView commitAnimations];
}

-(void) toastViewDidHidden:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	UIView* toastView = context;
	[toastView removeFromSuperview];
}

-(UIView*) createToastView:(NSString*)message withWidth:(CGFloat)width {
	CBorderView* toastView	= [[[CBorderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, kToastHeight)] autorelease];
	toastView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	toastView.cornerRadius	= 10.0;
	toastView.fillColor		= kToastBackgroundColor;
	toastView.frameColor	= [UIColor clearColor];
	toastView.userInteractionEnabled = NO;
	
	UILabel* label			= [[[UILabel alloc] initWithFrame:CGRectMake(kToastHPadding, 
																		 kToastVPadding, 
																		 toastView.frame.size.width  - kToastHPadding * 2.0, 
																		 toastView.frame.size.height - kToastVPadding * 2.0)] autorelease];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	label.backgroundColor	= [UIColor clearColor];
	label.textColor			= kToastTextColor;
	label.numberOfLines		= 0;
	label.font				= [UIFont systemFontOfSize:15.0];
	label.minimumFontSize	= 10.0;
	label.text				= message;
	label.textAlignment		= UITextAlignmentCenter;
	label.adjustsFontSizeToFitWidth = YES;

	[toastView addSubview:label];	
	return toastView;
}

-(UIView*) createToastView:(NSString*)message withSubview:(UIView*)subview {
	CBorderView* toastView		= [[[CBorderView alloc] initWithFrame:CGRectMake(0.0, 0.0, kImageToastHeight, kImageToastHeight)] autorelease];
	toastView.cornerRadius		= 10.0;
	toastView.fillColor			= kToastBackgroundColor;
	toastView.frameColor		= [UIColor clearColor];
	toastView.userInteractionEnabled = NO;

	UIView* wrapper			= [[[UIView alloc] initWithFrame:toastView.frame] autorelease];
	wrapper.backgroundColor = [UIColor clearColor];
	wrapper.autoresizesSubviews = YES;
	[toastView addSubview:wrapper];
	[toastView layoutSubviews];
	
	UILabel* label			= [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 
																		 toastView.frame.size.height - 3 * kToastVPadding - 60.0, 
																		 toastView.frame.size.width - 20.0, 
																		 60.0)] autorelease];
	label.backgroundColor	= [UIColor clearColor];
	label.textColor			= kToastTextColor;
	label.numberOfLines		= 3;
	label.lineBreakMode		= UILineBreakModeWordWrap;
	label.font				= [UIFont boldSystemFontOfSize:15.0];
	label.minimumFontSize	= 10.0;
	label.text				= message;
	label.textAlignment		= UITextAlignmentCenter;
	label.adjustsFontSizeToFitWidth = YES;
	toastView.autoresizingMask	= UIViewAutoresizingNone;
	[wrapper addSubview:label];
	
	subview.frame				= CGRectMake((wrapper.frame.size.width - subview.frame.size.width) / 2.0, 
											 (wrapper.frame.size.height - subview.frame.size.height) / 2.0 - kToastVPadding, 
											 subview.frame.size.width, 
											 subview.frame.size.height);
	[wrapper addSubview:subview];
	
	
	return toastView;
}

-(void) fadeInView:(UIView*)theView {
	theView.hidden			= NO;
	theView.alpha			= 0.0;	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:kToastAnimationTime];
	theView.alpha = 1.0;
	[UIView commitAnimations];
}

@end

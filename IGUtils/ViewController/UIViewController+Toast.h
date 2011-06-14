//
//  UIViewController+Toast.h
//  QuickNote
//
//  Created by Francis Chong on 10年8月25日.
//  Copyright 2010 Ignition Soft Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TOAST_DURATION_LONG 3.0
#define TOAST_DURATION_SHORT 1.0

typedef enum {
	ToastVAlignTop = 0,
	ToastVAlignCenter,
	ToastVAlignBottom
} ToastVAlign;

@interface UIViewController (Toast)

// show a toast view, which will be dismissed after duration
-(UIView*) showToastOnView:(UIView*)toastHolderView message:(NSString*)message valign:(ToastVAlign)valign duration:(NSTimeInterval)duration;

// show a toast view, which will be dismissed after duration
-(UIView*) showToastOnView:(UIView*)toastHolderView message:(NSString*)message duration:(NSTimeInterval)duration;

// show a toast view with image, which will be dismissed after duration
-(UIView*) showToastOnView:(UIView*)toastHolderView message:(NSString*)message image:(UIImage*)image duration:(NSTimeInterval)duration;

// show a progress view on current view
-(UIView*) showProgressingView:(UIView*)toastHolderView message:(NSString*)message;

// show a progress view on current view, which will be dismissed after duration
-(UIView*) showProgressingView:(UIView*)toastHolderView message:(NSString*)message duration:(NSTimeInterval)duration;

// hide the toast view
-(void) hideToastView:(UIView*)toastView;

@end



//
//  IGTagsView.h
//  IGUtils
//
//  Created by Francis Chong on 11年7月6日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

// A view that used to hold list of tags
@interface IGTagsView : UIView {
}

@property (nonatomic, retain) NSMutableArray* tags; // the tags, array of NSString
@property (nonatomic, retain) NSMutableArray* tagViews; // the tag views, array of UIView that hold the Tag views

@property(nonatomic,retain) UIFont *font; // default font applied to tag UILabel view
@property(nonatomic,retain) UIColor *textColor; // default text color applied to tag UILabel view
@property(nonatomic,retain) UIColor *tagBackgroundColor; // default background color applied to tag UILabel view

@property(nonatomic,assign) NSInteger cornerRadius; // corner raduis of tags
@property(nonatomic,assign) NSInteger vPadding; // vertical padding on pads label
@property(nonatomic,assign) NSInteger hPadding; // horizontal padding on pads label
@property(nonatomic,assign) NSInteger margin; // margin between each tags

-(void) setTags:(NSMutableArray*)tags;

@end
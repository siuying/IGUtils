
//
//  IGTagsView.m
//  IGUtils
//
//  Created by Francis Chong on 11年7月6日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "IGTagsView.h"
#import <QuartzCore/QuartzCore.h>

@interface UIFont (IGCategory)
- (CGFloat)igLineHeight;
@end

@implementation UIFont (IGCategory)
- (CGFloat)igLineHeight {
    return (self.ascender - self.descender) + 1;
}
@end


@implementation IGTagsView

@synthesize tags, tagViews;
@synthesize font, textColor, tagBackgroundColor, tagHighlightedTextColor, cornerRadius, vPadding, hPadding, margin;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.vPadding = 2;
        self.hPadding = 4;
        self.margin = 4;
        self.cornerRadius = 4;
        self.textColor = [UIColor blackColor];
        self.tagHighlightedTextColor = [UIColor whiteColor];
        self.tagBackgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        self.autoresizesSubviews = NO;
        self.clipsToBounds = YES;
    }
    return self;    
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.vPadding = 2;
        self.hPadding = 4;
        self.margin = 4;
        self.cornerRadius = 4;
        self.textColor = [UIColor blackColor];
        self.tagHighlightedTextColor = [UIColor whiteColor];
        self.tagBackgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        self.autoresizesSubviews = NO;
        self.clipsToBounds = YES;
    }
    return self;    
}

-(void) dealloc {
    self.tags = nil;
    self.tagViews = nil;
    
    self.font = nil;
    self.textColor = nil;
    self.tagBackgroundColor = nil;

    [super dealloc];
}

-(void) setTags:(NSArray*)newTags {
    [tags release];
    tags = [newTags retain];

    for (UIView* v in self.tagViews) {
        [v removeFromSuperview];
    }

    NSMutableArray* newTagViews = [NSMutableArray array];

    for (NSString* tag in tags) {
        UIView* container = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
        container.layer.cornerRadius = self.cornerRadius;
        container.backgroundColor = self.tagBackgroundColor;
        
        UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(self.hPadding, self.vPadding, 
                                                                    0, self.font.igLineHeight)] autorelease];
        label.numberOfLines = 1;
        label.font = self.font;
        label.textColor = self.textColor;
        label.highlightedTextColor = self.tagHighlightedTextColor;
        label.backgroundColor = self.tagBackgroundColor;
        [label setText:tag];
        [label sizeToFit];

        [container addSubview:label];
        container.frame = CGRectMake(0, 0, 
                                     label.frame.size.width + self.hPadding*2, label.frame.size.height + self.vPadding*2);
        [self addSubview:container];
        [newTagViews addObject:container];
    }
    
    self.tagViews = newTagViews;
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

-(void) layoutSubviews {
    [super layoutSubviews];

    NSInteger _total_width = self.frame.size.width;
    
    NSInteger top = 0;
    NSInteger left = 0;
    for (UIView* view in tagViews) {
        if (left + self.margin + view.frame.size.width > _total_width) {
            left = 0;
            top += view.frame.size.height + self.margin;
        }
        
        view.frame = CGRectMake(left, top, view.frame.size.width, view.frame.size.height);        
        
        
        left += view.frame.size.width + self.margin;

    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    NSInteger _total_width = size.width;
    NSInteger top = 0;
    NSInteger left = 0;
    for (UIView* view in tagViews) {
        if (left + self.margin + view.frame.size.width > _total_width) {
            left = 0;
            top += view.frame.size.height + self.margin;
        }
        left += view.frame.size.width + self.margin;
    }
    return CGSizeMake(size.width, top + self.font.igLineHeight + 2*self.hPadding + self.margin);
}

- (void)sizeToFit {
    CGSize newSize = [self sizeThatFits:self.frame.size];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newSize.width, newSize.height);
}


@end

//
//  IGTagsView.m
//  IGUtils
//
//  Created by Francis Chong on 11年7月6日.
//  Copyright 2011年 Ignition Soft Limited. All rights reserved.
//

#import "IGTagsView.h"
#import <QuartzCore/QuartzCore.h>


@implementation IGTagsView

@synthesize tags, tagViews;
@synthesize font, textColor, tagBackgroundColor, cornerRadius, vPadding, hPadding, margin;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.vPadding = 2;
        self.hPadding = 4;
        self.margin = 4;
        self.cornerRadius = 4;
        self.textColor = [UIColor blackColor];
        self.tagBackgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
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
        self.tagBackgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
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

-(void) setTags:(NSMutableArray*)newTags {
    [tags release];
    tags = [newTags retain];

    for (UIView* v in self.tagViews) {
        [v removeFromSuperview];
    }
    [self.tagViews removeAllObjects];

    int left = 0;
    for (NSString* tag in tags) {
        UIView* container = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
        container.layer.cornerRadius = self.cornerRadius;
        container.backgroundColor = self.tagBackgroundColor;
        
        UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(self.hPadding, self.vPadding, 
                                                                    0, self.frame.size.height-2*self.vPadding)] autorelease];
        label.numberOfLines = 1;
        label.font = self.font;
        label.textColor = self.textColor;
        label.backgroundColor = self.tagBackgroundColor;
        [label setText:tag];
        [label sizeToFit];
        [container addSubview:label];
        container.frame = CGRectMake(left, 0, 
                                     label.frame.size.width + self.hPadding*2, label.frame.size.height + self.vPadding*2);
        [self addSubview:container];
        [self.tagViews addObject:container];

        left += container.frame.size.width + self.margin;

    }

    [self setNeedsDisplay];
}

@end

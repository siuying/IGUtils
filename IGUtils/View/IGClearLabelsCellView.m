//
//  ClearLabelsCellView.m
//  IGUtils
//
//  Created by Francis Chong on 11年6月28日.
//  Original ClearLabelsCellView.m by Matt Gallagher.
//  Created by Matt Gallagher on 2009/08/21.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//

#import "IGClearLabelsCellView.h"

@implementation IGClearLabelsCellView

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];    
	self.textLabel.backgroundColor = [UIColor clearColor];
	self.detailTextLabel.backgroundColor = [UIColor clearColor];
}

@end

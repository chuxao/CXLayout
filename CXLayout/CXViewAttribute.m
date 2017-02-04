//
//  CXViewAttribute.m
//  CXLayout
//
//  Created by chuxiao on 2017/1/14.
//  Copyright © 2017年 chuxiao. All rights reserved.
//

#import "CXViewAttribute.h"

@implementation CXViewAttribute

- (id)initWithView:(UIView *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    self = [self initWithView:view item:view layoutAttribute:layoutAttribute];
    return self;
}

- (id)initWithView:(UIView *)view item:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    _view = view;
    _item = item;
    _layoutAttribute = layoutAttribute;
    
    return self;
}



@end

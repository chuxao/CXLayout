//
//  CXViewAttribute.h
//  CXLayout
//
//  Created by chuxiao on 2017/1/14.
//  Copyright © 2017年 chuxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXLayoutCommon.h"

@interface CXViewAttribute : NSObject

@property (nonatomic, strong, readonly) UIView *view;
@property (nonatomic, strong, readonly) id item;
@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttribute;


- (id)initWithView:(UIView *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute;

@end

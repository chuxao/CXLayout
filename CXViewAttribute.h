//
//  CXViewAttribute.h
//  CXLayout
//
//  Created by chuxiao on 2017/1/14.
//  Copyright © 2017年 chuxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXViewAttribute : NSObject

@property (nonatomic, strong, readonly) UIView *view;
@property (nonatomic, strong, readonly) id item;
@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttribute;
//@property (nonatomic, assign, readonly) NSLayoutRelation relation;

//@property (nonatomic, strong, readonly) UIView *viewSelf;
//@property (nonatomic, strong, readonly) UIView *viewOther;
//@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttributeSelf;
//@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttributeOther;
//@property (nonatomic, assign, readonly) NSLayoutRelation layoutRelation;
//@property (nonatomic, assign, readonly) NSLayoutRelation multiplier;
//@property (nonatomic, assign, readonly) NSLayoutRelation constant;






- (id)initWithView:(UIView *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute;


//- (id)initWithView:(UIView *)view relation:(NSLayoutRelation)relation;


- (BOOL)isSizeAttribute;

@end

//
//  CXLayoutManager.h
//  CXLayout
//
//  Created by chuxiao on 2016/1/14.
//  Copyright © 2016年 chuxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXConstraint.h"
#import "CXLayoutCommon.h"


@interface CXLayoutManager : NSObject

NS_ASSUME_NONNULL_BEGIN

/**
 *  Whether or not to check for an existing constraint instead of adding constraint
 */
@property (nonatomic, assign) CXLayoutType layoutType;


- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))left;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))top;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))right;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))bottom;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))leading;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))trailing;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))width;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))height;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))centerX;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))centerY;
- (CXLayoutManager * (^)(CXViewAttribute *__nullable attrSec, CGFloat multiplier, CGFloat constant))baseline;


- (CXLayoutManager *)equal;
- (CXLayoutManager *)greaterThanOrEqual;
- (CXLayoutManager *)lessThanOrEqual;

- (CXLayoutManager * (^)(CGSize size))size;
- (CXLayoutManager * (^)(CGPoint point))center;
- (CXLayoutManager * (^)(CGPoint point))origin;
- (CXLayoutManager * (^)(CGRect frame))frame;


- (id)initWithView:(UIView *)view;

- (NSArray *)install;
NS_ASSUME_NONNULL_END
@end

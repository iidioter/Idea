//
//  UIView+Round.h
//  Idea
//
//  Created by Harry on 15/1/17.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Round)

/**
 *  设置圆角半径
 *
 *  @param astRadius 0   正圆
 *  @param astRadius > 0 倒角半径
 */
- (void)setRadius:(NSNumber *)astRadius;

@end

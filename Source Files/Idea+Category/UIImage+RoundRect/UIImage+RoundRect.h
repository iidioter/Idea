//
//  UIImage+RoundRect.h
//  Idea
//
//  Created by Harry on 15/1/15.
//  Copyright (c) 2015年 Harry Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
   UIImageRoundedCornerTopLeft      = 1,
   UIImageRoundedCornerTopRight     = 1 << 1,
   UIImageRoundedCornerBottomRight  = 1 << 2,
   UIImageRoundedCornerBottomLeft   = 1 << 3
   
} UIImageRoundedCorner;

@interface UIImage (RoundRect)

- (UIImage *)roundedRectWith:(float)radius;
- (UIImage *)roundedRectWith:(float)radius cornerMask:(UIImageRoundedCorner)cornerMask;

@end

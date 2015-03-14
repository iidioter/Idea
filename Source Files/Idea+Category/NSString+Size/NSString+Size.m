//
//  NSString+Size.m
//  Idea
//
//  Created by Harry on 15/2/9.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)textSizeWithFont:(UIFont *)astFont
{
   if ([UIDevice iOS6Later])
   {
      return [self length] > 0 ? [self sizeWithAttributes:@{NSFontAttributeName:astFont}] : CGSizeZero;
      
   } /* End if () */
   else
   {
      return [self length] > 0 ? [self sizeWithFont:astFont] : CGSizeZero;
   }
}

- (CGSize)multilineTextSizeWithFont:(UIFont *)astFont maxSize:(CGSize)astMaxSize lineBreakMode:(NSLineBreakMode)lineBreakMode
{
   if ([UIDevice iOS6Later])
   {
      return [self length] > 0 ?
      [self boundingRectWithSize:astMaxSize
                            options:(NSStringDrawingUsesLineFragmentOrigin)
                         attributes:@{NSFontAttributeName:astFont}
                            context:nil].size
      : CGSizeZero;
      
   } /* End if () */
   else
   {
      return [self length] > 0 ? [self sizeWithFont:astFont constrainedToSize:astMaxSize lineBreakMode:lineBreakMode] : CGSizeZero;
   }
}

@end

//
//  UIView+Round.m
//  Idea
//
//  Created by Harry on 15/1/17.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "UIView+Round.h"

#define UIVIEW_ROUND_RADIUS                  @"UIView+Round+Radius"

@implementation UIView (Round)

- (void)awakeFromNib
{
   NSNumber                      *stRadius                                 = nil;
   
   [super awakeFromNib];
   
   stRadius = objc_getAssociatedObject(self, UIVIEW_ROUND_RADIUS);
   
   objc_setAssociatedObject(self, UIVIEW_ROUND_RADIUS, nil, OBJC_ASSOCIATION_RETAIN);
   
   if (stRadius)
   {
      [self.layer setMasksToBounds:YES];
      [self.layer setCornerRadius:[stRadius floatValue]];
      
   } /* End if () */
   
   return;
}

- (void)setRadius:(NSNumber *)astRadius
{
   if (0 >= [astRadius floatValue])
   {
      astRadius   = @(self.frame.size.height / 2);
      
   } /* End if () */
   
   objc_setAssociatedObject(self, UIVIEW_ROUND_RADIUS, astRadius, OBJC_ASSOCIATION_RETAIN);
   
   [self.layer setMasksToBounds:YES];
   [self.layer setCornerRadius:[astRadius floatValue]];
   
   return;
}

@end

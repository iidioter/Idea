//
//  NSObject+Null.m
//  BookFun
//
//  Created by Harry Tsai on 14-8-12.
//  Copyright (c) 2014年 Idea.Mobi. All rights reserved.
//

#import "NSObject+Null.h"
#import "NSString+Java.h"

@implementation NSObject (Null)

- (BOOL)isNull
{
   BOOL         bNULL   = YES;
   
   if (nil != self)
   {
      if (self != [NSNull null])
      {
         if ([self isKindOfClass:[NSString class]])
         {
            if (![(NSString *)self contains:@"null"] && [(NSString *)self length])
            {
               bNULL = NO;
               
            } /* End if () */
            
         } /* End if () */
         else
         {
            bNULL = NO;
            
         } /* End else */
         
      } /* End if () */
      
   } /* End if () */
   
   return bNULL;
}

@end




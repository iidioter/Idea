//
//  NSError+Error.m
//  Idea
//
//  Created by Harry on 15/1/15.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "NSError+Error.h"

@implementation NSError (Error)

+ (NSError *)ERROR:(Class)astDomain MSG:(NSString *)aszErr code:(NSInteger)anCode
{
   if (IS_NULL(aszErr))
   {
      aszErr   = @"未知错误";
      
   } /* End if () */
   
   return [NSError errorWithDomain:NSStringFromClass(astDomain)
                              code:anCode
                          userInfo:@{@"msg": aszErr}];
}



- (NSString *)MSG
{
   //   NSString    *szErr   = NS_STR(@"未知错误", nil);
   
   NSString *szErr   = [[self userInfo] objectForKey:@"msg"];
   
   if ((nil == szErr) || (0 == [szErr length]))
   {
      szErr = @"未知错误";;
      
   } /* End if () */
   
   return szErr;
}

@end

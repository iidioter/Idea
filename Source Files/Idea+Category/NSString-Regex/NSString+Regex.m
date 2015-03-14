//
//  NSString+Regex.m
//  Idea
//
//  Created by Harry on 14/12/31.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#if __REGEX_KIT_LITE__

#import "NSString+Regex.h"

#import "RegexKitLite.h"


@implementation NSString (Regex)

- (BOOL)EMAIL
{
   NSArray     *stEMAILs   = [self componentsMatchedByRegex:REGEX_EMAIL];

#ifdef DEBUG
   for (NSString *stEMAIL = nil in stEMAILs)
   {
      NSLog(@"EMAIL : %@", stEMAIL);

   } /* End for () */
#endif /* DEBUG */
   
   return [stEMAILs count];
}



- (BOOL)PHONE
{
   NSArray     *szPHONEs   = [self componentsMatchedByRegex:REGEX_MOBILE];
   
#ifdef DEBUG
   for (NSString *szPHONE = nil in szPHONEs)
   {
      NSLog(@"PHONE : %@", szPHONE);
      
   } /* End for () */
#endif /* DEBUG */
   
   return [szPHONEs count];
}



@end


#endif


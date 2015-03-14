//
//  UIApplication+Kit.m
//  Idea
//
//  Created by Harry on 15/1/31.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "UIApplication+Kit.h"


@implementation UIApplication (Kit)

+ (NSString *)NAME
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)ID
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)BUILD
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)VERSION
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSDictionary *)ICONS
{
   NSDictionary   *stAppInfo  = [[NSBundle mainBundle] infoDictionary];
   NSDictionary   *stIcons    = [stAppInfo objectForKey:@"CFBundleIcons"];
   
   if (!IS_NULL(stIcons))
   {
      stIcons  = [stIcons objectForKey:@"CFBundlePrimaryIcon"];
      
   } /* End if () */

   if (!IS_NULL(stIcons))
   {
      stIcons  = [stIcons objectForKey:@"CFBundleIconFiles"];
      
   } /* End if () */

   LogDebug((@"Icons : %@",stIcons));

   return stIcons;
}

//+ (NSString *)LANGUAGE
//{
//   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//   NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
//   NSString *currentLanguage = [languages objectAtIndex:0];
//   
////   NSLog(@"Current Locale: %@", [[NSLocale currentLocale] localeIdentifier]);
////   NSLog(@"Current language: %@", currentLanguage);
//
//   return currentLanguage;
//}

@end

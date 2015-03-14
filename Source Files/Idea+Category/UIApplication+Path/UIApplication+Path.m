//
//  UIApplication+Path.m
//  Idea
//
//  Created by Harry on 15/1/16.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "UIApplication+Path.h"

#define PATH_OF_APP_HOME()                   NSHomeDirectory()
#define PATH_OF_DOCUMENT()                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define PATH_OF_LIBRARY()                    [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define PATH_OF_TEMP()                       NSTemporaryDirectory()
#define PATH_OF_CACHE()                      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]



@implementation UIApplication (Path)

+ (NSString *)ROOT
{
   return PATH_OF_APP_HOME();
}
+ (NSString *)documents
{
   return PATH_OF_DOCUMENT();
}

+ (NSString *)library
{
   return PATH_OF_LIBRARY();
}

+ (NSString *)cache
{
   return PATH_OF_CACHE();;
}

+ (NSString *)temp
{
   return PATH_OF_TEMP();
}


@end

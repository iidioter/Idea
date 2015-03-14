//
//  Idea.m
//  Idea
//
//  Created by Harry on 14/12/31.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "Idea.h"

#import "NSString+Java.h"
#import "NSObject+Null.h"

static   NSInteger    g_TITLE_FONT_SIZE   = APP_TITLE_FONT_SIZE;
static   NSInteger    g_TAB_FONT_SIZE     = TAB_TITLE_FONT_SIZE;
static   NSInteger    g_HOT_FONT_SIZE     = HOT_TIP_FONT_SIZE;


@implementation Idea

+ (void)load
{
   static dispatch_once_t stFont;
   
   dispatch_once(&stFont, ^
                 {
                    NSString        *szPath     = [[NSBundle mainBundle] pathForResource:@"idea" ofType:@"plist"];//找到该plist的路径
                    
                    NSDictionary    *stIdea     = [NSDictionary dictionaryWithContentsOfFile:szPath];
                    NSNumber        *stFontSize = [stIdea objectForKey:@"title-font-size"];
                    
                    if (!IS_NULL(stFontSize))
                    {
                       g_TITLE_FONT_SIZE  = [stFontSize integerValue];
                       
                    } /* End if () */
                    
                    stFontSize = [stIdea objectForKey:@"tab-font-size"];
                    
                    if (!IS_NULL(stFontSize))
                    {
                       g_TAB_FONT_SIZE    = [stFontSize integerValue];
                       
                    } /* End if () */
                    
                    stFontSize = [stIdea objectForKey:@"hot-font-size"];
                    
                    if (!IS_NULL(stFontSize))
                    {
                       g_TAB_FONT_SIZE    = [stFontSize integerValue];
                       
                    } /* End if () */
                 });
   
   return;
}


//#define APP_TITLE_FONT_SIZE                  (16)
//#define HOT_TIP_FONT_SIZE                    (12)
//#define TAB_TITLE_FONT_SIZE                  (12)


+ (NSInteger)TITLE_FONT_SIZE
{
   return g_TITLE_FONT_SIZE;
}

+ (NSInteger)TAB_FONT_SIZE
{
   return g_TAB_FONT_SIZE;
}

+ (NSInteger)HOT_FONT_SIZE
{
   return g_HOT_FONT_SIZE;
}

+ (long long)fileSizeAtPath:(NSString*)aszFilePath
{
   NSFileManager  *stFileMgr  = [NSFileManager defaultManager];
   
   if ([stFileMgr fileExistsAtPath:aszFilePath])
   {
      return [[stFileMgr attributesOfItemAtPath:aszFilePath error:nil] fileSize];
   }
   return 0;
}

+ (float )folderSizeAtPath:(NSString*)aszFolderPath
{
   NSFileManager  *stFileMgr  = [NSFileManager defaultManager];
   
   if (![stFileMgr fileExistsAtPath:aszFolderPath])
   {
      return 0;
      
   } /* End if () */
   
   NSEnumerator   *childFilesEnumerator = [[stFileMgr subpathsAtPath:aszFolderPath] objectEnumerator];
   
   NSString       *szFileName = nil;
   
   long long folderSize = 0;
   
   while ((szFileName = [childFilesEnumerator nextObject]) != nil)
   {
      NSString* fileAbsolutePath = [aszFolderPath stringByAppendingPathComponent:szFileName];
      
      folderSize += [self fileSizeAtPath:fileAbsolutePath];
   }
   return folderSize;
}



@end


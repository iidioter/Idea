//
//  UIDevice+API.m
//  Idea
//
//  Created by Harry on 14/12/31.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#include <sys/utsname.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <errno.h>
#include <net/if_dl.h>


#import "UIDevice+API.h"


typedef struct tagSt_Device
{
   NSInteger    m_VER;
   
   BOOL         m_RETINA;
   BOOL         m_IPAD;
   
   CGFloat      m_fScale;
   
   char         m_szDevice[NAME_MAX];

   
   BOOL         m_IPHONE;
   BOOL         m_IPHONE4;
   BOOL         m_IPHONE5;
   BOOL         m_IPHONE6;
   BOOL         m_IPHONE6Plus;

   BOOL         m_IOS6;
   BOOL         m_IOS7;
   BOOL         m_IOS8;
   
} St_Device;

St_Device   g_DEVICE = {0};



@implementation UIDevice (API)

+ (void)load
{
   static dispatch_once_t stVer;
   
   dispatch_once(&stVer, ^
                 {
                    NSNumber  *stMajorVer = [[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0];
                    
//                    g_DEVICE.m_VER     = IOS_VERSION();

                    g_DEVICE.m_VER     = stMajorVer.integerValue;
                    g_DEVICE.m_IPAD    = IS_PAD;
                    g_DEVICE.m_RETINA  = NO;

                    if ([UIScreen instancesRespondToSelector:@selector(scale)])
                    {
                       g_DEVICE.m_fScale  = [[UIScreen mainScreen] scale];
                       
                    } /* End if () */

                    g_DEVICE.m_IPHONE       = IPHONE;
                    g_DEVICE.m_IPHONE4      = IPHONE_4;
                    g_DEVICE.m_IPHONE5      = IPHONE_5;
                    g_DEVICE.m_IPHONE6      = IPHONE_6;
                    g_DEVICE.m_IPHONE6Plus  = IPHONE_6_PLUS;
                    
                    g_DEVICE.m_IOS6         = [self isIOS6];
                    g_DEVICE.m_IOS7         = [self isIOS7];
                    g_DEVICE.m_IOS8         = [self isIOS8];


                    struct utsname systemInfo;
                    uname(&systemInfo);
                    NSString *szDevice = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

                    if ([szDevice isEqualToString:@"iPhone1,1"]) strcpy(g_DEVICE.m_szDevice, "iPhone 1G");
                    else if ([szDevice isEqualToString:@"iPhone1,2"]) strcpy(g_DEVICE.m_szDevice, "iPhone 3G");
                    else if ([szDevice isEqualToString:@"iPhone2,1"]) strcpy(g_DEVICE.m_szDevice, "iPhone 3GS");
                    else if ([szDevice isEqualToString:@"iPhone3,1"]) strcpy(g_DEVICE.m_szDevice, "iPhone 4");
                    else if ([szDevice isEqualToString:@"iPhone3,2"]) strcpy(g_DEVICE.m_szDevice, "Verizon iPhone 4");
                    else if ([szDevice isEqualToString:@"iPod1,1"]) strcpy(g_DEVICE.m_szDevice, "iPod Touch 1G");
                    else if ([szDevice isEqualToString:@"iPod2,1"]) strcpy(g_DEVICE.m_szDevice, "iPod Touch 2G");
                    else if ([szDevice isEqualToString:@"iPod3,1"]) strcpy(g_DEVICE.m_szDevice, "iPod Touch 3G");
                    else if ([szDevice isEqualToString:@"iPod4,1"]) strcpy(g_DEVICE.m_szDevice, "iPod Touch 4G");
                    else if ([szDevice isEqualToString:@"iPad1,1"]) strcpy(g_DEVICE.m_szDevice, "iPad");
                    else if ([szDevice isEqualToString:@"iPad2,1"]) strcpy(g_DEVICE.m_szDevice, "iPad 2 (WiFi)");
                    else if ([szDevice isEqualToString:@"iPad2,2"]) strcpy(g_DEVICE.m_szDevice, "iPad 2 (GSM)");
                    else if ([szDevice isEqualToString:@"iPad2,3"]) strcpy(g_DEVICE.m_szDevice, "iPad 2 (CDMA)");
                    else if ([szDevice isEqualToString:@"i386"])    strcpy(g_DEVICE.m_szDevice, "Simulator");
                    else if ([szDevice isEqualToString:@"x86_64"])  strcpy(g_DEVICE.m_szDevice, "Simulator");
                    else if ([szDevice isEqualToString:@"x86_64"])  strcpy(g_DEVICE.m_szDevice, "Simulator");
                    else strcpy(g_DEVICE.m_szDevice, "Unknown");
                    LogDebug((@"Device type: %s(%@)", g_DEVICE.m_szDevice, szDevice));

                 });
   
   return;
}

+ (NSInteger)majorVersion
{
   return g_DEVICE.m_VER;
}


+ (BOOL)isIOS6
{
   static NSInteger result = -1;
   if (result == -1)
   {
      result = [self majorVersion] == 6;
   }
   return (BOOL)result;
}


+ (BOOL)isIOS7
{
   static NSInteger result = -1;
   if (result == -1)
   {
      result = [self majorVersion] == 7;
   }
   return (BOOL)result;
}

+ (BOOL)isIOS8
{
   static NSInteger result = -1;
   if (result == -1)
   {
      result = [self majorVersion] == 8;
   }
   return (BOOL)result;
}


+ (BOOL)isIOS6Later
{
   static NSInteger result = -1;
   if (result == -1)
   {
      result = [self majorVersion] > 6;
   }
   return (BOOL)result;
}

+ (BOOL)isIOS7Later
{
   static NSInteger result = -1;
   if (result == -1)
   {
      result = [self majorVersion] > 7;
   }
   return (BOOL)result;
}

+ (BOOL)isIOS8Later
{
   static NSInteger result = -1;
   if (result == -1)
   {
      result = [self majorVersion] > 8;
   }
   return (BOOL)result;
}


+ (NSString *)device
{
   return @(g_DEVICE.m_szDevice);
}

+ (BOOL)iOS6
{
   return g_DEVICE.m_IOS6;
}

+ (BOOL)iOS7
{
   return g_DEVICE.m_IOS7;
}


+ (BOOL)iOS8
{
   return g_DEVICE.m_IOS8;
}

+ (BOOL)iOS6Later
{
   return [UIDevice isIOS6Later];
}

+ (BOOL)iOS7Later
{
   return [UIDevice isIOS7Later];
}

+ (BOOL)iOS8Later
{
   return [UIDevice isIOS8Later];
}

+ (BOOL)iPad
{
   return g_DEVICE.m_IPAD;
}

+ (BOOL)iPhone
{
   return g_DEVICE.m_IPHONE;
}


+ (BOOL)iPhone4
{
   return g_DEVICE.m_IPHONE4;
}

+ (BOOL)iPhone5
{
   return g_DEVICE.m_IPHONE5;
}

+ (BOOL)iPhone6
{
   return g_DEVICE.m_IPHONE6;
   
}
+ (BOOL)iPhone6Plus
{
   return g_DEVICE.m_IPHONE6Plus;
}


+ (BOOL)RETINA
{
   return g_DEVICE.m_RETINA;
}

+ (NSInteger)statusBarH
{
   return  [UIApplication sharedApplication].statusBarFrame.size.height;
}


+ (NSInteger)navigationH
{
   if ([UIDevice isIOS6Later])
   {
      return 64;
      
   } /* End if () */
   else
   {
      return 44;
   }
}

#pragma mark IP address

@end





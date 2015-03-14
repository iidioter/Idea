//
//  UIDevice+API.h
//  Idea
//
//  Created by Harry on 14/12/31.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "IPAdress.h"

@interface UIDevice (API)

+ (BOOL)iPad;

+ (BOOL)RETINA;

+ (NSString *)device;


+ (BOOL)iPhone;
+ (BOOL)iPhone4;
+ (BOOL)iPhone5;
+ (BOOL)iPhone6;
+ (BOOL)iPhone6Plus;

+ (BOOL)iOS6;
+ (BOOL)iOS7;
+ (BOOL)iOS8;

+ (BOOL)iOS6Later;
+ (BOOL)iOS7Later;

+ (NSInteger)statusBarH;

+ (NSInteger)navigationH;

@end

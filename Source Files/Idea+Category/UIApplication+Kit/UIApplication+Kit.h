//
//  UIApplication+Kit.h
//  Idea
//
//  Created by Harry on 15/1/31.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Kit)

+ (NSString *)NAME;

+ (NSString *)ID;

+ (NSString *)VERSION;
+ (NSString *)BUILD;

+ (NSDictionary *)ICONS;

//+ (NSString *)LANGUAGE;

@end

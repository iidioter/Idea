//
//  UIApplication+Path.h
//  Idea
//
//  Created by Harry on 15/1/16.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Path)

+ (NSString *)ROOT;
+ (NSString *)documents;
+ (NSString *)library;
+ (NSString *)cache;
+ (NSString *)temp;

@end

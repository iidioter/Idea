//
//  NSURLRequest+NSString.m
//  Idea
//
//  Created by Harry on 15/1/16.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "NSURLRequest+NSString.h"

@implementation NSURLRequest (NSString)

+ (id)requestWithString:(NSString *)aszURL
{
   return [NSURLRequest requestWithURL:[NSURL URLWithString:aszURL]];
}

@end

//
//  NSObject+Null.h
//  BookFun
//
//  Created by Harry Tsai on 14-8-12.
//  Copyright (c) 2014年 Idea.Mobi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_NULL(STR)                         ((!STR) || ([(STR) isNull]))



@interface NSObject (Null)

- (BOOL)isNull;

@end


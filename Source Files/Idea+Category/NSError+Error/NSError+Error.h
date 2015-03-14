//
//  NSError+Error.h
//  Idea
//
//  Created by Harry on 15/1/15.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Error)

+ (NSError *)ERROR:(Class)astDomain MSG:(NSString *)aszErr code:(NSInteger)anCode;

- (NSString *)MSG;

@end

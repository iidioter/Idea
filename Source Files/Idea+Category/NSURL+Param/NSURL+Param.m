//
//  NSURL+Param.m
//  Idea
//
//  Created by Harry on 15/1/16.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "NSURL+Param.h"

@implementation NSURL (Param)

- (NSDictionary*)paramsWithEncoding:(NSStringEncoding)aeEncoding
{
   NSCharacterSet       *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
   NSMutableDictionary  *pairs = [NSMutableDictionary dictionary];
   NSScanner            *scanner = [[NSScanner alloc] initWithString:[self query]];
   
   while (![scanner isAtEnd])
   {
      NSString* pairString = nil;
      [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
      [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
      NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
      if (kvPair.count == 2) {
         NSString* key = [[kvPair objectAtIndex:0]
                          stringByReplacingPercentEscapesUsingEncoding:aeEncoding];
         NSString* value = [[kvPair objectAtIndex:1]
                            stringByReplacingPercentEscapesUsingEncoding:aeEncoding];
         [pairs setObject:value forKey:key];
      }
   }
   
   return [NSDictionary dictionaryWithDictionary:pairs];
}

@end

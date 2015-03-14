//
//  NSHTTPURLResponse+Encoding.m
//  OSChina
//
//  Created by Harry on 15/1/15.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "NSHTTPURLResponse+Encoding.h"

@implementation NSHTTPURLResponse (Encoding)

- (NSStringEncoding)responseEncoding
{
  return CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.textEncodingName));
}

@end

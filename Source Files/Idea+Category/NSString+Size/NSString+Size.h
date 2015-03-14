//
//  NSString+Size.h
//  Idea
//
//  Created by Harry on 15/2/9.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

//#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
////#  define IDEA_DRAW_AT_POINT(text, point, font)                         [(text) length] > 0 ? [(text) drawAtPoint:(point) withAttributes:@{NSFontAttributeName:(font)}] : CGSizeZero;
////#  define IDEA_MULTILINE_DRAW_AT_POINT(text, point, width, font, mode)
//#  define IDEA_TEXTSIZE(text, font)                                     [(text) length] > 0 ? [(text) sizeWithAttributes:@{NSFontAttributeName:(font)}] : CGSizeZero;
//#  define IDEA_MULTILINE_TEXTSIZE(text, font, maxSize, mode)            [(text) length] > 0 ? [(text) \
//boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
//attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
//#else
////#  define IDEA_DRAW_AT_POINT(text, point, font)                [(text) length] > 0 ? [(text) drawAtPoint:(point) withFont:(font)}] : CGSizeZero;
////#  define IDEA_MULTILINE_DRAW_AT_POINT(text, point, width, font, mode)  [(text) length] > 0 ? [(text) drawAtPoint:(point) forWidth:(width) withFont:(font)} lineBreakMode:(mode)] : CGSizeZero;
//#  define IDEA_TEXTSIZE(text, font)                                     [(text) length] > 0 ? [(text) sizeWithFont:(font)] : CGSizeZero;
//#  define IDEA_MULTILINE_TEXTSIZE(text, font, maxSize, mode)            [(text) length] > 0 ? [(text) sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
//#endif


@interface NSString (Size)

- (CGSize)textSizeWithFont:(UIFont *)astFont;
- (CGSize)multilineTextSizeWithFont:(UIFont *)astFont maxSize:(CGSize)astMaxSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end

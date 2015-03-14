//
//  LaunchScreen.h
//  Idea
//
//  Created by Harry Tsai on 14-8-5.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>



#define UIViewAutoresizingAll                (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin)


@interface LaunchScreen : UIWindow

/**
 *  load and open.
 *
 *  @param complete open complete
 */
+ (id)   openWithWindow:(UIWindow *)astKeyWindow indicatorColor:(UIColor *)indicatorColor labelColor:(UIColor *)labelColor complete:(IdeaCompletionBlock)complete;

+ (id)   openWithWindow:(UIWindow *)astKeyWindow complete:(IdeaCompletionBlock)complete;

- (void) upgrade:(NSString *)aszUpgrade;
- (void) upgradeDone:(NSString *)aszDone complete:(IdeaCompletionBlock)complete;

- (void) splash:(CGFloat)afDur complete:(IdeaCompletionBlock)complete;

@end


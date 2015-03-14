//
//  UIStoryboard+Storyboard.h
//  Idea
//
//  Created by Harry Tsai on 14-7-3.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface UIStoryboard (Storyboard)
+ (NSString *)storyboard:(NSString *)aszStoryboard PAD:(BOOL)aPAD;
+ (id)loadStoryboard:(NSString *)aszStoryboard viewController:(Class)aClass;
+ (id)loadStoryboardRoot:(NSString *)aszStoryboard;

@end

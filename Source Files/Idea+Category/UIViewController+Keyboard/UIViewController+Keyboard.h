//
//  UIViewController+Keyboard.h
//  Idea
//
//  Created by Harry on 15/1/13.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KB_OPEN                                 @"keyboard + open"
#define KB_CLOSE                                @"keyboard + close"


@interface UIViewController (Keyboard)

- (void)registerKeyboardNotifications;
- (void)unregisterKeyboardNotifications;

- (void)keyboardWillShow:(NSNotification *)astNotification;
- (void)keyboardDidShow:(NSNotification *)astNotification;
- (void)keyboardWillHide:(NSNotification *)astNotification;
- (void)keyboardDidHide:(NSNotification *)astNotification;

@end

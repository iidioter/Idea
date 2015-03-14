//
//  UIViewController+Keyboard.m
//  Idea
//
//  Created by Harry on 15/1/13.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "UIViewController+Keyboard.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UIViewController (Keyboard)

- (void)registerKeyboardNotifications
{
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if ([self respondsToSelector:@selector(keyboardWillShow:)])
   {
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(keyboardWillShow:)
                                                   name:UIKeyboardWillShowNotification
                                                 object:nil];
      
   } /* End if () */
   
   if ([self respondsToSelector:@selector(keyboardDidShow:)])
   {
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(keyboardDidShow:)
                                                   name:UIKeyboardDidShowNotification
                                                 object:nil];
      
   } /* End if () */
   
   if ([self respondsToSelector:@selector(keyboardWillHide:)])
   {
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(keyboardWillHide:)
                                                   name:UIKeyboardWillHideNotification
                                                 object:nil];
      
   } /* End if () */
   
   if ([self respondsToSelector:@selector(keyboardDidHide:)])
   {
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(keyboardDidHide:)
                                                   name:UIKeyboardDidHideNotification
                                                 object:nil];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}


- (void)unregisterKeyboardNotifications
{
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:UIKeyboardWillShowNotification
                                                 object:nil];
   
   [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:UIKeyboardDidShowNotification
                                                 object:nil];
   
   [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:UIKeyboardDidHideNotification
                                                 object:nil];
   
   [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:UIKeyboardWillHideNotification
                                                 object:nil];
   
   __CATCH(nErr);
   
   return;
}
@end

#pragma clang diagnostic pop

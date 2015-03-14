//
//  UIStoryboard+Storyboard.m
//  Idea
//
//  Created by Harry Tsai on 14-7-3.
//  Copyright (c) 2014年 Harry. All rights reserved.
//



#import "UIStoryboard+Storyboard.h"




#if __UNIVERSAL__
#  define __UNIVERSAL_IPHONE__      __ON__
#  define __UNIVERSAL_IPAD__        __ON__
#else
#  define __UNIVERSAL_IPHONE__      __OFF__
#  define __UNIVERSAL_IPAD__        __OFF__
#endif /* __UNIVERSAL__ */




@implementation UIStoryboard (Storyboard)

+ (NSString *)storyboard:(NSString *)aszStoryboard PAD:(BOOL)aPAD;
{
   NSString       *szDevice   = @"";
   
#if __UNIVERSAL_IPAD__
   if (aPAD)
   {
      szDevice = @"_iPad";
      
   } /* end if () */
#  if __UNIVERSAL_IPHONE__
   else
#  endif /* __UNIVERSAL_IPHONE__ */

#endif /* __UNIVERSAL_IPAD__ */
      
#if __UNIVERSAL_IPHONE__
   {
      szDevice = @"_iPhone";
   }
#endif /* __UNIVERSAL_IPHONE__ */
   
   return [NSString stringWithFormat:@"%@%@", aszStoryboard, szDevice];
}

+ (id)loadStoryboard:(NSString *)aszStoryboard viewController:(Class)aClass
{
   NSLog(@"%d", __UNIVERSAL__);
   
   NSString       *szBase        = [UIStoryboard storyboard:aszStoryboard
                                                        PAD:[UIDevice iPad]];
   
   NSString       *szStoryboard  = nil;
   NSString       *szPath        = nil;
   
   if ([UIDevice iPhone6])
   {
      szStoryboard   = [NSString stringWithFormat:@"%@+6", szBase];
      
      szPath   = [[NSBundle mainBundle] pathForResource:szStoryboard ofType:@"storyboardc"];

   } /* End if () */
   else if ([UIDevice iPhone6Plus])
   {
      szStoryboard   = [NSString stringWithFormat:@"%@+6", szBase];
      
      szPath   = [[NSBundle mainBundle] pathForResource:szStoryboard ofType:@"storyboardc"];
   }
   
   if (!szPath)
   {
      szStoryboard   = szBase;
      
   } /* End if () */
   
   UIStoryboard   *stStoryboard  = [UIStoryboard storyboardWithName:szStoryboard
                                                             bundle:nil];
   
   id stView   = [stStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass(aClass)];
   
   __RELEASE(szStoryboard);
   __RELEASE(stStoryboard);
   
   return stView;
}


+ (id)loadStoryboardRoot:(NSString *)aszStoryboard
{
   NSString       *szBase        = [UIStoryboard storyboard:aszStoryboard
                                                        PAD:[UIDevice iPad]];
   
   NSString       *szStoryboard  = nil;
   NSString       *szPath        = nil;
   
   if ([UIDevice iPhone6])
   {
      szStoryboard   = [NSString stringWithFormat:@"%@+6", szBase];
      
      szPath   = [[NSBundle mainBundle] pathForResource:szStoryboard ofType:@"storyboardc"];
      
   } /* End if () */
   else if ([UIDevice iPhone6Plus])
   {
      szStoryboard   = [NSString stringWithFormat:@"%@+6", szBase];
      
      szPath   = [[NSBundle mainBundle] pathForResource:szStoryboard ofType:@"storyboardc"];
   }
   
   if (!szPath)
   {
      szStoryboard   = szBase;
      
   } /* End if () */
   
   UIStoryboard   *stStoryboard  = [UIStoryboard storyboardWithName:szStoryboard
                                                             bundle:nil];
   
   id stView   = [stStoryboard instantiateInitialViewController];
   
   __RELEASE(szStoryboard);
   __RELEASE(stStoryboard);
   
   return stView;
}


@end

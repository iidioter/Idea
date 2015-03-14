//
//  LaunchScreen.m
//  Idea
//
//  Created by Harry Tsai on 14-8-5.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "LaunchScreen.h"
#import "LaunchViewController.h"



#define LAUNCH_ANIMATE                                   (@"LaunchScreen")
#define kSpringSpeed                                     15
#define kSpringBounciness                                15

#define kAlphaDuration                                   0.3


#define ANIM_UPGRADE                                     @"upgrade"
#define ANIM_UPGRADE_DONE                                @"upgrade-done"


@interface LaunchScreen ()

@property (nonatomic, copy)            IdeaCompletionBlock                splashComplete;
@property (nonatomic, copy)            IdeaCompletionBlock                launchComplete;

@property (nonatomic, strong)          UIImageView                      * launchImage;

@property (nonatomic, assign)          CGRect                             copyrightRC;

@property (nonatomic, strong)          UIWindow                         * appWindow;

@end

@implementation LaunchScreen

- (void)dealloc
{
   __RELEASE(_splashComplete);
   __RELEASE(_launchComplete);
   
   __VIEW_RELEASE(_launchImage);
   
   return;
}

+ (id)openWithWindow:(UIWindow *)astKeyWindow indicatorColor:(UIColor *)indicatorColor labelColor:(UIColor *)labelColor complete:(IdeaCompletionBlock)complete
{
   LaunchScreen         *stLaunchScreen   = [LaunchScreen openWithWindow:astKeyWindow
                                                          complete:complete];
   LaunchViewController *stLaunchView     = __cast(LaunchViewController *, stLaunchScreen.rootViewController);
   
   [stLaunchView.activityIndicatorView setColor:indicatorColor];
   [stLaunchView.activityLabel setTextColor:labelColor];
   [stLaunchView.copyright setTextColor:labelColor];

   return stLaunchScreen;
}

+ (id)openWithWindow:(UIWindow *)astKeyWindow complete:(IdeaCompletionBlock)complete
{
   LaunchScreen   *stLaunchScreen   = nil;
   
#if __IDEA_BUNDLE__
   NSString       *szBundle         = [[NSBundle mainBundle] pathForResource:@"IdeaBundle" ofType:@"bundle"];
   NSBundle       *stBundle         = [NSBundle bundleWithPath:szBundle];
   NSArray        *stNIBs           = [stBundle loadNibNamed:@"LaunchScreen" owner:self options:nil];
#else
   NSArray        *stNIBs           = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen"
                                                                    owner:self
                                                                  options:nil];
#endif
   
//   if (![stBundle isLoaded])
//   {
//      [stBundle load];
//      
//   } /* End if () */
   
   
   for (UIWindow *stLaunch = nil in stNIBs)
   {
      LogDebug((@"LaunchScreen :: stLaunch  %@", [stLaunch class]));

      if ([stLaunch isKindOfClass:[LaunchScreen class]])
      {
         stLaunchScreen = __cast(LaunchScreen *, stLaunch);
         
         break;
         
      } /* End if () */
      
   } /* End for () */
   
   if (stLaunchScreen)
   {
      [stLaunchScreen setWindowLevel:UIWindowLevelStatusBar + 1.0f];
      
      LogDebug((@"UIWindowLevelAlert     : %d", UIWindowLevelAlert));
      LogDebug((@"UIWindowLevelStatusBar : %d", UIWindowLevelStatusBar));

      stLaunchScreen.appWindow      = astKeyWindow;
      stLaunchScreen.launchComplete = complete;

      [stLaunchScreen addNotificationName:[LaunchViewController launchNotification]
                                 selector:@selector(openComplete:)
                                   object:nil];
      
   } /* End if () */
   
   return stLaunchScreen;
}

- (void)splashViewDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
   if ([animationID isEqualToString:LAUNCH_ANIMATE])
   {
      [self.appWindow makeKeyAndVisible];
      
      if (self.splashComplete)
      {
         self.splashComplete();
         
      } /* End if () */
      
      [self removeFromSuperview];
      
   } /* end if () */
   
   return;
}

- (void)splash:(CGFloat)afDur complete:(IdeaCompletionBlock)complete
{
   /**
    *  copy the complete block
    */
   self.splashComplete  = complete;
   
   [UIView beginAnimations:LAUNCH_ANIMATE context:nil];
   [UIView setAnimationDuration:afDur];
   [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self cache:YES];
   [UIView setAnimationDelegate:self];
   [UIView setAnimationDidStopSelector:@selector(splashViewDone:finished:context:)];
   
   self.alpha  = 0.0;
   
   [UIView commitAnimations];
   
   return;
}


- (void)upgrade:(NSString *)aszUpgrade
{
   LaunchViewController    *stLaunchView  = __cast(LaunchViewController *, self.rootViewController);
   
   if (![stLaunchView.activityIndicatorView isAnimating])
   {
      [stLaunchView.activityIndicatorView startAnimating];
      
   } /* End if () */
   
   {
      [stLaunchView.activityLabel setText:aszUpgrade];
   }
   
#if __LAUNCH_POP__
   {
      POPBasicAnimation *stAlpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
      
      [stAlpha setRemovedOnCompletion:YES];
      [stAlpha setName:kPOPViewAlpha];
      
      [stAlpha setDuration:kAlphaDuration];
      
      [stAlpha setToValue:@(1)];
      [stLaunchView.activityIndicatorView pop_addAnimation:stAlpha forKey:@"base+alpha"];
      [stLaunchView.activityLabel         pop_addAnimation:stAlpha forKey:@"base+alpha"];
   }
#else
   [UIView beginAnimations:ANIM_UPGRADE context:NULL];
   [UIView setAnimationBeginsFromCurrentState:YES];
   [UIView setAnimationDuration:0.6];
   [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
   
   [stLaunchView.activityIndicatorView setAlpha:1];
   [stLaunchView.activityLabel         setAlpha:1];
   
   [UIView commitAnimations];
#endif
   
   return;
}

- (void) upgradeDone:(NSString *)aszDone complete:(IdeaCompletionBlock)complete
{
   int                            nErr                                     = EFAULT;
   
   LaunchViewController          *stLaunchView                             = __cast(LaunchViewController *, self.rootViewController);

   __TRY;
   
#if __LAUNCH_POP__
   POPBasicAnimation *stBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
   
   [stBasic setRemovedOnCompletion:YES];
   [stBasic setName:kPOPViewAlpha];
   [stBasic setDuration:kAlphaDuration];
   
   [stBasic setToValue:@(0)];
   
   stBasic.completionBlock = ^(POPAnimation *stAnimation, BOOL bFinished)
   {
      [stLaunchView.activityLabel setText:aszDone];
      
      POPBasicAnimation *stLabel = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
      
      [stLabel setRemovedOnCompletion:YES];
      [stLabel setName:kPOPViewAlpha];
      [stLabel setDuration:kAlphaDuration];
      
      [stLabel setToValue:@(1)];
      
      stLabel.completionBlock = ^(POPAnimation *stAnimation, BOOL bFinished)
      {
         if (complete)
         {
            complete();
            
         } /* End if () */
         
      };
      
      [stLaunchView.activityLabel pop_addAnimation:stLabel forKey:@"base+alpha"];
      
   };
   
   [stLaunchView.activityLabel pop_addAnimation:stBasic forKey:@"base+alpha"];
#else
   [UIView animateWithDuration:0.6
                    animations:^
   {
      [stLaunchView.activityLabel         setAlpha:0];
   }
                    completion:^(BOOL finished)
    {
       [stLaunchView.activityLabel setText:aszDone];

       [UIView animateWithDuration:0.6
                        animations:^
        {
           [stLaunchView.activityLabel         setAlpha:1];
        }
                        completion:^(BOOL finished)
        {
           if (complete)
           {
              complete();
              
           } /* End if () */
           
        }];

    }];
#endif
   
   __CATCH(nErr);
   
   return;
}

- (void)openComplete:(NSNotification *)astComplete
{
   if (self.launchComplete)
   {
      self.launchComplete();
      
   } /* End if () */
   
   return;
}

@end





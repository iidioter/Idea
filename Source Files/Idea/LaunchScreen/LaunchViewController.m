//
//  LaunchViewController.m
//  Idea
//
//  Created by Harry on 15/1/22.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@property (nonatomic, assign)          CGRect                             copyrightRC;

@end

@implementation LaunchViewController

- (void)dealloc
{
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   __SUPER_DEALLOC;
   
   return;
}

- (void)viewDidLoad
{
   NSInteger                      nStatusBarH                              = [UIDevice statusBarH];
   
   CGSize                         stScreenSZ                               = [[UIScreen mainScreen] currentMode].size;
   CGSize                         stSZ                                     = CGSizeZero;
   NSString                      *szLaunch                                 = nil;
   
   NSDictionary                  *stAppInfo                                = [[NSBundle mainBundle] infoDictionary];
   NSString                      *szCopyRight                              = nil;
   
#if __LAUNCH_SCREEN__
   CGFloat                        fScale                                   = 0.0f;
   NSArray                       *stLaunchImages                           = nil;
   NSDictionary                  *stLaunchImage                            = nil;
   CGSize                         stImageSZ                                = CGSizeZero;
#endif /* __LAUNCH_SCREEN__ */
   
   [super viewDidLoad];
   
#if __ColorDebug__
#else
   [self.view           setBackgroundColor:[UIColor clearColor]];
   [self.activityLabel  setBackgroundColor:[UIColor clearColor]];
   [self.launchImage    setBackgroundColor:[UIColor clearColor]];
   [self.copyright      setBackgroundColor:[UIColor clearColor]];
#endif
   
   LogDebug((@"UIInterfaceOrientationPortrait            : %d", UIInterfaceOrientationPortrait));
   LogDebug((@"UIInterfaceOrientationPortraitUpsideDown  : %d", UIInterfaceOrientationPortraitUpsideDown));
   LogDebug((@"UIInterfaceOrientationLandscapeLeft       : %d", UIInterfaceOrientationLandscapeLeft));
   LogDebug((@"UIInterfaceOrientationLandscapeRight      : %d", UIInterfaceOrientationLandscapeRight));
   
   LogDebug((@"self.interfaceOrientation                 : %d", self.interfaceOrientation));
   
	// Do any additional setup after loading the view, typically from a nib.
   
   LogDebug((@"AppInfo : %@", stAppInfo));
   
   
   if (UIInterfaceOrientationLandscapeRight == self.interfaceOrientation)
   {
      szLaunch = [NSString stringWithFormat:@"%dx%d", (int)stScreenSZ.width, (int)stScreenSZ.height];
      
   } /* End if () */
#if __LAUNCH_SCREEN__
   else
   {
      fScale   = [[UIScreen mainScreen] scale];
      LogDebug((@"scale : %f", fScale));
      
      stSZ  = CGSizeMake(stScreenSZ.width / fScale, stScreenSZ.height / fScale);
      
      stLaunchImages = [stAppInfo objectForKey:@"UILaunchImages"];
      
      for (stLaunchImage  in stLaunchImages)
      {
         LogDebug((@"LaunchImage : %@", stLaunchImage));
         
         stImageSZ   = CGSizeFromString([stLaunchImage objectForKey:@"UILaunchImageSize"]);
         
         if (CGSizeEqualToSize(stSZ, stImageSZ))
         {
            szLaunch = [stLaunchImage objectForKey:@"UILaunchImageName"];
            
            break;
            
         } /* End if () */
         
      } /* End for () */
#else
      
      szLaunch = [NSString stringWithFormat:@"%dx%d", (int)stSZ.width, (int)stSZ.height];
      
#endif
      
   }
   
   //   szLaunch = @"LaunchImage-Landscape";
#if __Debug__
   UIImage  *stLandscape   = [UIImage imageNamed:szLaunch];
   
   LogDebug((@"Landscape : %@", stLandscape));
#endif
   [_launchImage setImage:[UIImage imageNamed:szLaunch]];
   
   if ([UIDevice iOS6Later])
   {
      nStatusBarH = 0.f;
      
   } /* End if () */
   
#pragma copy right
   //   NSString *szApp         = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
   
   szCopyRight = [stAppInfo objectForKey:@"NSHumanReadableCopyright"];
   LogDebug((@"CopyRight : %@", szCopyRight));
   
   if ((nil != szCopyRight) && (0 < [szCopyRight length]))
   {
      [_copyright setTextAlignment:NSTextAlignmentCenter];
      [_copyright setTextColor:[UIColor whiteColor]];
      [_copyright setFont:[UIFont systemFontOfSize:12]];
      [_copyright setText:szCopyRight];
      
   } /* End if () */
   else
   {
      [_copyright setHidden:YES];
   }
   
   {
      [self.activityIndicatorView setAlpha:0];
      [self.activityLabel setAlpha:0];
   }
   
   return;
}

- (void)didReceiveMemoryWarning
{
   int                            nErr                                     = EFAULT;
   
   __TRY;

   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
   
   __CATCH(nErr);

   return;
}

- (void)viewDidAppear:(BOOL)abAnimated
{
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidAppear:abAnimated];
   // Dispose of any resources that can be recreated.
   
   [self postNotificationName:[LaunchViewController launchNotification] object:nil];
   
   __CATCH(nErr);
   
   return;
}

#pragma mark splashNotification
+ (NSString *)launchNotification
{
   return [LaunchViewController notificationName:@"LaunchScreen"];
}

@end

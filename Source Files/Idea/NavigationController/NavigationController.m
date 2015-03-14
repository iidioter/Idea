//
//  NavigationController.m
//  Idea
//
//  Created by Harry on 15/3/9.
//  Copyright (c) 2015年 Harry Cai. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)dealloc
{
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   __SUPER_DEALLOC;
   
   return;
}

- (void)viewDidLoad
{
   int                            nErr                                     = EFAULT;
	
   __TRY;
	
   [super viewDidLoad];
	// Do any additional setup after loading the view.
	
   __CATCH(nErr);
	
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end





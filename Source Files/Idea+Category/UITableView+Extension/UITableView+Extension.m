//
//  UITableView+Extension.m
//  Idea
//
//  Created by Harry on 15/1/13.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (void)unselect
{
   [self performSelector:@selector(unselectCurrentRow)
              withObject:nil
              afterDelay:TABLE_AUTO_UNSELECT];

   return;
}


- (void)unselectCurrentRow
{
   [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:YES];
   
   return;
}

- (void)clearHeaderView
{
   self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, 0.01f)];
   
   if (self.tableHeaderView)
   {
      [self.tableHeaderView setBackgroundColor:[UIColor clearColor]];
      
   } /* End if () */
   
   return;
}

- (void)clearFooterView
{
   self.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, 0.01f)];
   
   if (self.tableFooterView)
   {
      [self.tableFooterView setBackgroundColor:[UIColor clearColor]];
      
   } /* End if () */
   
   return;
}

@end

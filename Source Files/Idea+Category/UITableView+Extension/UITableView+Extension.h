//
//  UITableView+Extension.h
//  Idea
//
//  Created by Harry on 15/1/13.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TABLE_AUTO_UNSELECT                  (0.15)


@interface UITableView (Extension)

- (void)clearHeaderView;
- (void)clearFooterView;
- (void)unselect;

@end

//
//  LaunchViewController.h
//  Idea
//
//  Created by Harry on 15/1/22.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView                      * launchImage;
@property (nonatomic, strong) IBOutlet UILabel                          * copyright;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView          * activityIndicatorView;
@property (nonatomic, strong) IBOutlet UILabel                          * activityLabel;

+ (NSString *)launchNotification;

@end

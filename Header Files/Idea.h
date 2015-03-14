//
//  Idea.h
//  Idea
//
//  Created by Harry Tsai on 14-6-29.
//  Copyright (c) 2014年 Harry. All rights reserved.
//



#import "IdeaDef.h"
#import "IdeaDebug.h"
#import "IdeaColor.h"

#import "UIDevice+API.h"
#import "NSString+Java.h"
#import "NSObject+Null.h"
#import "NSObject+Notification.h"

#import "NSBundle+XIB.h"
#import "UIStoryboard+Storyboard.h"

#import "UIView+Round.h"

#import "UITableView+Extension.h"
#import "UIViewController+Keyboard.h"
#import "UIImage+RoundRect.h"
#import "NSError+Error.h"
#import "NSHTTPURLResponse+Encoding.h"
#import "NSURLRequest+NSString.h"
#import "NSURL+Param.h"
#import "UIApplication+Path.h"

#import "UIApplication+Kit.h"
#import "UIDevice+IP.h"

#import "NavigationController.h"

#define APP_TITLE_FONT_SIZE                  (16)
#define TAB_TITLE_FONT_SIZE                  (12)
#define HOT_TIP_FONT_SIZE                    (12)


#if NS_BLOCKS_AVAILABLE
typedef void (^IdeaCompletionBlock)();
#endif

@interface Idea : NSObject

+ (NSInteger)TITLE_FONT_SIZE;
+ (NSInteger)TAB_FONT_SIZE;
+ (NSInteger)HOT_FONT_SIZE;


+ (long long)fileSizeAtPath:(NSString*)aszFilePath;
+ (float )folderSizeAtPath:(NSString*)aszFolderPath;

@end

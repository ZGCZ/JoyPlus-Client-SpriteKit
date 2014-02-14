//
//  JPViewNavigator.h
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JPViewController.h"
#import "JPConnectViewController.h"

@interface JPViewNavigator : NSObject

+ (void) setJPViewController: (JPViewController*) input;

+ (void) setJPConnectViewController: (JPConnectViewController*) input;

+ (JPViewController *) jpViewController;

+ (JPConnectViewController *) jpConnectViewController;

+ (void) toMain;

+ (void) toConnect;

@end

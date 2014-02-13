//
//  JPViewNavigator.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPViewNavigator.h"

#import "JPViewController.h"
#import "JPConnectViewController.h"

@implementation JPViewNavigator

static JPViewController *jpViewController = nil;
static JPConnectViewController *jpConnectViewController = nil;

+ (void) setJPViewController: (JPViewController*) input
{
    jpViewController = input;
}

+ (void) setJPConnectViewController: (JPConnectViewController*) input
{
    jpConnectViewController = input;
}

+ (JPViewController *) jpViewController
{
    return jpViewController;
}

+ (JPConnectViewController *) jpConnectViewController
{
    return jpConnectViewController;
}

+ (void) toMain
{
    // [jpConnectViewController performSegueWithIdentifier:@"goToSKView" sender:self];
    [jpConnectViewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"To Main");
    }];
}

+ (void) toConnect
{
    [jpViewController performSegueWithIdentifier:@"goToConnectView" sender:self];
}

@end

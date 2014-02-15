//
//  Joystick+JPJoystick.m
//  JoyPlus
//
//  Created by Ciel Breiz on 15/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "Joystick+JPJoystick.h"

@implementation Joystick (JPJoystick)

-(void)controlByAcclerometer
{
    self.userInteractionEnabled = NO;
    self.isAccessibilityElement = YES;
}


@end
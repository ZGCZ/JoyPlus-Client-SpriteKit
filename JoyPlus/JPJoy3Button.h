//
//  JPJoy3Button.h
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPControlLayout.h"

@interface JPJoy3Button : JPControlLayout

@property (strong, nonatomic) JCJoystick *joystick;
@property (strong, nonatomic) JPButton *buttonOne;
@property (strong, nonatomic) JPButton *buttonTwo;
@property (strong, nonatomic) JPButton *buttonThree;

@end

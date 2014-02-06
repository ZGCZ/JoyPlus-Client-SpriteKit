//
//  JPJoy3Button.h
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPControlLayout.h"

@interface JPJoy3Button : JPControlLayout

@property (strong, nonatomic) Joystick *joystick;
@property (strong, nonatomic) SKButton *buttonOne;
@property (strong, nonatomic) SKButton *buttonTwo;
@property (strong, nonatomic) SKButton *buttonThree;

@end
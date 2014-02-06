//
//  JPControlLayout.h
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Joystick.h"
#import "SKButton+JPButton.h"

@interface JPControlLayout : SKScene

@property (strong, nonatomic) NSMutableArray *controllers;

-(Joystick*)createDefaultJoystick;

@end
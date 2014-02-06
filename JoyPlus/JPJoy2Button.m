//
//  JPJoy2Button.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPJoy2Button.h"

@implementation JPJoy2Button
@synthesize joystick, buttonRed, buttonYellow;

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        self.joystick = [self createJoystic];
        [self.joystick setPosition:CGPointMake(70,70)];
        [self.controllers addObject:joystick];
        [self addChild:self.joystick];
        
        self.buttonRed = [self createButtonWithColor:[SKColor redColor]];
        [self.buttonRed setPosition:CGPointMake(size.width - 40,95)];
        [self.controllers addObject:buttonRed];
        [self addChild:self.buttonRed];
        
        self.buttonYellow = [self createButtonWithColor:[SKColor yellowColor]];
        [self.buttonYellow setPosition:CGPointMake(size.width - 85,50)];
        [self.controllers addObject:buttonYellow];
        [self addChild:self.buttonYellow];
    }
    return self;
}
    
@end
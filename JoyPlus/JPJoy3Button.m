//
//  JPJoy3Button.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPJoy3Button.h"

@implementation JPJoy3Button
@synthesize joystick, buttonRed, buttonYellow, buttonBlue;

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        self.joystick = [self createJoystic];
        [self.joystick setPosition:CGPointMake(70,70)];
        [self addChild:self.joystick];
        
        self.buttonRed = [self createButtonWithColor:[SKColor redColor]];
        [self.buttonRed setPosition:CGPointMake(size.width - 40,150)];
        [self addChild:self.buttonRed];
        
        self.buttonYellow = [self createButtonWithColor:[SKColor yellowColor]];
        [self.buttonYellow setPosition:CGPointMake(size.width - 90,120)];
        [self addChild:self.buttonYellow];
        
        self.buttonYellow = [self createButtonWithColor:[SKColor blueColor]];
        [self.buttonYellow setPosition:CGPointMake(size.width - 140,90)];
        [self addChild:self.buttonYellow];
    }
    return self;
}

@end

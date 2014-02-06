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
        self.joystick = [self createJoysticWithName:@"joystick"];
        [self.joystick setPosition:CGPointMake(70,70)];
        [self.controllers addObject:joystick];
        [self addChild:self.joystick];
        
        self.buttonRed = [self createButtonWithColor:[SKColor redColor] andName:@"buttonRed"];
        [self.buttonRed setPosition:CGPointMake(size.width - 40,150)];
        [self.controllers addObject:buttonRed];
        [self addChild:self.buttonRed];
        
        self.buttonYellow = [self createButtonWithColor:[SKColor yellowColor] andName:@"buttonYellow"];
        [self.buttonYellow setPosition:CGPointMake(size.width - 90,120)];
        [self.controllers addObject:buttonYellow];
        [self addChild:self.buttonYellow];
        
        self.buttonBlue = [self createButtonWithColor:[SKColor blueColor] andName:@"buttonBlue"];
        [self.buttonBlue setPosition:CGPointMake(size.width - 140,90)];
        [self.controllers addObject:buttonBlue];
        [self addChild:self.buttonBlue];
    }
    return self;
}

@end

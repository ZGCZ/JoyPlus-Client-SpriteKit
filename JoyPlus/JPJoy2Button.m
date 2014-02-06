//
//  JPJoy2Button.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPJoy2Button.h"

@interface JPJoy2Button (){
    SKLabelNode *moveMe;
}
@end

@implementation JPJoy2Button
@synthesize joystick, buttonOne, buttonTwo;

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        moveMe = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        moveMe.text = @"Move me";
        moveMe.fontSize = 15;
        moveMe.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        [self addChild:moveMe];
        
        self.joystick = [self createDefaultJoystick];
        [self.controllers addObject:self.joystick];
        [self addChild:self.joystick];
        
        self.buttonOne = [self createButton];
        [self.buttonOne setPosition:CGPointMake(size.width - 40, 95)];
        [self.controllers addObject:self.buttonOne];
        [self addChild:self.buttonOne];
        
        self.buttonTwo = [self createButton];
        [self.buttonTwo setPosition:CGPointMake(size.width - 85, 50)];
        [self.controllers addObject:self.buttonTwo];
        [self addChild:self.buttonTwo];
    }
    return self;
}

-(void)buttonAction
{
    NSLog(@"Test");
}

-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];
    moveMe.position = CGPointMake(moveMe.position.x + 0.05 *joystick.velocity.x, moveMe.position.y + 0.05* joystick.velocity.y);
}
    
@end
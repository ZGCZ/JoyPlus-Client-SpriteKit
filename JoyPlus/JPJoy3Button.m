//
//  JPJoy3Button.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPJoy3Button.h"
#import "JPServerConnector.h"

@interface JPJoy3Button (){
    SKLabelNode *moveMe;
}
@end

@implementation JPJoy3Button
@synthesize joystick, buttonOne, buttonTwo, buttonThree;

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        self.joystick = [self createDefaultJoystick];
        [self.controllers addObject:self.joystick];
        
        self.buttonOne = [self createButton];
        [self.buttonOne setPosition:CGPointMake(size.width - 40, 150)];
        [self.controllers addObject:self.buttonOne];
        
        self.buttonTwo = [self createButton];
        [self.buttonTwo setPosition:CGPointMake(size.width - 90, 120)];
        [self.controllers addObject:self.buttonTwo];
        
        self.buttonThree = [self createButton];
        [self.buttonThree setPosition:CGPointMake(size.width - 140, 90)];
        [self.controllers addObject:self.buttonThree];
        
        [self drawController];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"joystick\",\"x\":%f,\"y\":%f}",
                joystick.velocity.x,
                - joystick.velocity.y]];
}

@end

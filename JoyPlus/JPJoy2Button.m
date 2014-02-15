//
//  JPJoy2Button.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPJoy2Button.h"

#import "JPServerConnector.h"

@interface JPJoy2Button () {
    int joysticktime;
}
@end

@implementation JPJoy2Button
@synthesize joystick, buttonOne, buttonTwo;

-(id)initWithSize:(CGSize)size
{
    joysticktime = 0;
    
    if(self = [super initWithSize:size]){
        
        self.joystick = [self createDefaultJoystick];
        [self.controllers addObject:self.joystick];
        
        self.buttonOne = [self createButton];
        [self.buttonOne setPosition:CGPointMake(size.width - 100, CGRectGetMidY(self.frame) - 100)];
        [self.controllers addObject:self.buttonOne];
        
        self.buttonTwo = [self createButton];
        [self.buttonTwo setPosition:CGPointMake(size.width - 250, CGRectGetMidY(self.frame) - 250)];
        [self.controllers addObject:self.buttonTwo];
        
        [self drawController];
    }
    return self;
}

-(void)buttonAction
{
    NSLog(@"Test");
}

-(void)update:(CFTimeInterval)currentTime {
    joysticktime ++;
    if (joysticktime < 5) {
        return;
    }
    joysticktime = 0;
    [super update:currentTime];
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"joystick\",\"x\":%f,\"y\":%f}",
                joystick.velocity.x,
                - joystick.velocity.y]];
}
    
@end
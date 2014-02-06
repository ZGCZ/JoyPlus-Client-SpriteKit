//
//  JPJoy2Button.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPJoy2Button.h"

@implementation JPJoy2Button
@synthesize joystick, buttonOne, buttonTwo;

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        self.joystick = [self createJoysticWithName:@"joystick"];
        [self.joystick setPosition:CGPointMake(70,70)];
        [self.controllers addObject:joystick];
        [self addChild:self.joystick];
        
        self.buttonOne = [[SKButton alloc] initWithImageNamedNormal:@"Button1.png" selected:@"Button1Sel.png"];
        [self.buttonOne setPosition:CGPointMake(size.width - 40, 95)];
        [self.buttonOne link];
        [self.controllers addObject:self.buttonOne];
        [self addChild:self.buttonOne];
        
        self.buttonTwo = [[SKButton alloc] initWithImageNamedNormal:@"Button2.png" selected:@"Button2Sel.png"];
        [self.buttonTwo setPosition:CGPointMake(size.width - 85, 50)];
        [self.buttonTwo link];
        [self.controllers addObject:self.buttonTwo];
        [self addChild:self.buttonTwo];
    }
    return self;
}

-(void)buttonAction
{
    NSLog(@"Test");
}
    
@end
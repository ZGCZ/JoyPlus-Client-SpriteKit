//
//  SKButton+JPButton.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "SKButton+JPButton.h"

@implementation SKButton (JPButton)

-(void)link
{
    [self setTouchDownTarget:self action:@selector(buttonPressed)];
    [self setTouchUpTarget:self action:@selector(buttonReleased)];
}

-(void)buttonPressed
{
    NSLog(@"Button %@ Pressed", self.tag);
}

-(void)buttonReleased
{
    NSLog(@"Button %@ Released", self.tag);
}

@end

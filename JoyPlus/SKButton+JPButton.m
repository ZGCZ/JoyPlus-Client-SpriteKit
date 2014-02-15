//
//  SKButton+JPButton.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "SKButton+JPButton.h"

#import "JPServerConnector.h"

@implementation SKButton (JPButton)

-(void)link
{
    [self setTouchDownTarget:self action:@selector(buttonPressed)];
    [self setTouchUpTarget:self action:@selector(buttonReleased)];
}

-(void)buttonPressed
{
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"keydown\",\"key\":\"%@\"}", self.tag]];
    NSLog(@"Button %@ Pressed", self.tag);
}

-(void)buttonReleased
{
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"keyup\",\"key\":\"%@\"}", self.tag]];
    NSLog(@"Button %@ Released", self.tag);
}

@end

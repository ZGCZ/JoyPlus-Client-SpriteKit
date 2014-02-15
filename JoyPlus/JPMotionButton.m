//
//  JPMotionButton.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 15/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPMotionButton.h"

#import "JPServerConnector.h"
#import "JPMotion.h"

@implementation JPMotionButton

-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];
    
    JPMotion *motion = [JPMotion instance];
    
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"orentation\",\"value\":\"%f\"}",
                [motion orentation]]];
}

@end

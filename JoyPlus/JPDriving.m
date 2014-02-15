//
//  JPDriving.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 15/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPDriving.h"
#import "JPMotion.h"

#import "JPServerConnector.h"

@interface JPDriving () {
    int orientationtime;
}

@end

@implementation JPDriving

-(id)initWithSize:(CGSize)size
{
    int orientationtime = 0;
    if(self = [super initWithSize:size]){
        
        self.buttonOne = [self createButton];
        [self.buttonOne setPosition:CGPointMake(size.width - 150, 150)];
        [self.controllers addObject:self.buttonOne];
        
        self.buttonTwo = [self createButton];
        [self.buttonTwo setPosition:CGPointMake(150, 150)];
        [self.controllers addObject:self.buttonTwo];
        
        [self drawController];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime
{
    orientationtime ++;
    if (orientationtime < 5) {
        return;
    }
    orientationtime = 0;
    JPMotion* motion = [JPMotion instance];
    double orientation = [motion orientation];
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"orientation\",\"orientation\":%f}",
                orientation]];
}


@end

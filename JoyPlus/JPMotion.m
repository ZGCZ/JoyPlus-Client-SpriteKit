//
//  JPAccelerometer.m
//  JoyPlus
//
//  Created by Ciel Breiz on 15/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPMotion.h"
@interface JPMotion ()

-(CMMotionManager *)motionManager;

@end

@implementation JPMotion

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]) {
        joystick = [self createDefaultJoystick];
        joystick.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [joystick controlByAcclerometer];
        [self addChild:joystick];
        
    }
    return self;
}

-(CMMotionManager *)motionManager
{
    CMMotionManager *motionManager = nil;
    id appDelegate = [UIApplication sharedApplication].delegate;
    if ([appDelegate respondsToSelector:@selector(motionManager)]) {
        motionManager = [appDelegate motionManager];
    }
    return motionManager;
}

- (void)startMotionDetect
{
    __block float stepMoveFactor = 15;
    [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc]init] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        //handler;
    }];
}

@end
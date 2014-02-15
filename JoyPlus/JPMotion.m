//
//  JPMotion.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 15/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPMotion.h"
#import <CoreMotion/CoreMotion.h>

@implementation JPMotion {
    CMMotionManager *motionManager;
    CMAcceleration acceleration;
    CMRotationRate rotation;
    CMAcceleration gravity;
}

static JPMotion* instance = NULL;

+ (JPMotion*) instance
{
    if (instance == NULL) {
        instance = [[self alloc] init];
    }
    return instance;
}

- (JPMotion*) init
{
    motionManager = [[CMMotionManager alloc]init];
    
    motionManager.accelerometerUpdateInterval = 0.01;
    motionManager.gyroUpdateInterval = 0.01;
    motionManager.deviceMotionUpdateInterval = 0.01;
    
    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 acceleration = accelerometerData.acceleration;
                                                 if(error){                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        rotation = gyroData.rotationRate;
                                    }];
    
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                       withHandler:^(CMDeviceMotion *deviceMotionData, NSError *error) {
                                           gravity = deviceMotionData.gravity;
                                       }];
    
    return [super init];
}

- (double) orientation
{
    double at = atan2(gravity.x,gravity.y);
    double xyTheta = 0;
    if (at < - M_PI / 2) {
        xyTheta = - 3 - 2*at/M_PI;
    } else {
        xyTheta = 1 - 2*at/M_PI;
    }
    // NSLog(@"x %.2f y %.2f z %.2f", gravity.x, gravity.y, gravity.z);
    //NSLog(@"Theta %f", xyTheta);
    return xyTheta;
}

@end

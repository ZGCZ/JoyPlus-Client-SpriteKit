//
//  JPControlLayout.h
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "JCButton.h"
#import "JCJoystick.h"

@interface JPControlLayout : SKScene

@property (strong, nonatomic) NSMutableArray *controllers;

-(JCButton*)createButtonWithColor:(SKColor*)color andName:(NSString*)name;
-(JCJoystick*)createJoysticWithName:(NSString*)name;

@end

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

-(JCButton*)createButtonWithColor:(SKColor*)color;
-(JCJoystick*)createJoystic;

@end

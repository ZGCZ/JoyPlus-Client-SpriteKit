//
//  JPControlLayout.h
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Joystick+JPJoystick.h"
#import "SKButton+JPButton.h"

@interface JPControlLayout : SKScene

@property (strong, nonatomic) NSMutableArray *controllers;

-(void)drawController;
-(Joystick*)createDefaultJoystick;
-(SKButton*)createButton;
-(SKButton*)createButtonWithTitle:(NSString*)title andTag:(NSString*)tag;

@end
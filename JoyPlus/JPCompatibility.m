//
//  JPCompatibility.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPCompatibility.h"

@implementation JPCompatibility

-(id)initWithSize:(CGSize)size {
    if(self = [super initWithSize:size]){
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        back.text = @"[ edit ]";
        back.fontSize = 15;
        back.position = CGPointMake(CGRectGetMaxX(self.frame)-160,CGRectGetMaxY(self.frame)-40);
        back.name = @"edit";
        back.zPosition = 1.0;
        [self addChild:back];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"edit"]) {
        NSLog(@"Edit button was pressed.");
    }
}

@end

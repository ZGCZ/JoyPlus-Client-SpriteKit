//
//  JPDrag.m
//  JoyPlus
//
//  Created by Ciel Breiz on 10/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPDrag.h"

@interface JPDrag (){
    CGMutablePathRef pathToDraw;
    SKShapeNode *line;
}

- (void)updateTouchPoint:(UITouch*)touches;

@end

@implementation JPDrag

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch* touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    
    pathToDraw = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw, NULL, positionInScene.x, positionInScene.y);
    
    line = [SKShapeNode node];
    line.path = pathToDraw;
    line.strokeColor = [SKColor redColor];
    [self addChild:line];
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch* touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    [self updateTouchPoint:touch];
    CGPathAddLineToPoint(pathToDraw, NULL, positionInScene.x, positionInScene.y);
    line.path = pathToDraw;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [line removeFromParent];
    CGPathRelease(pathToDraw);
}

- (void)updateTouchPoint:(UITouch*)touch
{
    CGPoint positionInScene = [touch locationInNode:self];
    NSLog(@"Position changed: (%f, %f)", positionInScene.x, positionInScene.y);
}

@end
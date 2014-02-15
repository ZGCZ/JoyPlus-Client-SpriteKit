//
//  JPDrag.m
//  JoyPlus
//
//  Created by Ciel Breiz on 10/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPDrag.h"
#import "JPServerConnector.h"

@interface JPDrag (){
    CGMutablePathRef pathToDraw;
    SKShapeNode *line;
    double originX, originY;
}

- (void)updateTouchPoint:(UITouch*)touches;

@end

@implementation JPDrag

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch* touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    originX = positionInScene.x;
    originY = positionInScene.y;
    
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"dragStart\",\"x\":%f,\"y\":%f}",
                .0,
                .0]];
    
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
    UITouch* touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"dragEnd\",\"x\":%f,\"y\":%f}",
                positionInScene.x - originX,
                -(positionInScene.y - originY)]];
    [line removeFromParent];
    CGPathRelease(pathToDraw);
}

- (void)updateTouchPoint:(UITouch*)touch
{
    CGPoint positionInScene = [touch locationInNode:self];
    JPServerConnector *jps = [JPServerConnector instance];
    [jps send: [NSString stringWithFormat:@"{\"event\":\"dragMove\",\"x\":%f,\"y\":%f}",
                positionInScene.x - originX,
                -(positionInScene.y - originY)]];
}

@end
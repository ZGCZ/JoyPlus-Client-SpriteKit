//
//  JPMyScene.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPMyScene.h"

#import "JPViewNavigator.h"

@implementation JPMyScene {
    JPViewController *jpVC;
}

-(id)initWithSize:(CGSize)size {
    if (size.width < size.height) {
        CGFloat width = size.width;
        size.width = size.height;
        size.height = width;
    }
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        NSLog(@"%f * %f", size.width, size.height);
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Joy Plus";
        myLabel.fontSize = 80;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        SKLabelNode *connect = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        connect.text = @"[ connect ]";
        connect.fontSize = 50;
        connect.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame)-100);
        connect.name = @"connect";
        connect.zPosition = 1.0;
        [self addChild:connect];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"connect"]) {
        [JPViewNavigator toConnect];
        [[JPViewNavigator jpConnectViewController] setSKView:self.view];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

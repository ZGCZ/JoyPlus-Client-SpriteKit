//
//  JPMyScene.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPMyScene.h"
#import "JPConnectScene.h"

#import "JPViewController.h"

@implementation JPMyScene {
    JPViewController *jpVC;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Joy Plus";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        SKLabelNode *connect = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        connect.text = @"[ connect ]";
        connect.fontSize = 15;
        connect.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame)-40);
        connect.name = @"connect";
        connect.zPosition = 1.0;
        [self addChild:connect];
    }
    return self;
}

-(void) setController: (JPViewController*) _jpVC
{
    jpVC = _jpVC;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"connect"]) {
        SKView * skView = (SKView *)self.view;
        NSLog(@"Connect. Going to ConnectScene");
        SKScene * scene = [JPConnectScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [skView presentScene:scene];
    } else {
        NSLog(@"try to go to strange place.");
        [jpVC goToConnectView];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

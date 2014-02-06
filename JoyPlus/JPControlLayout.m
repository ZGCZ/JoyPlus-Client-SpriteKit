//
//  JPControlLayout.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPControlLayout.h"
#import "JPMyScene.h"

@implementation JPControlLayout
@synthesize controllers;

-(id)initWithSize:(CGSize)size {
    if(self = [super initWithSize:size]){
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        back.text = @"[ back ]";
        back.fontSize = 15;
        back.position = CGPointMake(CGRectGetMaxX(self.frame)-50,CGRectGetMaxY(self.frame)-40);
        back.name = @"back";
        back.zPosition = 1.0;
        [self addChild:back];
        
        controllers = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"back"]) {
        SKView * skView = (SKView *)self.view;
        NSLog(@"Connect. Going to MyScene");
        SKScene * scene = [JPMyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [skView presentScene:scene];
    }
}

-(JCJoystick*)createJoysticWithName:(NSString*)name
{
    JCJoystick* joystick = [[JCJoystick alloc] initWithControlRadius:40 baseRadius:45 baseColor:[SKColor blueColor] joystickRadius:25 joystickColor:[SKColor redColor]];
    [joystick setName:name];
    return joystick;
}

-(NSString*)getAllControllerStat
{
    NSMutableString *stat = [NSMutableString stringWithString:@""];
    for (id <JPController> controller in controllers) {
        [stat appendString:[controller getStat]];
        [stat appendString:@" "];
    }
    return stat;
}

-(void)update:(CFTimeInterval)currentTime {
    //NSLog(@"Now pusing stat: %@", [self getAllControllerStat]);
}

@end
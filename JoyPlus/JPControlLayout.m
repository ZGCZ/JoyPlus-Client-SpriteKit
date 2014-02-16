//
//  JPControlLayout.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPControlLayout.h"
#import "JPMyScene.h"
#import "JPServerConnector.h"

@interface JPControlLayout (){
    char t;
}

@end

@implementation JPControlLayout
@synthesize controllers;

-(id)initWithSize:(CGSize)size {
    if(self = [super initWithSize:size]){
        // self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"bg"];
        bgImage.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        [self addChild:bgImage];
        
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        back.text = @"[ back ]";
        back.fontSize = 15;
        back.position = CGPointMake(CGRectGetMaxX(self.frame)-50,CGRectGetMaxY(self.frame)-40);
        back.name = @"back";
        back.zPosition = 1.0;
        [self addChild:back];
        
        controllers = [[NSMutableArray alloc] initWithCapacity:5];
        t = 'A';
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
        [JPServerConnector destroy];
        SKView * skView = (SKView *)self.view;
        NSLog(@"Connect. Going to MyScene");
        SKScene * scene = [JPMyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [skView presentScene:scene];
    }
}

-(void)drawController
{
    [self removeChildrenInArray:controllers];
    for (id controller in controllers) {
        [self addChild:controller];
    }
}

-(Joystick*)createDefaultJoystick
{
    Joystick* joystick = [Joystick joystickWithThumb:[SKSpriteNode spriteNodeWithImageNamed:@"joystick.png"] andBackdrop:[SKSpriteNode spriteNodeWithImageNamed:@"dpad.png"]];
    [joystick setScale:2.5];
    joystick.position = CGPointMake(180, 180);
    return joystick;
}

-(SKButton*)createButton
{
    NSLog(@"Button creating");
    NSString* tag = [NSString stringWithFormat:@"%c", t];
    SKButton *buttonOne = [[SKButton alloc] initWithImageNamedNormal:@"Button.png" selected:@"ButtonSel.png"];
    [buttonOne setScale:2.5];
    buttonOne.tag = tag;
    [buttonOne.title setText:tag];
    [buttonOne.title setFontName:@"Chalkduster"];
    [buttonOne.title setFontSize:30];
    [buttonOne link];
    t++;
    return buttonOne;
}

-(SKButton*)createButtonWithTitle:(NSString*)title andTag:(NSString*)tag
{
    SKButton *buttonOne = [[SKButton alloc] initWithImageNamedNormal:@"Button.png" selected:@"ButtonSel.png"];
    [buttonOne setScale:2.5];
    buttonOne.tag = tag;
    [buttonOne.title setText:title];
    [buttonOne.title setFontName:@"Chalkduster"];
    [buttonOne.title setFontSize:30];
    [buttonOne link];
    return buttonOne;
}

-(void)update:(CFTimeInterval)currentTime {
    //NSLog(@"Now pusing stat: %@", [self getAllControllerStat]);
}

@end
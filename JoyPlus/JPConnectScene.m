//
//  JPConnectScene.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPConnectScene.h"
#import "JPMyScene.h"
#import "JPJoy2Button.h"
#import "JPJoy3Button.h"
#import "JPDrag.h"
#import "JPCompatibility.h"

@interface JPConnectScene ()

-(NSString*)informationJSONString;

@end

@implementation JPConnectScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        back.text = @"[ back ]";
        back.fontSize = 15;
        back.position = CGPointMake(CGRectGetMaxX(self.frame)-50,CGRectGetMaxY(self.frame)-40);
        back.name = @"back";
        back.zPosition = 1.0;
        [self addChild:back];
        
        SKLabelNode *next = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        next.text = @"[ next ]";
        next.fontSize = 15;
        next.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame)-70);
        next.name = @"next";
        next.zPosition = 1.0;
        [self addChild:next];
    }
    return self;
}

-(NSString*)informationJSONString
{
    return @"{\"type\": \"Joy2Button\"}";
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
    
    if ([node.name isEqualToString:@"next"]) {
        NSError *error = nil;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[[self informationJSONString] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
        
        //connect to server
        //todo
        
        //push scene
        NSString *type = [result objectForKey:@"type"];
        NSLog(@"Type is %@", type);
        SKView * skView = (SKView *)self.view;
        SKScene *scene = nil;
        if([type isEqual:@"Joy2Button"]){
            scene = [JPJoy2Button sceneWithSize:skView.bounds.size];
        }
        else if ([type isEqual:@"Joy3Button"]){
            scene = [JPJoy3Button sceneWithSize:skView.bounds.size];
        }
        else if ([type isEqual:@"JPDrag"]){
            scene = [JPDrag sceneWithSize:skView.bounds.size];
        }
        else if ([type isEqual:@"JPCompatibility"]){
            scene = [JPCompatibility sceneWithSize:skView.bounds.size];
        }
        if(scene){
            scene.scaleMode = SKSceneScaleModeAspectFill;
            [skView presentScene:scene];
            NSLog(@"Connect. Going to ControlScene");
        }
    }
}

@end

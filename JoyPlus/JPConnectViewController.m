//
//  JPConnectViewController.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPConnectViewController.h"

#import "JPViewNavigator.h"
#import "JPServerConnector.h"
#import "JPMyScene.h"
#import "JPJoy2Button.h"
#import "JPJoy3Button.h"
#import "JPDrag.h"

@interface JPConnectViewController (){
    SKScene *scene;
}

-(NSString*) toJSONWithIP:(NSString*)ip andPort: (int)port andID: (int)gameID andType: (NSString*) type;

@end

@implementation JPConnectViewController {
    SKView* skView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setSKView: (SKView*) input
{
    skView = input;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Connect View loaded");
	// Do any additional setup after loading the view.
    [JPViewNavigator setJPConnectViewController: self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateScene
{
    scene = [JPJoy2Button sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
}

-(NSString*)toJSONWithIP:(NSString*)ip andPort: (int)port andID: (int)gameID andType: (NSString*) type
{
    return [NSString stringWithFormat:@"{\"ip\": \"%@\", \"port\": \"%d\", \"id\": \"%d\", \"type\" : \"%@\"}",
            ip, port, gameID, type];
}

- (IBAction)backButton:(id)sender
{
    [JPViewNavigator toMain];
    NSLog(@"Back. Going to MyScene");
    SKScene *back = [JPMyScene sceneWithSize:skView.bounds.size];
    back.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:back];
}

- (void)pushScene
{
    [JPViewNavigator toMain];
    [self updateScene];
    NSLog(@"Connect. Going to ConnectScene");
    if(scene){
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [skView presentScene:scene];
        NSLog(@"Connect. Going to ControlScene");
    }
}

- (IBAction)connectServer:(id)sender
{
    NSLog(@"Trying to connect server");
    JPServerConnector* jpServerConnector = [JPServerConnector instance];
    [jpServerConnector setJPConnectViewController:self];
    [jpServerConnector setGameId: self.portText.text.intValue];
    [jpServerConnector connectServer:self.addressText.text];
}

@end

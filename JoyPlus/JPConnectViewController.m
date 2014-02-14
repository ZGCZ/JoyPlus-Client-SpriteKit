//
//  JPConnectViewController.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPConnectViewController.h"

#import "JPViewNavigator.h"
#import "JPConnectScene.h"
#import "JPServerConnector.h"

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

- (IBAction)backButton:(id)sender
{
    [JPViewNavigator toMain];
    NSLog(@"Connect. Going to ConnectScene");
    SKScene * scene = [JPConnectScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

- (IBAction)connectServer:(id)sender
{
    NSLog(@"Trying to connect server");
    JPServerConnector* jpServerConnector = [JPServerConnector instance];
    [jpServerConnector connectServer:@"127.0.0.1:31415"];
}

@end

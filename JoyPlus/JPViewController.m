//
//  JPViewController.m
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPViewController.h"
#import "JPMyScene.h"

#import "JPConnectViewController.h"

@implementation JPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    JPMyScene * scene = [JPMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [scene setController: self];
    
    // Present the scene.
    [skView presentScene:scene];
}

- (void)goToConnectView
{
    // Testing
    /*
    JPConnectViewController* newConnectView = [[JPConnectViewController alloc] init];
    [self presentModalViewController: newConnectView animated:YES];
     */
    [self performSegueWithIdentifier:@"goToConnectView" sender:self];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end

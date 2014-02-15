//
//  JPConnectViewController.h
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "JPPushScene.h"

@interface JPConnectViewController : UIViewController<JPPushScene>

- (IBAction)backButton:(id)sender;

- (IBAction)connectServer:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addressText;

@property (weak, nonatomic) IBOutlet UITextField *portText;

- (void)setSKView: (SKView*) input;

@end

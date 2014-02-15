//
//  JPConnectViewController.h
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface JPConnectViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

- (void)pushScene;
-(void)setLayout: (NSString*)layout;

- (IBAction)backButton:(id)sender;

- (IBAction)connectServer:(id)sender;

- (void)setSKView: (SKView*) input;

@property (weak, nonatomic) IBOutlet UIView *scannerView;

@end

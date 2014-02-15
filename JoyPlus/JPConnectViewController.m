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
#import "JPDriving.h"

#import <AVFoundation/AVFoundation.h>

@interface JPConnectViewController() {
    SKScene *scene;
    NSMutableDictionary *info;
    SKView* skView;
    bool done;
}

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL isReading;

-(void)decodeJSON: (NSString*) jsonString;

@end;

@implementation JPConnectViewController

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
    
    done = false;
    [self startReading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLayout: (NSString*)layout
{
    [info setObject:layout forKey:@"layout"];
}

-(void)updateScene
{
    NSString *layout = [info objectForKey:@"layout"];
    if([layout isEqual:@"Joy2Button"]){
        scene = [JPJoy2Button sceneWithSize:skView.bounds.size];
    }
    else if ([layout isEqual:@"Joy3Button"]){
        scene = [JPJoy3Button sceneWithSize:skView.bounds.size];
    }
    else if ([layout isEqual:@"JPDrag"]){
        scene = [JPDrag sceneWithSize:skView.bounds.size];
    }
    else{
        scene = NULL;
    }
    if (scene) {
        scene.scaleMode = SKSceneScaleModeAspectFill;
    }
}

-(void)decodeJSON: (NSString*) jsonString
{
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
    info = [NSMutableDictionary dictionaryWithDictionary:result];
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
    [self decodeJSON:@"{\"ip\": \"127.0.0.1\", \"port\": \"31415\", \"id\": \"56008\"}"];
    JPServerConnector* jpServerConnector = [JPServerConnector instance];
    [jpServerConnector setJPConnectViewController:self];
    [jpServerConnector setGameId: [(NSString*)[info objectForKey:@"id"] intValue]];
    [jpServerConnector connectServer:[NSString stringWithFormat:@"%@:%@", [info objectForKey:@"ip"], [info objectForKey:@"port"]]];
}

- (void)receiveJson: (NSString*) input
{
    
    [self decodeJSON: input];
    [self updateScene];
    JPServerConnector* jpServerConnector = [JPServerConnector instance];
    [jpServerConnector setJPConnectViewController:self];
    [jpServerConnector setGameId: [(NSString*)[info objectForKey:@"id"] intValue]];
    [jpServerConnector connectServer:[NSString stringWithFormat:@"%@:%@", [info objectForKey:@"ip"], [info objectForKey:@"port"]]];
}

// below for QR code

- (BOOL)startReading {
    NSError *error;
    
    // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
    // as the media type parameter.
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        // If any error occurs, simply log the description of it and don't continue any more.
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    // Initialize the captureSession object.
    _captureSession = [[AVCaptureSession alloc] init];
    // Set the input device on the capture session.
    [_captureSession addInput:input];
    
    
    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    // Create a new serial dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_scannerView.layer.bounds];
    [_scannerView.layer addSublayer:_videoPreviewLayer];
    
    AVCaptureConnection *previewLayerConnection=self.videoPreviewLayer.connection;
    [previewLayerConnection setVideoOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    // Start video capture.
    [_captureSession startRunning];
    
    return YES;
}

-(void)stopReading{
    // Stop video capture and make the capture session object nil.
    [_captureSession stopRunning];
    _captureSession = nil;
    
    // Remove the video preview layer from the viewPreview view's layer.
    [_videoPreviewLayer removeFromSuperlayer];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    // Check if the metadataObjects array is not nil and it contains at least one object.
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        // Get the metadata object.
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            // If the found metadata is equal to the QR code metadata then update the status label's text,
            // stop reading and change the bar button item's title and the flag's value.
            // Everything is done on the main thread.
            
            //[_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
            NSLog([metadataObj stringValue]);
            if (!done) {
                done = true;
                [self receiveJson:[metadataObj stringValue]];
            }
            
            //[self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            [self stopReading];
            
            NSLog(@"here2");
            //[_bbitemStart performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
            
            _isReading = NO;
            
            // If the audio player is not nil, then play the sound effect.
            if (_audioPlayer) {
                [_audioPlayer play];
            }
        }
    }
    
    
}

@end

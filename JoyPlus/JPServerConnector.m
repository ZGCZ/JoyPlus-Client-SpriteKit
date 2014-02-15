//
//  ServerConnector.m
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPServerConnector.h"
#import "SRWebSocket.h"

@implementation JPServerConnector {
    SRWebSocket* srWebSocket;
    BOOL isConnected;
    JPConnectViewController* jpConnectViewController;
    UIAlertView *alert;
}

static JPServerConnector *gInstance = NULL;

+ (JPServerConnector *)instance
{
    @synchronized(self)
    {
        if (gInstance == NULL)
            gInstance = [[self alloc] init];
    }
    
    return(gInstance);
}

+ (void)destroy
{
    @synchronized(self)
    {
        if (gInstance) {
            gInstance = NULL;
        }
    }
}

-(BOOL)isConnected
{
    return isConnected;
}

-(void)setJPConnectViewController: (JPConnectViewController*)c
{
    jpConnectViewController = c;
}

- (void)connectServer: (NSString*) address
{
    NSLog(@"Now connect lol");
    isConnected = NO;
    self.serverAddress = address;
    NSMutableString* strUrl = [NSMutableString stringWithString:@"ws://"];
    [strUrl appendString: self.serverAddress];
    NSURL* url = [NSURL URLWithString:strUrl];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL: url];
    srWebSocket = [[SRWebSocket alloc] initWithURLRequest: urlRequest];
    [srWebSocket setDelegate: self];
    [srWebSocket open];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    [alert dismissWithClickedButtonIndex:-1 animated:NO];
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[message dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"Did receive, device connected.");
    isConnected = YES;
    NSString *layout = [result objectForKey:@"layout"];
    NSLog(@"%@", layout);
    [jpConnectViewController setLayout:@"Joy2Button"];
    [jpConnectViewController pushScene];
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"Socket Open");
    [webSocket send: [NSString stringWithFormat:@"{\"gameId\":%d}", self.gameId]];
    alert = [[UIAlertView alloc] initWithTitle:@"Connecting"
                                        message:@"Waiting for server..."
                                        delegate:self
                                        cancelButtonTitle:@"Cancel"
                                        otherButtonTitles:nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0){
        [JPServerConnector destroy];
        [jpConnectViewController reload];
    }
}

- (void)send: (NSString *)text
{
    [srWebSocket send: text];
}


@end
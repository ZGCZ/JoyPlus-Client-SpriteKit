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
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[message dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"Did receive, device connected.");
    isConnected = YES;
    NSString *layout = [[result objectForKey:@"layout"]stringValue];
    NSLog(@"%@", layout);
    [jpConnectViewController setLayout:layout];
    [jpConnectViewController pushScene];
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"Socket Open");
    [webSocket send: [NSString stringWithFormat:@"{\"gameId\":%d}", self.gameId]];
}

- (void)send: (NSString *)text
{
    [srWebSocket send: text];
}


@end
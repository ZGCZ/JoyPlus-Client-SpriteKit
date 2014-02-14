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
    SRWebSocket* webSocket;
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

- (BOOL)connectServer: (NSString*) address
{
    NSLog(@"Now connect lol");
    self.serverAddress = address;
    NSMutableString* strUrl = [NSMutableString stringWithString:@"ws://"];
    [strUrl appendString: self.serverAddress];
    NSURL* url = [NSURL URLWithString:strUrl];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL: url];
    webSocket = [[SRWebSocket alloc] initWithURLRequest: urlRequest];
    [webSocket open];
    return YES;
}

@end

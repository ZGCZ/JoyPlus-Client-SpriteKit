//
//  ServerConnector.h
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRWebSocket.h"
#import "JPConnectViewController.h"

@interface JPServerConnector : NSObject <SRWebSocketDelegate, UIAlertViewDelegate>

@property NSString* serverAddress;
@property int gameId;

+ (JPServerConnector*)instance;
+ (void)destroy;
- (BOOL)isConnected;
-(void)setJPConnectViewController: (JPConnectViewController*)c;
- (void)connectServer: (NSString*) address;

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
- (void)webSocketDidOpen:(SRWebSocket *)webSocket;

- (void)send: (NSString *)text;



@end

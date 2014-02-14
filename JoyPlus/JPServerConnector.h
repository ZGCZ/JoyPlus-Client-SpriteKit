//
//  ServerConnector.h
//  JoyPlus
//
//  Created by Zhou Xinzi on 13/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPServerConnector : NSObject

@property NSString* serverAddress;

+ (JPServerConnector*)instance;
- (BOOL)connectServer: (NSString*) address;

@end

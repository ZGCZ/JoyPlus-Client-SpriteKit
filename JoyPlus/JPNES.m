//
//  JPNES.m
//  JoyPlus
//
//  Created by Ciel Breiz on 16/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import "JPNES.h"
#import "JPServerConnector.h"

@implementation JPNES

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
        SKButton *buttonOne = [[SKButton alloc] initWithImageNamedNormal:nil selected:nil];
        buttonOne.tag = @"start";
        [buttonOne.title setText:@"[ start ]"];
        [buttonOne.title setFontName:@"Chalkduster"];
        [buttonOne.title setFontSize:30];
        buttonOne.position = CGPointMake(CGRectGetMidX(self.frame)-100,CGRectGetMidY(self.frame));
        [buttonOne link];
        [self.controllers addObject:buttonOne];
        
        SKButton *buttonTwo = [[SKButton alloc] initWithImageNamedNormal:nil selected:nil];
        buttonTwo.tag = @"select";
        [buttonTwo.title setText:@"[ select ]"];
        [buttonTwo.title setFontName:@"Chalkduster"];
        [buttonTwo.title setFontSize:30];
        buttonTwo.position = CGPointMake(CGRectGetMidX(self.frame)+100,CGRectGetMidY(self.frame));
        [buttonTwo link];
        [self.controllers addObject:buttonTwo];
        
        [self drawController];
    }
    return self;
}

@end

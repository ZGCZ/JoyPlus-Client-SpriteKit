//
//  SKButton.h
//  JoyPlus
//
//  Created by Ciel Breiz on 6/2/14.
//  Copyright (c) 2014 Ciel Breiz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "JPController.h"

@interface JPButton : SKSpriteNode<JPController>

@property (nonatomic, readonly) SEL actionTouchUpInside;
@property (nonatomic, readonly) SEL actionTouchDown;
@property (nonatomic, readonly) SEL actionTouchUp;
@property (nonatomic, readonly, weak) id targetTouchUpInside;
@property (nonatomic, readonly, weak) id targetTouchDown;
@property (nonatomic, readonly, weak) id targetTouchUp;

@property (nonatomic) BOOL isEnabled;
@property (nonatomic) BOOL isSelected;
@property (nonatomic, readonly, strong) SKLabelNode *title;
@property (nonatomic, readwrite, strong) SKTexture *normalTexture;
@property (nonatomic, readwrite, strong) SKTexture *selectedTexture;
@property (nonatomic, readwrite, strong) SKTexture *disabledTexture;

- (id)initWithTextureNormal:(SKTexture *)normal selected:(SKTexture *)selected;
- (id)initWithTextureNormal:(SKTexture *)normal selected:(SKTexture *)selected disabled:(SKTexture *)disabled; // Designated Initializer

- (id)initWithImageNamedNormal:(NSString *)normal selected:(NSString *)selected;
- (id)initWithImageNamedNormal:(NSString *)normal selected:(NSString *)selected disabled:(NSString *)disabled;

/** Sets the target-action pair, that is called when the Button is tapped.
 "target" won't be retained.
 */
- (void)setTouchUpInsideTarget:(id)target action:(SEL)action;
- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchUpTarget:(id)target action:(SEL)action;

@end
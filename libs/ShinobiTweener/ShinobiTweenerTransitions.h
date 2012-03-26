//
//  ShinobiTweenerTransitions.h
//  ShinobiTweener
//
//  Created by lznpde on 31/10/2010.
//  Copyright 2010 Shinobi Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShinobiTweenerStructures.h"

@interface ShinobiTweenerTransitions : NSObject {

}

+ (float) linear:(TweenProperty)tween;

+ (float) backEaseIn:(TweenProperty)tween;
+ (float) backEaseOut:(TweenProperty)tween;
+ (float) backEaseInOut:(TweenProperty)tween;

+ (float) bounceEaseIn:(TweenProperty)tween;
+ (float) bounceEaseOut:(TweenProperty)tween;
+ (float) bounceEaseInOut:(TweenProperty)tween;

+ (float) circEaseIn:(TweenProperty)tween;
+ (float) circEaseOut:(TweenProperty)tween;
+ (float) circEaseInOut:(TweenProperty)tween;

+ (float) cubicEaseIn:(TweenProperty)tween;
+ (float) cubicEaseOut:(TweenProperty)tween;
+ (float) cubicEaseInOut:(TweenProperty)tween;

+ (float) elasticEaseIn:(TweenProperty)tween;
+ (float) elasticEaseOut:(TweenProperty)tween;
+ (float) elasticEaseInOut:(TweenProperty)tween;

+ (float) expoEaseIn:(TweenProperty)tween;
+ (float) expoEaseOut:(TweenProperty)tween;
+ (float) expoEaseInOut:(TweenProperty)tween;

+ (float) quadEaseIn:(TweenProperty)tween;
+ (float) quadEaseOut:(TweenProperty)tween;
+ (float) quadEaseInOut:(TweenProperty)tween;

+ (float) quartEaseIn:(TweenProperty)tween;
+ (float) quartEaseOut:(TweenProperty)tween;
+ (float) quartEaseInOut:(TweenProperty)tween;

+ (float) quintEaseIn:(TweenProperty)tween;
+ (float) quintEaseOut:(TweenProperty)tween;
+ (float) quintEaseInOut:(TweenProperty)tween;

+ (float) sineEaseIn:(TweenProperty)tween;
+ (float) sineEaseOut:(TweenProperty)tween;
+ (float) sineEaseInOut:(TweenProperty)tween;

@end

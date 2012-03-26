/**
 
 Disclaimer for John P. Giatropoulos' TweenC library
 
 TERMS OF USE - TWEENC
 
 Open source under the Apache License 2.0.
 
 Copyright © 2009 John P. Giatropoulos
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the 
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 **/

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "TweenConstants.h"

#define degreesToRadians(x) ((M_PI * x) / 180.0)
#define radiansToDegrees(x) ((180 / M_PI) * x)

/**
 * protocol to calculate the position of the Tweened object.
 * all of the easing objects will implement this protocol.
 */
@protocol TweenObject
// this will calculate the position for one axis.
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d;
@end


/**
 * the main Tweening engine
 */
@interface TweenerAnimation : CAKeyframeAnimation 
{
}

// Class 
+(id)addTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changePos duration:(double)duration;
+(id)addRotationTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changePos duration:(double)duration;
+(id)addScaleTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changeScale duration:(float)duration;
+(id)addOpacityTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changeScale duration:(float)duration;


// Instance
-(void)calculatePositionForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration;
-(void)calculateDegreesForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration;
-(void)calculateScaleForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration;
-(void)calculateOpacityForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration;
@end

// EaseNone
@interface EaseNone : NSObject <TweenObject>{}
@end

// Cubic
@interface EaseInCubic : NSObject <TweenObject>{}
@end
@interface EaseOutCubic : NSObject <TweenObject>{}
@end
@interface EaseInOutCubic : NSObject <TweenObject>{}
@end

// Quad
@interface EaseInQuad : NSObject <TweenObject>{}
@end
@interface EaseOutQuad : NSObject <TweenObject>{}
@end
@interface EaseInOutQuad : NSObject <TweenObject>{}
@end

// Quint
@interface EaseInQuint : NSObject <TweenObject>{}
@end
@interface EaseOutQuint : NSObject <TweenObject>{}
@end
@interface EaseInOutQuint : NSObject <TweenObject>{}
@end

// Bounce
@interface EaseInBounce : NSObject <TweenObject>{}
@end
@interface EaseOutBounce : NSObject <TweenObject>{}
@end
@interface EaseInOutBounce : NSObject <TweenObject>{}
@end

// Back
@interface EaseInBack : NSObject <TweenObject>{}
@end
@interface EaseOutBack : NSObject <TweenObject>{}
@end
@interface EaseInOutBack : NSObject <TweenObject>{}
@end

// Expo
@interface EaseInExpo : NSObject <TweenObject>{}
@end
@interface EaseOutExpo : NSObject <TweenObject>{}
@end
@interface EaseInOutExpo : NSObject <TweenObject>{}
@end

// Sine
@interface EaseInSine : NSObject <TweenObject>{}
@end
@interface EaseOutSine : NSObject <TweenObject>{}
@end
@interface EaseInOutSine : NSObject <TweenObject>{}
@end

// Circ
@interface EaseInCirc : NSObject <TweenObject>{}
@end
@interface EaseOutCirc : NSObject <TweenObject>{}
@end
@interface EaseInOutCirc : NSObject <TweenObject>{}
@end

// Quart
@interface EaseInQuart : NSObject <TweenObject>{}
@end
@interface EaseOutQuart : NSObject <TweenObject>{}
@end
@interface EaseInOutQuart : NSObject <TweenObject>{}
@end

// Elastic
@interface EaseInElastic : NSObject <TweenObject>{}
@end
@interface EaseOutElastic : NSObject <TweenObject>{}
@end
@interface EaseInOutElastic : NSObject <TweenObject>{}
@end
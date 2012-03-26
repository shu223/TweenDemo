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

#import "TweenerAnimation.h"
#import "TweenEquations.h"


@implementation TweenerAnimation

#pragma mark -
#pragma mark adding Tweens

// add a position tween
+(id)addTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changePos duration:(double)duration{
	
	
	
	// lets create a default in case...
	NSObject *myTweenObject		= [[EaseNone alloc] init];
	
	// lets make sure the class we are trying to instantiate exists!
	if( NSClassFromString(tweenObject) != nil ){
		// lets set an initial easing function
		myTweenObject = [[NSClassFromString(tweenObject) alloc] init];	
	}
	
	// tell the CAKeyframeAnimation what type of path we will be animating on
	id animation	= [self animationWithKeyPath:keyPath];
	
	// now we can determine which type of animation we will be using for the Tween
	// all we have to do here is make the call to calculate the frames for the 
	// type of Tween passed in.
	 
	[animation calculatePositionForObject:myTweenObject start:start change:changePos duration:duration];
	return animation;
}


// lets move the object along a path and tween it all the while!

+(id)addRotationTween:(NSString * const)tweenObject 
		   forKeyPath:(NSString *)keyPath 
				start:(double)start 
			   change:(double)changePos 
			 duration:(double)duration{
	
	// lets create a default in case...
	NSObject *myTweenObject		= [[EaseNone alloc] init];
	
	// lets make sure the class we are trying to instantiate exists!
	if( NSClassFromString(tweenObject) != nil ){
		// lets set an initial easing function
		myTweenObject = [[NSClassFromString(tweenObject) alloc] init];	
	}
	
	// tell the CAKeyframeAnimation what type of path we will be animating on
	id animation	= [self animationWithKeyPath:keyPath];
	[animation setDelegate:self];
	
	// now we can determine which type of animation we will be using for the Tween
	// all we have to do here is make the call to calculate the frames for the 
	// type of Tween passed in.
	[animation calculateDegreesForObject:myTweenObject start:start change:changePos duration:duration];
	return animation;
}


// add a scale tween
+(id)addScaleTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changeScale duration:(float)duration{
	
	
	// lets create a default in case...
	NSObject *myTweenObject		= [[EaseNone alloc] init];
	
	// lets make sure the class we are trying to instantiate exists!
	if( NSClassFromString(tweenObject) != nil ){
		// lets set an initial easing function
		myTweenObject = [[NSClassFromString(tweenObject) alloc] init];	
	}
	
	// tell the CAKeyframeAnimation what type of path we will be animating on
	id animation	= [self animationWithKeyPath:keyPath];
	[animation setDelegate:self];
	
	// now we can determine which type of animation we will be using for the Tween
	// all we have to do here is make the call to calculate the frames for the 
	// type of Tween passed in.
	[animation calculateScaleForObject:myTweenObject start:start change:changeScale duration:duration];
	
	return animation;
	
}


/**
 * Opacity Tween
 *
 * this will animate the "fading" of the views opacity
 *
 */

+(id)addOpacityTween:(NSString * const)tweenObject forKeyPath:(NSString *)keyPath start:(double)start change:(double)changeScale duration:(float)duration
{
	
	// lets create a default in case...
	NSObject *myTweenObject		= [[EaseNone alloc] init];
	
	// lets make sure the class we are trying to instantiate exists!
	if( NSClassFromString(tweenObject) != nil ){
		// lets set an initial easing function
		myTweenObject = [[NSClassFromString(tweenObject) alloc] init];	
	}
	
	// tell the CAKeyframeAnimation what type of path we will be animating on
	id animation	= [self animationWithKeyPath:keyPath];
	[animation setDelegate:self];
	
	// calculate frames
	[animation calculateOpacityForObject:myTweenObject start:start change:changeScale duration:duration];
	
	return animation;
}



#pragma mark -
#pragma mark calculations

// calculate the position change and add to a values array for the animation.values property.
-(void)calculatePositionForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration{
	
	NSUInteger count = duration;// + 2;
	
	// this is the array to hold all of the values that are needed for the animation. (keyFrames)
	NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:count];
	
	double progress = 0.0;
	NSUInteger i;
	
	for (i = 0; i < count; i++)
	{
		// time will always start at 0, and be incremented based on this loop
		double value	= [tweenObject calculatePositionWithTime:progress start:startPos change: changePos duration:duration];// * (changePos);// - startPos);
		[valueArray addObject:[NSNumber numberWithDouble:value]];
		progress++;
		if( progress > duration) break;
	}
	
	[self setValues:valueArray];
}

// calculate the degrees we need for the rotation of the object based on the start degrees and the change
// and add this array to the animation.values property.
-(void)calculateDegreesForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration{
	
	NSUInteger count = duration;// + 2;
	
	// this is the array to hold all of the values that are needed for the animation. (keyFrames)
	NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:count];
	double progress = 0.0;
	
	// rotation is different, we have to calculate the amount of rotation, basically 
	// how many times does it go around the circle?
	
	for (int i = 0; i < count; i++){		
		// time will always start at 0, and be incremented based on this loop
		double value	= [tweenObject calculatePositionWithTime:progress start:radiansToDegrees(startPos) change:radiansToDegrees(changePos) duration:duration];
		[valueArray addObject:[NSNumber numberWithDouble:degreesToRadians(value)]];//[NSNumber numberWithFloat:value]];
		progress = (i / (double)(count - 1)) * 100;
		//if( progress > duration) break;
	}
		
	[self setValues:valueArray];
}

// calculate the easing points for this view.
-(void)calculateScaleForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration{
	
	NSUInteger count = duration;
	
	// this is the array to hold all of the values that are needed for the animation. (keyFrames)
	NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:count];
	double progress = 0.0;
	
	for (int i = 0; i < count; i++){
		// time will always start at 0, and be incremented based on this loop
		double value	= [tweenObject calculatePositionWithTime:progress start:startPos change: changePos duration:duration];
		[valueArray addObject:[NSNumber numberWithDouble:value]];
		//NSLog(@"NEW SCALE VALUE %.2f", value);
		progress = (i / (double)(count - 1)) * 100;
		if( progress > duration) break;
	}
	
	[self setValues:valueArray];
	
}

// calculate the easing points for this view.
-(void)calculateOpacityForObject:(NSObject<TweenObject> *)tweenObject start:(double)startPos change:(double)changePos duration:(double)duration
{
	
	NSUInteger count = duration;
	
	// this is the array to hold all of the values that are needed for the animation. (keyFrames)
	NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:count];
	double progress = 0.0;
	
	// !!!!!
	// we need to figure out WHY this wont return values other than 1!!!!!!
	// !!!!!
	
	for (int i = 0; i < count; i++){
		// time will always start at 0, and be incremented based on this loop
		double value	= [tweenObject calculatePositionWithTime:progress start:startPos change: changePos duration:duration];
		[valueArray addObject:[NSNumber numberWithDouble:value]];
		NSLog(@"NEW OPACITY VALUE %.2f", value);
		progress = (i / (double)(count - 1)) * 100;
		if( progress > duration) break;
	}
	
	[self setValues:valueArray];
	
}


#pragma mark -
#pragma mark delegate methods for the animation

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
	
	
}

- (void)animationDidStart:(CAAnimation *)theAnimation
{
	
	
}

@end



/**
 * EaseNone
 */
@implementation EaseNone
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeNone(t, b, c, d);
}
@end

// Cubic

@implementation EaseInCubic
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInCubic(t, b, c, d);
}
@end
@implementation EaseOutCubic
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutCubic(t, b, c, d);
}
@end
@implementation EaseInOutCubic
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutCubic(t, b, c, d);
}
@end

// Quad

@implementation EaseInQuad
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
		return easeInQuad(t, b, c, d);
}
@end
@implementation EaseOutQuad
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutQuad(t, b, c, d);
}
@end
@implementation EaseInOutQuad
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutQuad(t, b, c, d);
}
@end

// Quint

@implementation EaseInQuint
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInQuint(t, b, c, d);
}
@end
@implementation EaseOutQuint
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutQuint(t, b, c, d);
}
@end
@implementation EaseInOutQuint
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutQuint(t, b, c, d);
}
@end


// Bounce

@implementation EaseInBounce
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInBounce(t, b, c, d);
}
@end
@implementation EaseOutBounce
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutBounce(t, b, c, d);
}
@end
@implementation EaseInOutBounce
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutBounce(t, b, c, d);
}
@end


// Back

@implementation EaseInBack
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInBack(t, b, c, d);
}
@end
@implementation EaseOutBack
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutBack(t, b, c, d);
}
@end
@implementation EaseInOutBack
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutBack(t, b, c, d);
}
@end

// Expo

@implementation EaseInExpo
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInExpo(t, b, c, d);
}
@end
@implementation EaseOutExpo
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutExpo(t, b, c, d);
}
@end
@implementation EaseInOutExpo
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutExpo(t, b, c, d);
}
@end

// Sine

@implementation EaseInSine
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInSine(t, b, c, d);
}
@end
@implementation EaseOutSine
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutSine(t, b, c, d);
}
@end
@implementation EaseInOutSine
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutSine(t, b, c, d);
}
@end

// Circ

@implementation EaseInCirc
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInCirc(t, b, c, d);
}
@end
@implementation EaseOutCirc
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutCirc(t, b, c, d);
}
@end
@implementation EaseInOutCirc
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutCirc(t, b, c, d);
}
@end

// Quart

@implementation EaseInQuart
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInQuart(t, b, c, d);
}
@end
@implementation EaseOutQuart
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutQuart(t, b, c, d);
}
@end
@implementation EaseInOutQuart
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutQuart(t, b, c, d);
}
@end

// Elastic
@implementation EaseOutElastic
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutElastic(t, b, c, d);
}
@end
@implementation EaseInElastic
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInElastic(t, b, c, d);
}
@end
@implementation EaseInOutElastic
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutElastic(t, b, c, d);
}
@end
/*
@implementation EaseOutQuart
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeOutQuart(t, b, c, d);
}
@end
@implementation EaseInOutQuart
-(double)calculatePositionWithTime:(double)t start:(double)b change:(double)c duration:(double)d{
	return easeInOutQuart(t, b, c, d);
}
@end
 */




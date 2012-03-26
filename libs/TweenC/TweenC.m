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

#import "TweenC.h"


@implementation TweenC

static TweenC *sharedInstance = nil;

+(void)animateView:(UIView *)someView{
}

// position
+(void)animateView:(UIView *)someView withAnimation:(NSString *)animationType andDuration:(float)duration toPoint:(CGPoint)point delegate:(id)aDelegate
{
	
	// lets start the transaction
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:duration] forKey:kCATransactionAnimationDuration];
	
	// now lets grab our animation from our handy dandy TweenAnimation class.
	// 30 frames per second
	CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	
	// create the animation for the Y coordinate
	
	float yPos	= 0.0;
	if( someView.frame.origin.y < point.y )
	{
		yPos = point.y - someView.frame.origin.y;
	}
	else
	{
		yPos = -(someView.frame.origin.y - point.y);
	}
	
	TweenerAnimation *animationY	= [TweenerAnimation 
								   addTween:animationType
								   forKeyPath:@"position.y" 
								   start:[[[someView layer] valueForKeyPath:@"position.y"] floatValue]// someView.center.y
								   change:yPos duration:30];
	
	// calculate the difference in the x positions...that is the change...
    // > UPD
//	float xPos	= someView.frame.origin.x - point.x;
	float xPos	= point.x - someView.frame.origin.x;
    // < UPD
	NSLog(@"change in pos: %.2f, %.2f", xPos, yPos);
	// create the animation for the X coordinate
	TweenerAnimation *animationX	= [TweenerAnimation 
								   addTween:animationType
								   forKeyPath:@"position.x" 
								   start:[[[someView layer] valueForKeyPath:@"position.x"] floatValue]//someView.center.x
								   change:xPos duration:30];
	
	// lets add our animations to the group
	animationGroup.animations = [NSArray arrayWithObjects:animationX, animationY, nil];
	[animationGroup setFillMode:kCAFillModeForwards];
	[animationGroup setRemovedOnCompletion:NO];
	[animationGroup setDelegate:aDelegate];
	
	
	[[someView layer] addAnimation:animationGroup forKey:@"position"];
	// this must be set explicitly, or this will not "take"
	someView.frame	= CGRectMake(point.x, point.y, someView.bounds.size.width, someView.bounds.size.height);
	[CATransaction commit];
	
}

// rotation
+(void)rotateView:(UIView *)someView 
		   onAxis:(NSString *)axis 
	withAnimation:(NSString *)animationType 
	  andDuration:(float)duration 
		toDegrees:(float)degrees 
		 delegate:(id)aDelegate{
	
	// evaluate the axis we are spinning on
	
	NSString *keyPath	= @"transform.rotation.z"; // default
	double startRotation;
	
	if( [axis isEqualToString:@"x"]){
		keyPath	= @"transform.rotation.x";
		startRotation	= [[[someView layer] valueForKeyPath:@"transform.rotation.x"] floatValue];
	}
	
	if( [axis isEqualToString:@"y"]){
		keyPath = @"transform.rotation.y";
		startRotation	= [[[someView layer] valueForKeyPath:@"transform.rotation.y"] floatValue];
	}
	
	if( [axis isEqualToString:@"z"]){
		keyPath = @"transform.rotation.z";
		startRotation	= [[[someView layer] valueForKeyPath:@"transform.rotation.z"] floatValue];
	}
	
	
	// lets figure out WHERE to rotate this thing to....
	double toRotation	= degreesToRadians(degrees) + startRotation;
		
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:duration] forKey:kCATransactionAnimationDuration];	
	TweenerAnimation *animation	= [TweenerAnimation 
								   addRotationTween:animationType
								   forKeyPath:keyPath 
								   start: startRotation
								   change:degreesToRadians(degrees)//toRotation
								   duration:30];
	
	// make sure it stays in the same position!
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];
	[animation setDelegate:aDelegate];
		
	[[someView layer] setValue:[NSNumber numberWithFloat: toRotation] forKeyPath:keyPath];
	[[someView layer] addAnimation:animation forKey:keyPath];
		
	[CATransaction commit];
	
}

/**
 * scaleView:toScale:withAnimation:withDuration:delegate
 *
 *
 *
 */

+(void)scaleView:(UIView *)someView 
		 toScale:(float)scale 
   withAnimation:(NSString *)animationType 
	withDuration:(float)duration 
		delegate:(id)aDelegate{
	
	
	// evaluate the axis we are spinning on
	
	NSString *keyPath	= @"transform.scale";
	
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:duration] forKey:kCATransactionAnimationDuration];
	
	// because the iPhone treats "scale" as a number from the original value
	// if I say scale = -.5 it will shrink, but setting to .5 will increase it!
	// so at all times, just do scale - 1. (if less than 1, will be negative, and shrink)
	// if positive, it will increase by that value.
		float oldScale	= [[[someView layer] valueForKeyPath:@"transform.scale"] floatValue];
	// the scale we are moving towards
		float toScale	= 1;
	
	// if the original scale is greater than the scale we are moving towarsds, then we should 
	// make it negative so the keyframes go in reverse order to mimic shrinking. 
	// otherwise...vice versa.
		if( scale < oldScale ){
			toScale = -(scale);
		}else{
			toScale = scale;
		}
	
	
	/*
	// the original opacity
	float from	= [[[someView layer] valueForKeyPath:@"transform.scale"] floatValue];
	// the scale we are moving towards
	float to		= 1;
	float change	= 0; 
	// if the original scale is greater than the scale we are moving towarsds, then we should 
	// make it negative so the keyframes go in reverse order to mimic shrinking. 
	// otherwise...vice versa.
	
	if( scale < 1 ){
		to		= (from * scale);// -(from - alpha);
		change	= -(from - to);
	}else{
		to = scale;
		change	= from + scale;
	}
	
	// then the difference between the from and to is the change!
	
	
	NSLog(@"old scale %.2f new %.2f CHANGE : %.2f", from, to, change);
	*/
	
	
	// generate the animation
	TweenerAnimation *animation	= [TweenerAnimation 
								   addScaleTween:animationType
								   forKeyPath:keyPath 
								   start:oldScale
								   change:toScale
								   duration:30]; // we do 30 for duration to calculate the keyframes
								  	
	
	// make sure it stays in the same position!
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];
	[animation setDelegate:aDelegate];
	
	[[someView layer] setValue:[NSNumber numberWithFloat: toScale] forKeyPath:keyPath];
	[[someView layer] addAnimation:animation forKey:keyPath];
	
	[CATransaction commit];
}

#pragma mark -
#pragma mark opacity

// scale a view to a particular value
+(void)fadeView:(UIView *)someView toAlpha:(float)alpha withAnimation:(NSString *)animationType withDuration:(float)duration delegate:(id)aDelegate
{	
	
	// the original opacity
		float from	= [[[someView layer] valueForKeyPath:@"opacity"] floatValue];
	// the scale we are moving towards
		float to		= 1;
		float change	= 0; 
	// if the original scale is greater than the scale we are moving towarsds, then we should 
	// make it negative so the keyframes go in reverse order to mimic shrinking. 
	// otherwise...vice versa.
	
		if( alpha < 1 ){
			to		= (from * alpha);
			change	= -(from - to);
		}else{
			to = alpha;
			change	= from + alpha;
		}
	
	// then the difference between the from and to is the change!
	
	
	NSLog(@"old opacity %.2f new %.2f CHANGE : %.2f", from, to, change);
	
	// evaluate the axis we are spinning on
	
	NSString *keyPath	= @"opacity";
	
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:duration] forKey:kCATransactionAnimationDuration];	
	
	TweenerAnimation *animation	= [TweenerAnimation 
								   addOpacityTween:animationType 
								   forKeyPath:keyPath 
								   start:from
								   change:change
								   duration:30];
	
	
	// make sure it stays in the same position!
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];
	[animation setDelegate:aDelegate];
	
	[[someView layer] setValue:[NSNumber numberWithFloat: alpha] forKeyPath:keyPath];
	[[someView layer] addAnimation:animation forKey:keyPath];
	[CATransaction commit];
	
	
}

#pragma mark -
#pragma mark Singleton

+ (TweenC*)sharedInstance{
	
    @synchronized(self) {
		
        if (sharedInstance == nil) {
			
            [[self alloc] init]; // assignment not done here
			
        }
		
    }
	
    return sharedInstance;
	
}



+ (id)allocWithZone:(NSZone *)zone

{
	
    @synchronized(self) {
		
        if (sharedInstance == nil) {
			
            sharedInstance = [super allocWithZone:zone];
			
            return sharedInstance;  // assignment and return on first allocation
			
        }
		
    }
	
    return nil; //on subsequent allocation attempts return nil
	
}



- (id)copyWithZone:(NSZone *)zone

{
	
    return self;
	
}



- (id)retain

{
	
    return self;
	
}



- (unsigned)retainCount

{
	
    return UINT_MAX;  //denotes an object that cannot be released
	
}



- (void)release

{
	
    //do nothing
	
}



- (id)autorelease

{
	
    return self;
	
}
@end

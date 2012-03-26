//
//  ShinobiTweener.m
//  ShinobiTweener
//
//  Created by lznpde on 28/10/2010.
//  Copyright 2010 Shinobi Corp. All rights reserved.
//

#import "ShinobiTweener.h"

@implementation ShinobiTweener

@synthesize reversedPropertyIsSetAtStart;
@synthesize loopDelta;
@synthesize useLoopDelta;

static ShinobiTweener *sharedInstance;

+ (id) sharedTweener
{
    if (sharedInstance == nil)
	{
        sharedInstance = [[super allocWithZone:NULL] init];
    }
	
    return sharedInstance;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [[self sharedTweener] retain];
}

- (id) copyWithZone:(NSZone *)zone
{
    return self;
}

- (id) retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (void)release
{
	
}

- (id) init
{	
    self = [super init];
	if(self)
	{
		[self initTweener];
	}
	
	return self;
}

- (void) initTweener
{
	useLoopDelta = NO;
	loopDelta = 1.0f;
	
	reversedPropertyIsSetAtStart = YES;
	
	if (tweenList != nil)
	{
		[tweenList removeAllObjects];
		[tweenList release];
		tweenList = nil;
	}
	
	tweenList = [[NSMutableArray alloc] init];
	
	if (delayList != nil)
	{
		[delayList removeAllObjects];
		[delayList release];
		delayList = nil;
	}
	
	delayList = [[NSMutableArray alloc] init];
}


#pragma mark AddTweenToFloat

- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDuration:(float)timeDuration transition:(uint)transition
{
	float begin = *pointer;
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, 0.0f, timeDuration, begin, finish, finish - begin, transition, nil, nil, NO, reversedPropertyIsSetAtStart);
	[tweenList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector
{
	float begin = *pointer;
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, 0.0f, timeDuration, begin, finish, finish - begin, transition, selector, nil, NO, reversedPropertyIsSetAtStart);
	[tweenList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object
{
	float begin = *pointer;
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, 0.0f, timeDuration, begin, finish, finish - begin, transition, selector, object, NO, reversedPropertyIsSetAtStart);
	[tweenList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

#pragma mark AddTweenToFloat Delay
- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition
{
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, timeDelay, timeDuration, 0.0f, finish, 0.0f, transition, nil, nil, NO, reversedPropertyIsSetAtStart);
	[delayList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector
{
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, timeDelay, timeDuration, 0.0f, finish, 0.0f, transition, selector, nil, NO, reversedPropertyIsSetAtStart);
	[delayList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object
{
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, timeDelay, timeDuration, 0.0f, finish, 0.0f, transition, selector, object, NO, reversedPropertyIsSetAtStart);
	[delayList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

#pragma mark AddTweenToFloatReversed
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDuration:(float)timeDuration transition:(uint)transition
{
	float finish = *pointer;
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, 0.0f, timeDuration, start, finish, finish - start, transition, nil, nil, YES, reversedPropertyIsSetAtStart);	
	[tweenList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector
{
	float finish = *pointer;
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, 0.0f, timeDuration, start, finish, finish - start, transition, selector, nil, YES, reversedPropertyIsSetAtStart);	
	[tweenList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object
{
	float finish = *pointer;
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, 0.0f, timeDuration, start, finish, finish - start, transition, selector, object, YES, reversedPropertyIsSetAtStart);	
	[tweenList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

#pragma mark AddTweenToFloatReversed Delay
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition
{
	float finish = 0.0f;
	
	if(reversedPropertyIsSetAtStart)
	{
		finish = *pointer;
		*pointer = start;
	}
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, timeDelay, timeDuration, start, finish, 0.0f, transition, nil, nil, YES, reversedPropertyIsSetAtStart);
	[delayList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector
{
	float finish = 0.0f;
	
	if(reversedPropertyIsSetAtStart)
	{
		finish = *pointer;
		*pointer = start;
	}
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, timeDelay, timeDuration, start, finish, 0.0f, transition, selector, nil, YES, reversedPropertyIsSetAtStart);
	[delayList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object
{
	float finish = 0.0f;
	
	if(reversedPropertyIsSetAtStart)
	{
		finish = *pointer;
		*pointer = start;
	}
	
	TweenProperty tween = TweenPropertyMake(pointer, [[NSDate date] timeIntervalSince1970], 0.0f, timeDelay, timeDuration, start, finish, 0.0f, transition, selector, object, YES, reversedPropertyIsSetAtStart);
	[delayList addObject:[NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)]];
}

- (void) removeTweensFromFloat:(float *)pointer
{
	int i;
	
	i = [tweenList count];
	while (i--)
	{

	}
	
	i = [delayList count];
	while (i--)
	{
		
	}
}

- (void) killAllTweens
{
	[tweenList removeAllObjects];
	[delayList removeAllObjects];
}

#pragma mark Helper methods

- (float) getTweenPosition:(TweenProperty)tween
{
	float value = 0.0f;
	
	switch (tween.transition)
	{			
		case TWEENER_TRANSITION_BACK_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions backEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions backEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_BACK_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions backEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions backEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_BACK_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions backEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions backEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_BOUNCE_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions bounceEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions bounceEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_BOUNCE_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions bounceEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions bounceEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_BOUNCE_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions bounceEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions bounceEaseInOut:tween];
			}
		break;
		
		case TWEENER_TRANSITION_CIRC_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions circEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions circEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_CIRC_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions circEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions circEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_CIRC_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions circEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions circEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_CUBIC_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions cubicEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions cubicEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_CUBIC_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions cubicEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions cubicEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_CUBIC_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions cubicEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions cubicEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_ELASTIC_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions elasticEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions elasticEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_ELASTIC_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions elasticEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions elasticEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_ELASTIC_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions elasticEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions elasticEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_EXPO_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions expoEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions expoEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_EXPO_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions expoEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions expoEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_EXPO_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions expoEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions expoEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUAD_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quadEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quadEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUAD_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quadEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quadEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUAD_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quadEaseInOut:tween] * loopDelta;
			} else {
			}
		break;
			
		case TWEENER_TRANSITION_QUART_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quartEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quartEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUART_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quartEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quartEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUART_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quartEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quartEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUINT_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quintEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quintEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUINT_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quintEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quintEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_QUINT_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions quintEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions quintEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_SINE_EASE_IN:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions sineEaseIn:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions sineEaseIn:tween];
			}
		break;
			
		case TWEENER_TRANSITION_SINE_EASE_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions sineEaseOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions sineEaseOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_SINE_EASE_IN_OUT:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions sineEaseInOut:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions sineEaseInOut:tween];
			}
		break;
			
		case TWEENER_TRANSITION_NONE:
		break;
			
		default:
			if(useLoopDelta)
			{
				value = [ShinobiTweenerTransitions linear:tween] * loopDelta;
			} else {
				value = [ShinobiTweenerTransitions linear:tween];
			}
		break;
	}
	
	return value;
}

- (TweenProperty) getTweenPropertyFromTweenListIndex:(uint)index
{
	NSValue *vTween = [tweenList objectAtIndex:index];
	TweenProperty tween;
	[vTween	getValue:&tween];
	
	return tween;
}

- (void) setTweenProperty:(TweenProperty)tween inTweenListIndex:(uint)index
{
	NSValue *vTween = [NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)];
	[tweenList replaceObjectAtIndex:index withObject:vTween];
}

- (TweenProperty) getTweenPropertyFromDelayListIndex:(uint)index
{
	NSValue *vTween = [delayList objectAtIndex:index];
	TweenProperty tween;
	[vTween	getValue:&tween];
	
	return tween;
}

- (void) setTweenProperty:(TweenProperty)tween inDelayList:(uint)index
{
	NSValue *vTween = [NSValue valueWithBytes:&tween objCType:@encode(TweenProperty)];
	[delayList replaceObjectAtIndex:index withObject:vTween];
}

- (BOOL) hasItemsInTweenList
{
	if([tweenList count] > 0)
	{
		return YES;
	} else {
		return NO;
	}
}

- (void) hasItemsInTweenListLog
{
	NSLog(@"[SF] ShinobiTweener -> hasItemsInTweenList: %@ (%i)", [self hasItemsInTweenList] ? @"YES" : @"NO", [tweenList count]);
}

- (BOOL) hasItemsInDelayList
{
	if([delayList count] > 0)
	{
		return YES;
	} else {
		return NO;
	}
}

- (void) hasItemsInDelayListLog
{
	NSLog(@"[SF] ShinobiTweener -> hasItemsInDelayList: %@ (%i)", [self hasItemsInDelayList] ? @"YES" : @"NO", [delayList count]);
}

#pragma mark Update
- (void) update
{	
	NSMutableIndexSet *removalTweenIndex = [[NSMutableIndexSet alloc] init];
	NSMutableIndexSet *removalDelayIndex = [[NSMutableIndexSet alloc] init];
	
	// DelayList
	for (uint i = 0; i < [delayList count]; i++)
	{	
		TweenProperty tween = [self getTweenPropertyFromDelayListIndex:i];
		tween.timeDelta = [[NSDate date] timeIntervalSince1970] - tween.timeBegin;
		
		// Check if delay has elapsed
		if (tween.timeDelta >= tween.timeDelay)
		{
			// remove item from delay list
			[removalDelayIndex addIndex:i];
            
            if(!tween.reverse)
			{
				[self addTweenToFloat:tween.floatPointer finish:tween.finish timeDuration:tween.timeDuration transition:tween.transition onComplete:tween.onCompleteSelector forObject:tween.onCompleteObject];
			} else {
				if(tween.reversedPropertyIsSetAtStart)
				{
					[self addTweenToFloat:tween.floatPointer finish:tween.finish timeDuration:tween.timeDuration transition:tween.transition onComplete:tween.onCompleteSelector forObject:tween.onCompleteObject];
				} else {
					[self addTweenToFloatReversed:tween.floatPointer start:tween.begin timeDuration:tween.timeDuration transition:tween.transition onComplete:tween.onCompleteSelector forObject:tween.onCompleteObject];
				}
			}
		} else {
			// Store update in array
			[self setTweenProperty:tween inDelayList:i];
		}
	}
	
	if([removalDelayIndex count] > 0 && [self hasItemsInDelayList])
	{
		[delayList removeObjectsAtIndexes:removalDelayIndex];
	}
	[removalDelayIndex release];
	
	
	// TweenList
	for (uint i = 0; i < [tweenList count]; i++)
	{
		BOOL closeTween = NO;
		
		// Get tween property
		TweenProperty tween = [self getTweenPropertyFromTweenListIndex:i];
		tween.timeDelta = [[NSDate date] timeIntervalSince1970] - tween.timeBegin;
		
		// check it duration has elapsed
		if(tween.timeDelta >= tween.timeDuration)
		{
			tween.timeDelta = tween.timeDuration;
			closeTween = YES;
		}
		
        *tween.floatPointer = [self getTweenPosition:tween];
			
		if(closeTween)
		{
			// Remove item from tween list
			[removalTweenIndex addIndex:i];
			
			if (tween.onCompleteSelector && tween.onCompleteObject)
			{
				[tween.onCompleteObject performSelector:tween.onCompleteSelector];
			}
		} else {
			// Store update in array
			[self setTweenProperty:tween inTweenListIndex:i];
		}
	}
	
	// Remove objects that have finished!
	if([removalTweenIndex count] > 0 && [self hasItemsInTweenList])
	{
		[tweenList removeObjectsAtIndexes:removalTweenIndex];
	}
	
	[removalTweenIndex release];
	
}

- (void) dealloc
{	
	[tweenList release];
	[delayList release];
	
	[super dealloc];
}

@end

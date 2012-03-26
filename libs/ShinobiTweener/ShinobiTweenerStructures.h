//
//  ShinobiTweenerStructures.h
//  ShinobiTweener
//
//  Created by lznpde on 31/10/2010.
//  Copyright 2010 Shinobi Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

// AddTweenToSprite types

// Transitions
typedef enum
{
    TWEENER_TRANSITION_LINEAR,
    TWEENER_TRANSITION_BACK_EASE_IN,
    TWEENER_TRANSITION_BACK_EASE_OUT,
    TWEENER_TRANSITION_BACK_EASE_IN_OUT,
    TWEENER_TRANSITION_BOUNCE_EASE_IN,
    TWEENER_TRANSITION_BOUNCE_EASE_OUT,
    TWEENER_TRANSITION_BOUNCE_EASE_IN_OUT,
    TWEENER_TRANSITION_CIRC_EASE_IN,
    TWEENER_TRANSITION_CIRC_EASE_OUT,
    TWEENER_TRANSITION_CIRC_EASE_IN_OUT,
    TWEENER_TRANSITION_CUBIC_EASE_IN,
    TWEENER_TRANSITION_CUBIC_EASE_OUT,
    TWEENER_TRANSITION_CUBIC_EASE_IN_OUT,
    TWEENER_TRANSITION_ELASTIC_EASE_IN,
    TWEENER_TRANSITION_ELASTIC_EASE_OUT,
    TWEENER_TRANSITION_ELASTIC_EASE_IN_OUT,
    TWEENER_TRANSITION_EXPO_EASE_IN,
    TWEENER_TRANSITION_EXPO_EASE_OUT,
    TWEENER_TRANSITION_EXPO_EASE_IN_OUT,
    TWEENER_TRANSITION_QUAD_EASE_IN,
    TWEENER_TRANSITION_QUAD_EASE_OUT,
    TWEENER_TRANSITION_QUAD_EASE_IN_OUT,
    TWEENER_TRANSITION_QUART_EASE_IN,
    TWEENER_TRANSITION_QUART_EASE_OUT,
    TWEENER_TRANSITION_QUART_EASE_IN_OUT,
    TWEENER_TRANSITION_QUINT_EASE_IN,
    TWEENER_TRANSITION_QUINT_EASE_OUT,
    TWEENER_TRANSITION_QUINT_EASE_IN_OUT,
    TWEENER_TRANSITION_SINE_EASE_IN,
    TWEENER_TRANSITION_SINE_EASE_OUT,
    TWEENER_TRANSITION_SINE_EASE_IN_OUT,
    TWEENER_TRANSITION_NONE
} ShinobiTweenerTransitionTypes;


typedef struct
{
	float *floatPointer;
		
	double timeBegin;
	float timeDelta;
	float timeDelay;
	float timeDuration;
	
	float begin;
	float finish;
	float change;
	
	uint transition;
	
	SEL onCompleteSelector;
	id onCompleteObject;
	
	BOOL reverse;
	BOOL reversedPropertyIsSetAtStart;
	
} TweenProperty;

static inline TweenProperty TweenPropertyMake(float *floatPointer, double timeBegin, float timeDelta, float timeDelay, float timeDuration, float begin, float finish, float change, uint transition, SEL onCompleteSelector, id onCompleteObject, BOOL reverse, BOOL reversePropertyIsSetAtStart)
{	
	return (TweenProperty) { floatPointer, timeBegin, timeDelta, timeDelay, timeDuration, begin, finish, change, transition, onCompleteSelector, onCompleteObject, reverse, reversePropertyIsSetAtStart };
}

@interface ShinobiTweenerStructures : NSObject {

}

@end

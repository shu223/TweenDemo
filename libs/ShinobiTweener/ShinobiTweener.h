//
//  ShinobiTweener.h
//  ShinobiTweener
//
//  Created by lznpde on 28/10/2010.
//  Copyright 2010 Shinobi Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShinobiTweenerStructures.h"
#import "ShinobiTweenerTransitions.h"

@interface ShinobiTweener : NSObject {
	NSMutableArray *tweenList;
	NSMutableArray *delayList;
	
	float loopDelta;
	BOOL useLoopDelta;
	BOOL reversedPropertyIsSetAtStart;
}

@property(nonatomic, readwrite) BOOL useLoopDelta;
@property(nonatomic, readwrite) BOOL reversedPropertyIsSetAtStart;
@property(nonatomic, readwrite) float loopDelta;

+ (id) sharedTweener;
- (void) initTweener;

- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDuration:(float)timeDuration transition:(uint)transition;
- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector;
- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object;
- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition;
- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector;
- (void) addTweenToFloat:(float *)pointer finish:(float)finish timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object;

- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDuration:(float)timeDuration transition:(uint)transition;
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector;
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object;
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition;
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector;
- (void) addTweenToFloatReversed:(float *)pointer start:(float)start timeDelay:(float)timeDelay timeDuration:(float)timeDuration transition:(uint)transition onComplete:(SEL)selector forObject:(id)object;

- (void) killAllTweens;
- (float) getTweenPosition:(TweenProperty)tween;

- (TweenProperty) getTweenPropertyFromTweenListIndex:(uint)index;
- (void) setTweenProperty:(TweenProperty)tween inTweenListIndex:(uint)index;
- (TweenProperty) getTweenPropertyFromDelayListIndex:(uint)index;
- (void) setTweenProperty:(TweenProperty)tween inDelayList:(uint)index;

- (BOOL) hasItemsInTweenList;
- (void) hasItemsInTweenListLog;
- (BOOL) hasItemsInDelayList;
- (void) hasItemsInDelayListLog;

- (void) update;
@end

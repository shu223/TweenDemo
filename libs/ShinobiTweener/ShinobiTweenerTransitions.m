//
//  ShinobiTweenerTransitions.m
//  ShinobiTweener
//
//  Created by lznpde on 31/10/2010.
//  Copyright 2010 Shinobi Corp. All rights reserved.
//
//  Tween Example for t,d,b,c:
//  TweenPropertyMake(nil, 0.0f, t, d, b, nil, c, nil);
//

#import "ShinobiTweenerTransitions.h"

@implementation ShinobiTweenerTransitions

+ (float) linear:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*t/d + b;
}

+ (float) backEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	float s = 1.70158f;
	
	return c*(t/=d)*t*((s+1.0f)*t - s) + b;
}

+ (float) backEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	float s = 1.70158f;
	
	return c*((t=t/d-1.0f)*t*((s+1.0f)*t + s) + 1.0f) + b;
}

+ (float) backEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	float s = 1.70158f;
	
	if ((t/=d/2.0f) < 1.0f)
	{
		return c/2.0f*(t*t*(((s*=(1.525f))+1.0f)*t - s)) + b;
	} else {
		return c/2.0f*((t-=2.0f)*t*(((s*=(1.525f))+1.0f)*t + s) + 2.0f) + b;
	}
}

+ (float) bounceEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c - [self bounceEaseOut:TweenPropertyMake(nil, 0.0f, d-t, 0.0f, d, 0.0f, 0.0f, c, 0.0f, nil, nil, NO, NO)] + b;
}

+ (float) bounceEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if ((t/=d) < (1.0f/2.75f)) {
		return c*(7.5625f*t*t) + b;
	} else if (t < (2.0f/2.75f)) {
		return c*(7.5625f*(t-=(1.5f/2.75f))*t + 0.75f) + b;
	} else if (t < (2.5f/2.75f)) {
		return c*(7.5625f*(t-=(2.25f/2.75f))*t + 0.9375f) + b;
	} else {
		return c*(7.5625f*(t-=(2.625f/2.75f))*t + 0.984375f) + b;
	}
}

+ (float) bounceEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;

	if (t < d/2.0f)
	{
		return [self bounceEaseIn:TweenPropertyMake(nil, 0.0f, t*2, 0.0f, d, 0.0f, 0.0f, c, 0, nil, nil, NO, NO)] * .5 + b;
	} else {
		return [self bounceEaseOut:TweenPropertyMake(nil, 0.0f, t*2-d, 0.0f, d, 0, 0.0f, c, 0.0f, nil, nil, NO, NO)] * .5 + c*.5 + b;
	}
}

+ (float) circEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return -c * (sqrt(1.0f - (t/=d)*t) - 1.0f) + b;
}

+ (float) circEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c * sqrt(1.0f - (t=t/d-1.0f)*t) + b;
}

+ (float) circEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if ((t/=d/2) < 1)
	{
		return -c/2.0f * (sqrt(1.0f - t*t) - 1.0f) + b;
	} else {
		return c/2.0f * (sqrt(1.0f - (t-=2.0f)*t) + 1.0f) + b;
	}
}

+ (float) cubicEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*(t/=d)*t*t + b;
}

+ (float) cubicEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*((t=t/d-1.0f)*t*t + 1.0f) + b;
}

+ (float) cubicEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if ((t/=d/2) < 1)
	{
		return c/2*t*t*t + b;
	} else {
		return c/2*((t-=2)*t*t + 2) + b;
	}
}

+ (float) elasticEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	float p = d*0.3f;
	float a = c;
	float s = p/(2.0f*M_PI) * asin(c/a);
	
	if (t==0.0f) return b; 
	if ((t/=d)==1.0f) return b+c;
	
	return -(a*pow(2.0f,10.0f*(t-=1.0f)) * sin( (t*d-s)*(2.0f*M_PI)/p )) + b;
}

+ (float) elasticEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	float p = d*0.3f;
	float a = c;
	float s = p/(2.0f*M_PI) * asin(c/a);
	
	if (t==0.0f) return b;
	if ((t/=d)==1.0f) return b+c;
	
	return (a*pow(2.0f,-10.0f*t) * sin( (t*d-s)*(2.0f*M_PI)/p ) + c + b);
}

+ (float) elasticEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	float p = d*0.3f;
	float a = c;
	float s = p/(2.0f*M_PI) * asin(c/a);
	
	if (t==0.0f) return b; 
	if ((t/=d/2.0f)==2.0f) return b+c; 
	
	if (t < 1.0f)
	{
		return -0.5f*(a*pow(2.0f,10.0f*(t-=1.0f)) * sin( (t*d-s)*(2.0f*M_PI)/p )) + b;
	} else {
		return a*pow(2.0f,-10.0f*(t-=1.0f)) * sin( (t*d-s)*(2.0f*M_PI)/p )*0.5f + c + b;
	}
}

+ (float) expoEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return (t==0.0f) ? b : c * pow(2.0f, 10.0f * (t/d - 1.0f)) + b;
}

+ (float) expoEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return (t==d) ? b+c : c * (-pow(2.0f, -10.0f * t/d) + 1.0f) + b;
}

+ (float) expoEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if (t==0.0f) return b;
	if (t==d) return b+c;
	
	if ((t/=d/2.0f) < 1.0f)
	{
		return c/2.0f * pow(2.0f, 10.0f * (t - 1.0f)) + b;
	} else {
		return c/2.0f * (-pow(2.0f, -10.0f * --t) + 2.0f) + b;
	}
}

+ (float) quadEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*(t/=d)*t + b;
}

+ (float) quadEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return -c *(t/=d)*(t-2.0f) + b;
}

+ (float) quadEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if ((t/=d/2.0f) < 1.0f)
	{
		return c/2.0f*t*t + b;
	} else {
		return -c/2.0f * ((--t)*(t-2.0f) - 1.0f) + b;
	}
}

+ (float) quartEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*(t/=d)*t*t*t + b;
}

+ (float) quartEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return -c * ((t=t/d-1.0f)*t*t*t - 1.0f) + b;
}

+ (float) quartEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if ((t/=d/2.0f) < 1.0f)
	{
		return c/2.0f*t*t*t*t + b;
	} else {
		return -c/2.0f * ((t-=2.0f)*t*t*t - 2.0f) + b;
	}
}

+ (float) quintEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*(t/=d)*t*t*t*t + b;
}

+ (float) quintEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c*((t=t/d-10.f)*t*t*t*t + 1.0f) + b;
}

+ (float) quintEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	if ((t/=d/2.0f) < 1.0f) 
	{
		return c/2.0f*t*t*t*t*t + b;
	} else {
		return c/2.0f*((t-=2.0f)*t*t*t*t + 2.0f) + b;
	}
}

+ (float) sineEaseIn:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return -c * cos(t/d * (M_PI/2.0f)) + c + b;
}

+ (float) sineEaseOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return c * sin(t/d * (M_PI/2.0f)) + b;
}

+ (float) sineEaseInOut:(TweenProperty)tween
{
	float t = tween.timeDelta;
	float d = tween.timeDuration;
	float b = tween.begin;
	float c = tween.change;
	
	return -c/2.0f * (cos(M_PI*t/d) - 1.0f) + b;
}

@end

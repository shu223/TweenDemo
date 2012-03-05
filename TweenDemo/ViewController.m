//
//  ViewController.m
//  TweenDemo
//
//  Copyright (c) 2012 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "PRTween.h"
#import "TweenC.h"
#import "ShinobiTweener.h"

#define kFromCenterPos    CGPointMake(50, 134)
#define kToCenterPos      CGPointMake(270, 134)
#define kToOriginPos      CGPointMake(245, 109)




@interface ViewController ()
{
    BOOL isShinobiTweenFinished;
    CGFloat shinobiValue;
}
@property (nonatomic, retain) PRTweenOperation *activeTweenOperation;
@end



@implementation ViewController

@synthesize segmentedCtl;
@synthesize animateView;
@synthesize activeTweenOperation;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.segmentedCtl = nil;
    self.animateView = nil;
    [super viewDidUnload];
}

- (void)dealloc
{    
    [self viewDidUnload];
    self.activeTweenOperation = nil;
    [super dealloc];
}


#pragma mark -------------------------------------------------------------------
#pragma mark Private Functions for PRTween

- (void)update:(PRTweenPeriod*)period
{
    [self.animateView setCenter:CGPointMake(period.tweenedValue, kToCenterPos.y)];
}


#pragma mark -------------------------------------------------------------------
#pragma mark Private Functions for ShinobiTweener

- (void)tweenUpdate
{
    if(!isShinobiTweenFinished)
    {
        [[ShinobiTweener sharedTweener] update];
        [self.animateView setCenter:CGPointMake(shinobiValue, kToCenterPos.y)];
        
        [self tweenLoop];
    }
}

- (void)tweenLoop
{
    [NSTimer scheduledTimerWithTimeInterval:(1.0f / 30.0f)
                                     target:self
                                   selector:@selector(tweenUpdate)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)tweenFinish
{
    isShinobiTweenFinished = YES;
}



#pragma mark -------------------------------------------------------------------
#pragma mark CAAnimationDelegate Functoins for TweenC

- (void)animationDidStart:(CAAnimation *)anim
{
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    [[self.animateView layer] removeAllAnimations];
}



#pragma mark -------------------------------------------------------------------
#pragma mark Action

- (IBAction)pressBtn {

    [self.animateView setCenter:kFromCenterPos];
    
    switch (segmentedCtl.selectedSegmentIndex) {
        case 0:
        {
            // PRTween
            [[PRTween sharedInstance] removeTweenOperation:self.activeTweenOperation];
            
            PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:kFromCenterPos.x endValue:kToCenterPos.x duration:1.0];
            self.activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
                                                                          target:self
                                                                        selector:@selector(update:)
                                                                  timingFunction:&PRTweenTimingFunctionBounceOut];
            
            break;
        }   
        case 1:
        {
            // Shinobi Tweener
            [[ShinobiTweener sharedTweener] killAllTweens];
            shinobiValue = kFromCenterPos.x;
            
            isShinobiTweenFinished = NO;
            [self tweenLoop];

            [[ShinobiTweener sharedTweener] addTweenToFloat:&shinobiValue
                                                     finish:kToCenterPos.x
                                               timeDuration:1.0
                                                 transition:TWEENER_TRANSITION_BOUNCE_EASE_OUT
                                                 onComplete:@selector(tweenFinish)
                                                  forObject:self];

            break;
        }
        case 2:
        {
            // TweenC
            [[self.animateView layer] removeAllAnimations];

            [TweenC animateView:self.animateView 
                  withAnimation:kTweenEaseOutBounce
                    andDuration:1.0
                        toPoint:kToOriginPos
                       delegate:self];

            break;
        }
        default:
            break;
    }
}

@end

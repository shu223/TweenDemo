//
//  ViewController.h
//  TweenDemo
//
//  Copyright (c) 2012 Shuichi Tsutsumi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedCtl;
@property (nonatomic, retain) IBOutlet UIImageView *animateView;

- (IBAction)pressBtn;

@end

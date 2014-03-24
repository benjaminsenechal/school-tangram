//
//  ViewController.m
//  school-tangram
//
//  Created by Benjamin SENECHAL on 22/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize Square;

#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    Square = [[SquareView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    Square.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    Square.userInteractionEnabled = YES;
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handle:)];
    [Square addGestureRecognizer:recognizer];
    [self.view addSubview:Square];
}

#pragma mark Gestures

- (IBAction)handle:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

@end

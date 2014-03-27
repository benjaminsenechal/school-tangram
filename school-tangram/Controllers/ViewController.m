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
@synthesize Parallelogram;
@synthesize GreenTriangle;
@synthesize BlueTriangle;

#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    Parallelogram = [[ParallelogramView alloc]initWithFrame:CGRectMake(100, 100, 220, 80)];
    [Parallelogram setColor:[UIColor colorWithRed:255.0/255.0 green:229.0/255.0 blue:0.0/255.0 alpha:1]];
    
    GreenTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(300, 300, 290, 245)];
    GreenTriangle.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [GreenTriangle setColor:[UIColor colorWithRed:83.0/255.0 green:175.0/255.0 blue:49.0/255.0 alpha:1]];
    
    BlueTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(200, 200, 290, 245)];
    [BlueTriangle setColor:[UIColor colorWithRed:41.0/255.0 green:179.0/255.0 blue:213.0/255.0 alpha:1]];
    
    Square = [[SquareView alloc] initWithFrame:CGRectMake(400, 400, 100, 100)];
    Square.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    
    [self addGestureToUI:Square];
    [self addGestureToUI:Parallelogram];
    [self addGestureToUI:GreenTriangle];
    [self addGestureToUI:BlueTriangle];

    [self.view addSubview:GreenTriangle];
    [self.view addSubview:BlueTriangle];
    [self.view addSubview:Parallelogram];
    [self.view addSubview:Square];
}

#pragma mark Gestures

- (void)addGestureToUI:(UIView*)view
{
    view.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(PanGesture:)];
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(RotateGesture:)];

    [view addGestureRecognizer:pan];
    [view addGestureRecognizer:rotate];
}

- (IBAction)PanGesture:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (IBAction)RotateGesture:(UIRotationGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (IBAction)PinchGesture:(UIPinchGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

@end

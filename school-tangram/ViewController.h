//
//  ViewController.h
//  school-tangram
//
//  Created by Benjamin SENECHAL on 22/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareView.h"
#import "ParallelogramView.h"
#import "TriangleView.h"
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet SquareView *Square;
@property (strong, nonatomic) IBOutlet ParallelogramView *Parallelogram;
@property (strong, nonatomic) IBOutlet TriangleView *GreenTriangle;
@property (strong, nonatomic) IBOutlet TriangleView *BlueTriangle;

- (IBAction)PanGesture:(UIPanGestureRecognizer *)recognizer;
- (IBAction)PinchGesture:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)RotateGesture:(UIRotationGestureRecognizer *)recognizer;

@end

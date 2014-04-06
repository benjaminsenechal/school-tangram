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
@synthesize PurpleTriangle;
@synthesize OrangeTriangle;
@synthesize RedTriangle;

#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    Parallelogram = [[ParallelogramView alloc]initWithFrame:CGRectMake(100, 100, 220, 80)];
    [Parallelogram setColor:[UIColor colorWithRed:255.0/255.0 green:229.0/255.0 blue:0.0/255.0 alpha:1]];
    
    CGPoint BigFirstPoint = CGPointMake(141.42, 0);
    CGPoint BigSecondPoint = CGPointMake(282.8, 141.42);
    CGPoint BigThirdPoint = CGPointMake(0, 141.42);

    GreenTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(300, 300, 290, 141.42)];
    GreenTriangle.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [self setPointsToTriangleWithTheFirst:BigFirstPoint theSecond:BigSecondPoint andTheThird:BigThirdPoint On:GreenTriangle WithColor:[UIColor colorWithRed:83.0/255.0 green:175.0/255.0 blue:49.0/255.0 alpha:1]];
    
    BlueTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(200, 200, 290, 141.42)];
    [self setPointsToTriangleWithTheFirst:BigFirstPoint theSecond:BigSecondPoint andTheThird:BigThirdPoint On:BlueTriangle WithColor:[UIColor colorWithRed:41.0/255.0 green:179.0/255.0 blue:213.0/255.0 alpha:1]];
    
    CGPoint SmallFirstPoint = CGPointMake(70.71, 0);
    CGPoint SmallSecondPoint = CGPointMake(141.42, 70.71);
    CGPoint SmallThirdPoint = CGPointMake(0, 70.71);
    
    PurpleTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(100, 100, 141.42, 70.71)];
    [self setPointsToTriangleWithTheFirst:SmallFirstPoint theSecond:SmallSecondPoint andTheThird:SmallThirdPoint On:PurpleTriangle WithColor:[UIColor colorWithRed:100.0/255.0 green:34.0/255.0 blue:97.0/255.0 alpha:1]];
    PurpleTriangle.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    OrangeTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(150, 150, 141.42, 70.71)];
    [self setPointsToTriangleWithTheFirst:SmallFirstPoint theSecond:SmallSecondPoint andTheThird:SmallThirdPoint On:OrangeTriangle WithColor:[UIColor colorWithRed:240.0/255.0 green:127.0/255.0 blue:49.0/255.0 alpha:1]];
    OrangeTriangle.transform = CGAffineTransformMakeRotation(M_PI);
    
    CGPoint MiddleFirstPoint = CGPointMake(100, 0);
    CGPoint MiddleSecondPoint = CGPointMake(200, 100);
    CGPoint MiddleThirdPoint = CGPointMake(0, 100);
    
    RedTriangle = [[TriangleView alloc]initWithFrame:CGRectMake(200, 200, 290, 141.42)];
    [self setPointsToTriangleWithTheFirst:MiddleFirstPoint theSecond:MiddleSecondPoint andTheThird:MiddleThirdPoint On:RedTriangle WithColor:[UIColor colorWithRed:222.0/255.0 green:0.0/255.0 blue:57.0/255.0 alpha:1]];
    RedTriangle.transform = CGAffineTransformMakeRotation(-M_PI_4);

    Square = [[SquareView alloc] initWithFrame:CGRectMake(400, 400, 100, 100)];
    Square.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    [self addGestureToUI:RedTriangle];
    [self addGestureToUI:Square];
    [self addGestureToUI:Parallelogram];
    [self addGestureToUI:GreenTriangle];
    [self addGestureToUI:BlueTriangle];
    [self addGestureToUI:PurpleTriangle];
    [self addGestureToUI:OrangeTriangle];
    
    
    
    [self.view addSubview:[self addBlurEffect]];
    [self.view addSubview:RedTriangle];
    [self.view addSubview:OrangeTriangle];
    [self.view addSubview:PurpleTriangle];
    [self.view addSubview:GreenTriangle];
    [self.view addSubview:BlueTriangle];
    [self.view addSubview:Parallelogram];
    [self.view addSubview:Square];
    
}

#pragma mark Style

- (UIImageView *)addBlurEffect
{
    UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.frame];
    background.contentMode = UIViewContentModeScaleAspectFill;
    [background setImageToBlur:[UIImage imageNamed:@"wallpaper"]
                    blurRadius:kLBBlurredImageDefaultBlurRadius
               completionBlock:^(){
                   NSLog(@"Blurred image");
               }];
    return background;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark Setup Triangles

- (void)setPointsToTriangleWithTheFirst:(CGPoint)firstPoint theSecond:(CGPoint)secondPoint andTheThird:(CGPoint)thirdPoint On:(TriangleView *)view WithColor:(UIColor *)color
{
    [view setFirstPoint:firstPoint];
    [view setSecondPoint:secondPoint];
    [view setThirdPoint:thirdPoint];
    [view setColor:color];
}

#pragma mark Gestures

- (void)addGestureToUI:(UIView *)view
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

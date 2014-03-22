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

- (void)viewDidLoad
{
    [super viewDidLoad];
    SquareView *v = [[SquareView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    v.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    [self.view addSubview:v];
}

@end

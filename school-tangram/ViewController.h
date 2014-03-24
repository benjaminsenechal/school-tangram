//
//  ViewController.h
//  school-tangram
//
//  Created by Benjamin SENECHAL on 22/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet SquareView *Square;
- (IBAction)handle:(UIPanGestureRecognizer *)recognizer;

@end

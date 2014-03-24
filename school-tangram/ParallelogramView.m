//
//  ParallelogramView.m
//  school-tangram
//
//  Created by Benjamin SENECHAL on 24/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import "ParallelogramView.h"

@implementation ParallelogramView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(75,0)];
        [path addLineToPoint:CGPointMake(217.5, 0)];
        [path addLineToPoint:CGPointMake(142.5,75)];
        [path addLineToPoint:CGPointMake(0,75)];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithRed:255.0/255.0 green:229.0/255.0 blue:0.0/255.0 alpha:1] setFill];
    [[UIColor colorWithRed:255.0/255.0 green:229.0/255.0 blue:0.0/255.0 alpha:1] setStroke];
    [path closePath];
    [path fill];
    [path stroke];
    [path closePath];
}


@end

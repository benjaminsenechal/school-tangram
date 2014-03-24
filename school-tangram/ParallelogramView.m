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
        [path moveToPoint:CGPointMake(200,200)];
        [path addLineToPoint:CGPointMake(400,200)];
        [path addLineToPoint:CGPointMake(300,300)];
        [path addLineToPoint:CGPointMake(100,300)];
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
}


@end

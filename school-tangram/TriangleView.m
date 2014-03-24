//
//  TriangleView.m
//  school-tangram
//
//  Created by Benjamin SENECHAL on 24/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

- (void)setColor:(UIColor *)color
{
    _color = color;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(141.2, 0)];
        [path addLineToPoint:CGPointMake(290, 144.94)];
        [path addLineToPoint:CGPointMake(0, 144.94)];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [_color setFill];
    [_color setStroke];
    //[[UIColor colorWithRed:83.0/255.0 green:175.0/255.0 blue:49.0/255.0 alpha:1] setFill];
    //[[UIColor colorWithRed:83.0/255.0 green:175.0/255.0 blue:49.0/255.0 alpha:1] setStroke];
    [path closePath];
    [path fill];
    [path stroke];
    [path closePath];
}


@end

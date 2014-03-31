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

- (void)setFirstPoint:(CGPoint)firstPoint
{
    _firstPoint = firstPoint;
}

- (void)setSecondPoint:(CGPoint)secondPoint
{
    _secondPoint = secondPoint;
}

- (void)setThirdPoint:(CGPoint)thirdPoint
{
    _thirdPoint = thirdPoint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        path = [[UIBezierPath alloc] init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [path moveToPoint:_firstPoint];
    [path addLineToPoint:_secondPoint];
    [path addLineToPoint:_thirdPoint];
    [_color setFill];
    [_color setStroke];
    [path fill];
    [path stroke];
    [path closePath];
}

@end

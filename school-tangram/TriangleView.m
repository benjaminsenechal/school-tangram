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
        [path addLineToPoint:CGPointMake(282.8, 141.42)];
        [path addLineToPoint:CGPointMake(0, 141.42)];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [_color setFill];
    [_color setStroke];
    [path fill];
    [path stroke];
    [path closePath];
}

@end

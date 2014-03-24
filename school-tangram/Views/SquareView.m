//
//  SqaureView.m
//  school-tangram
//
//  Created by Benjamin SENECHAL on 22/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import "SquareView.h"

@implementation SquareView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:158.0/255.0 green:52.0/255.0 blue:139.0/255.0 alpha:1];
        path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(self.frame.origin.x,self.frame.origin.y)];
        [path addLineToPoint:CGPointMake(self.frame.origin.x+self.frame.size.width, self.frame.origin.y)];
        [path addLineToPoint:CGPointMake(self.frame.origin.x+self.frame.size.width, self.frame.origin.y+self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.origin.x, self.frame.origin.y+self.frame.size.height)];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [path closePath];
}

@end

//
//  TriangleView.h
//  school-tangram
//
//  Created by Benjamin SENECHAL on 24/03/2014.
//  Copyright (c) 2014 Benjamin SENECHAL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TriangleView : UIView{
    UIBezierPath *path;
}

@property(nonatomic) UIColor *color;
@property(nonatomic) CGPoint firstPoint;
@property(nonatomic) CGPoint secondPoint;
@property(nonatomic) CGPoint thirdPoint;

@end

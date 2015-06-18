//
//  LineDDA.h
//  CGSample
//
//  Created by Su Xin on 15/6/18.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GLUT/GLUT.h>

@interface LineDDA : NSOpenGLView

- (int) roundi: (const float)a;
- (void) lineDDA: (int)x0 yStart:(int)y0 xEnd:(int)x1 yEnd:(int)y1;

@end

//
//  LineDDA.m
//  CGSample
//
//  Created by Su Xin on 15/6/18.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "LineDDA.h"

@implementation LineDDA

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
	NSRect rect = [self bounds];
	
	glClearColor( 1.0f, 1.0f, 1.0f, 0.0f );

	glClear(GL_COLOR_BUFFER_BIT);

	glColor4f( 0.0, 1.0, 0.0, 1.0);

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(rect.origin.x, rect.size.width, rect.origin.y, rect.size.height, -1.0f, 1.0f );

	[self lineDDA:rect.origin.x yStart:rect.origin.y xEnd:rect.size.width yEnd:rect.size.height];

	glFlush();
}

- (int) roundi: (const float)a;
{
	return (int)( a + 0.5);
}

- (void) lineDDA: (int)x0 yStart:(int)y0 xEnd:(int)x1 yEnd:(int)y1
{
	int dx = 0, dy = 0, k = 0, steps = 0;
	float xInc = 0.0, yInc = 0, x = 0.0, y = 0.0;
	
	dx = x1 - x0;
	dy = y1 - y0;

	x = x0;
	y = y0;

	if(fabs(dx) > fabs(dy))
		steps = fabs(dx);
	else
		steps = fabs(dy);

	xInc = (float)dx / (float)steps;
	yInc = (float)dy / (float)steps;

glBegin(GL_LINES);
	glVertex2f([self roundi: x], [self roundi: y]);
	for (k = 0; k < steps; k++) {
		x += xInc;
		y += yInc;
		glVertex2f([self roundi: x], [self roundi: y]);
	}
glEnd();
}

- (void)prepareOpenGL
{
}

@end

//
//  LineBresenham.m
//  CGSample
//
//  Created by Su Xin on 15/6/18.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "LineBresenham.h"

@implementation LineBresenham

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
	
	[self lineBresenham:rect.origin.x yStart:rect.origin.y xEnd:rect.size.width yEnd:rect.size.height];

	glFlush();
}

- (void) lineBresenham: (int)x0 yStart:(int)y0 xEnd:(int)x1 yEnd:(int)y1
{
	int dx = fabsf( x1 - x0 ), dy = fabsf( y1 - y0 );
	int x = 0, y = 0, p = 2 * dy - dx;
	int twoDy = 2 * dy, twoDyMinusDx = 2 * ( dy - dx );

	/* Determine which endpoint to use as start position */
	if (x0 > x1) {
		x = x1;
		y = y1;
		x1 = x0;
	}
	else
	{
		x = x0;
		y = y0;
	}

glBegin(GL_LINES);
	glVertex2f(x, y);
	while (x < x1) {
		x++;
		if (p < 0) {
			p += twoDy;
		}
		else {
			y++;
			p += twoDyMinusDx;
		}
		glVertex2f(x, y);
	}
glEnd();
}

@end

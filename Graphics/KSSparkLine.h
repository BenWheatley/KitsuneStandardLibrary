//
//  KSSparkLine.h
//  Runestone
//
//  Created by Ben Wheatley on 26/03/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "cocos2d.h"

#define BLUE_HALO (ccc3(125, 62, 255)) // Magic numbers come from eyedropper tool
#define YELLOW_HALO (ccc3(0xCC, 0xFF, 0x88)) // Magic numbers!!!

@interface KSSparkLine : CCNode <CCRGBAProtocol> {
    CGPoint _point1, _point2;
    double _maxSideDelta;
    NSMutableArray *_pointData;
    int _maxOctave; // Should not exceed 5 due to behaviour of OpenGL ES
    GLfloat _lineThickness;
    GLfloat _haloThickness;
    
	GLubyte _opacity;
	ccColor3B _color, _haloColor;
}

@property (nonatomic, readwrite, assign) CGPoint point1;
@property (nonatomic, readwrite, assign) CGPoint point2;
@property (nonatomic, readwrite, assign) double maxSideDelta;
@property (nonatomic, readwrite, assign) NSMutableArray *pointData;
@property (nonatomic, readwrite, assign) int maxOctave;
@property (nonatomic, readwrite, assign) GLfloat lineThickness;
@property (nonatomic, readwrite, assign) GLfloat haloThickness;
@property (nonatomic, readwrite, assign) GLubyte opacity;
@property (nonatomic, readwrite, assign) ccColor3B color;
@property (nonatomic, readwrite, assign) ccColor3B haloColor;

-(void) rebuildSpark;

@end

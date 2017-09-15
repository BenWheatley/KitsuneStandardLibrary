//
//  KSSparkLine.m
//  Runestone
//
//  Created by Ben Wheatley on 26/03/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "KSSparkLine.h"

// TODO: have to rewrite this entire class anyway due to OpenGL library changes, disable everything within it for now

@implementation KSSparkLine

@synthesize point1, point2;
@synthesize maxSideDelta;
@synthesize pointData;
@synthesize maxOctave;
@synthesize lineThickness, haloThickness;
@synthesize opacity;
@synthesize color, haloColor;

-(id) init {
	if ((self=[super init])) {
        self.pointData = [[NSMutableArray arrayWithCapacity:0] retain];
        self.maxOctave = 4;
        self.maxSideDelta = 50;
		self.color = UIColor.whiteColor;
        self.haloColor = BLUE_HALO;
        self.alpha = 0xFF;
        self.lineThickness = 4.0f;
        self.haloThickness = 35;
    }
	
	return self;
}

-(void) rebuildSpark {
//    CGPoint unitVector = ccpNormalize(ccpSub(_point1, _point2));
//    CGPoint maxSideVector = ccp(-unitVector.y, unitVector.x);
//    maxSideVector = ccpMult(maxSideVector, self.maxSideDelta);
//    NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:0];
//    NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:0];
//    [array1 addObject:[NSNumber numberWithFloat:_point1.x]];
//    [array1 addObject:[NSNumber numberWithFloat:_point1.y]];
//    [array1 addObject:[NSNumber numberWithFloat:_point2.x]];
//    [array1 addObject:[NSNumber numberWithFloat:_point2.y]];
//    float currentOcatveMultiplier = 1;
//    
//    for (int octave=0; octave<self.maxOctave; ++octave) {
//        
//        for (int i=0; i<[array1 count]; i+=2) {
//            float x1 = [[array1 objectAtIndex:i+0] floatValue];
//            float y1 = [[array1 objectAtIndex:i+1] floatValue];
//            [array2 addObject:[NSNumber numberWithFloat:x1]];
//            [array2 addObject:[NSNumber numberWithFloat:y1]];
//            if (i+3<[array1 count]) {
//                float x2 = [[array1 objectAtIndex:i+2] floatValue];
//                float y2 = [[array1 objectAtIndex:i+3] floatValue];
//                float xMidpoint = (x1+x2)/2;
//                float yMidpoint = (y1+y2)/2;
//                float delta = currentOcatveMultiplier * CCRANDOM_MINUS1_1();
//                float xDelta = maxSideVector.x * delta;
//                float yDelta = maxSideVector.y * delta;
//                
//                float newX = (xMidpoint+xDelta);
//                float newY = (yMidpoint+yDelta);
//                
//                [array2 addObject:[NSNumber numberWithFloat:newX]];
//                [array2 addObject:[NSNumber numberWithFloat:newY]];
//            }
//        }
//        currentOcatveMultiplier *= 0.5;
//        // Swap array pointers
//        NSMutableArray *tmp = array1;
//        array1 = array2; array2 = tmp;
//        [array2 removeAllObjects];
//        
//    }
//    
//    [self.pointData removeAllObjects];
//    [self.pointData addObjectsFromArray:array1];
}

-(void) draw {
//    if (_opacity==0) return;
//    
//    [super draw];
//    
//    // TODO: move out of draw
//    int lineVertArrayLen = [self.pointData count];
//    GLfloat lineVertices[lineVertArrayLen];
//    for (int i=0; i<lineVertArrayLen; ++i) {
//        lineVertices[i] = [[_pointData objectAtIndex:i] floatValue];
//    }
//    
//    int lineColorArrayLen = (lineVertArrayLen/2)*4;
//    GLubyte lineColors[lineColorArrayLen];
//    for (int i=0; i<lineColorArrayLen; i+=4) {
//        lineColors[i+0] = _color.r;
//        lineColors[i+1] = _color.g;
//        lineColors[i+2] = _color.b;
//        lineColors[i+3] = _opacity;
//    }
//    
//    const int STRIDE = 4;
//    int capArrayPoints = 5;
//    int capArrayOffset = capArrayPoints*STRIDE;
//    int haloVertArrayLen = (lineVertArrayLen*2)+(capArrayOffset*2);
//    GLfloat haloVerticesLeft[haloVertArrayLen];
//    GLfloat haloVerticesRight[haloVertArrayLen];
//    
//    CGPoint haloPrimeVector = ccpMult(ccpNormalize(ccpSub(_point2, _point1)), self.haloThickness);
//    CGPoint haloNegativeVector = ccpMult(haloPrimeVector, -1);
//    GLfloat haloSideDx = -haloPrimeVector.y;
//    GLfloat haloSideDy = haloPrimeVector.x;
//    
//    // Caps
//    GLfloat baseX = lineVertices[0];
//    GLfloat baseY = lineVertices[1];
//    GLfloat tipX = lineVertices[lineVertArrayLen-2+0];
//    GLfloat tipY = lineVertices[lineVertArrayLen-2+1];
//    for (int i=0; i<=capArrayOffset; i+=STRIDE) {
//        float fraction = ((GLfloat)i/STRIDE)/((GLfloat)(capArrayPoints-1));
//        float angle = M_PI_2*(fraction);
//        // Left back
//        CGPoint delta = ccpRotateByAngle(haloNegativeVector, ccp(0, 0), -angle);
//        haloVerticesLeft[i+0] = baseX;
//        haloVerticesLeft[i+1] = baseY;
//        haloVerticesLeft[i+2] = baseX + delta.x;
//        haloVerticesLeft[i+3] = baseY + delta.y;
//        // Right back
//        delta = ccpRotateByAngle(haloNegativeVector, ccp(0, 0), angle);
//        haloVerticesRight[i+0] = baseX;
//        haloVerticesRight[i+1] = baseY;
//        haloVerticesRight[i+2] = baseX + delta.x;
//        haloVerticesRight[i+3] = baseY + delta.y;
//        
//        // Left front
//        delta = ccpRotateByAngle(haloPrimeVector, ccp(0, 0), angle);
//        haloVerticesLeft[(haloVertArrayLen-(i+4))+0] = tipX;
//        haloVerticesLeft[(haloVertArrayLen-(i+4))+1] = tipY;
//        haloVerticesLeft[(haloVertArrayLen-(i+4))+2] = tipX + delta.x;
//        haloVerticesLeft[(haloVertArrayLen-(i+4))+3] = tipY + delta.y;
//        // Right front
//        delta = ccpRotateByAngle(haloPrimeVector, ccp(0, 0), -angle);
//        haloVerticesRight[(haloVertArrayLen-(i+4))+0] = tipX;
//        haloVerticesRight[(haloVertArrayLen-(i+4))+1] = tipY;
//        haloVerticesRight[(haloVertArrayLen-(i+4))+2] = tipX + delta.x;
//        haloVerticesRight[(haloVertArrayLen-(i+4))+3] = tipY + delta.y;
//    }
//    
//    // Bodies
//    for (int i=capArrayOffset; i<haloVertArrayLen-capArrayOffset; i+=STRIDE) {
//        int srcIndex = i-capArrayOffset;
//        GLfloat srcX = lineVertices[(srcIndex/2)+0];
//        GLfloat srcY = lineVertices[(srcIndex/2)+1];
//        // Left
//        haloVerticesLeft[i+0] = srcX;
//        haloVerticesLeft[i+1] = srcY;
//        haloVerticesLeft[i+2] = srcX + haloSideDx;
//        haloVerticesLeft[i+3] = srcY + haloSideDy;
//        // Right
//        haloVerticesRight[i+0] = srcX;
//        haloVerticesRight[i+1] = srcY;
//        haloVerticesRight[i+2] = srcX - haloSideDx;
//        haloVerticesRight[i+3] = srcY - haloSideDy;
//    }
//    
//    // All the colours are the same (ish)
//    int haloColArrayLen = (haloVertArrayLen/2)*4;
//    GLubyte haloVertColors[haloColArrayLen];
//    BOOL inner = YES;
//    for (int i=0; i<haloColArrayLen; i+=4) {
//        haloVertColors[i+0] = _haloColor.r;
//        haloVertColors[i+1] = _haloColor.g;
//        haloVertColors[i+2] = _haloColor.b;
//        haloVertColors[i+3] = inner? _opacity: 0;
//        inner = !inner;
//    }
//    // End of TODO:
//    
//    glDisable(GL_TEXTURE_2D);
//    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
//    BOOL blendEnabled = glIsEnabled(GL_BLEND);
//    if (!blendEnabled) {
//        glEnable(GL_BLEND);
//    }
//	
//#ifdef OPENGL_SPEC_CHANGE
//    BOOL colorArrayEnabled = glIsEnabled(GL_COLOR_ARRAY);
//    if (!colorArrayEnabled) {
//        glEnableClientState(GL_COLOR_ARRAY);
//    }
//    
//    BOOL vertexArrayEnabled = glIsEnabled(GL_VERTEX_ARRAY);
//    if (!vertexArrayEnabled) {
//        glEnableClientState(GL_VERTEX_ARRAY);
//    }
//    
//    // Halo
//    glColorPointer(4, GL_UNSIGNED_BYTE, 0, haloVertColors);
//    glVertexPointer(2, GL_FLOAT, 0, haloVerticesLeft);
//#endif
//    glDrawArrays(GL_TRIANGLE_STRIP, 0, haloVertArrayLen/2);
//#ifdef OPENGL_SPEC_CHANGE
//    glVertexPointer(2, GL_FLOAT, 0, haloVerticesRight);
//#endif
//    glDrawArrays(GL_TRIANGLE_STRIP, 0, haloVertArrayLen/2);
//    
//    // Inner spark
//    glLineWidth(self.lineThickness);
//#ifdef OPENGL_SPEC_CHANGE
//    glColorPointer(4, GL_UNSIGNED_BYTE, 0, lineColors);
//    glVertexPointer(2, GL_FLOAT, 0, lineVertices);
//#endif
//    glDrawArrays(GL_LINE_STRIP, 0, lineVertArrayLen/2);
//    
//#ifdef OPENGL_SPEC_CHANGE
//    if (!vertexArrayEnabled) {
//        glDisableClientState(GL_VERTEX_ARRAY);
//    }
//    
//    if (!colorArrayEnabled) {
//        glDisableClientState(GL_COLOR_ARRAY);
//    }
//#endif
//    
//    if (!blendEnabled) {
//        glDisable(GL_BLEND);
//    }
//    
//    glEnable(GL_TEXTURE_2D);
}

@end

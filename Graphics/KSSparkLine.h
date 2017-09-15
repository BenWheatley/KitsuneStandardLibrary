//
//  KSSparkLine.h
//  Runestone
//
//  Created by Ben Wheatley on 26/03/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "UIColor+KSColor.h"
#import <SpriteKit/SpriteKit.h>

#define BLUE_HALO ([UIColor colorWithHexR:125 G:62 B:255]) // Magic numbers come from eyedropper tool
#define YELLOW_HALO ([UIColor colorWithHexR:0xCC G:0xFF B:0x88]) // Magic numbers!!!

@interface KSSparkLine : SKNode {
    
}

@property (nonatomic, readwrite, assign) CGPoint point1;
@property (nonatomic, readwrite, assign) CGPoint point2;
@property (nonatomic, readwrite, assign) double maxSideDelta;
@property (nonatomic, readwrite, weak) NSMutableArray *pointData;
@property (nonatomic, readwrite, assign) int maxOctave;
@property (nonatomic, readwrite, assign) GLfloat lineThickness;
@property (nonatomic, readwrite, assign) GLfloat haloThickness;
@property (nonatomic, readwrite, assign) GLubyte opacity;
@property (nonatomic, readwrite, weak) SKColor* color;
@property (nonatomic, readwrite, weak) SKColor* haloColor;

-(void) rebuildSpark;

@end

//
//  UIColor+KSColor.h
//  Runestone
//
//  Created by Ben Wheatley on 14/09/2017.
//
//

#import <UIKit/UIKit.h>

struct ColorStruct {
	CGFloat r;
	CGFloat g;
	CGFloat b;
	CGFloat a;
};
typedef struct ColorStruct ColorStruct;

@interface UIColor (KSColor)

-(ColorStruct) components;
-(CGFloat) r;
-(CGFloat) g;
-(CGFloat) b;
-(CGFloat) a;

@end

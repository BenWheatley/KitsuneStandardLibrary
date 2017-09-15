//
//  UIColor+KSColor.m
//  Runestone
//
//  Created by Ben Wheatley on 14/09/2017.
//	Based on https://stackoverflow.com/questions/816828/extracting-rgb-from-uicolor
//
//

#import "UIColor+KSColor.h"

@implementation UIColor (KSColor)

+(UIColor*) colorWithHexR:(UInt8)red G:(UInt8)green B:(UInt8)blue {
	return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

-(ColorStruct) components {
	CGColorRef color = self.CGColor;
	
	int numComponents = CGColorGetNumberOfComponents(color);
	
	ColorStruct result;
	
	if (numComponents == 4) {
		const CGFloat * data = CGColorGetComponents(color);
		result.r = data[0];
		result.g = data[1];
		result.b = data[2];
		result.a = data[3];
	}
	else {
		result.r = result.g = result.b = result.a = 0;
	}
	return result;
}

-(CGFloat) r {
	return self.components.r;
}

-(CGFloat) g {
	return self.components.g;
}

-(CGFloat) b {
	return self.components.b;
}

-(CGFloat) a {
	return self.components.a;
}
	
@end

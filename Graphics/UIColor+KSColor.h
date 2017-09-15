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

+(UIColor*) colorWithHexR:(UInt8)red G:(UInt8)green B:(UInt8)blue;

@property (NS_NONATOMIC_IOSONLY, readonly) ColorStruct components;
@property (NS_NONATOMIC_IOSONLY, readonly) CGFloat r;
@property (NS_NONATOMIC_IOSONLY, readonly) CGFloat g;
@property (NS_NONATOMIC_IOSONLY, readonly) CGFloat b;
@property (NS_NONATOMIC_IOSONLY, readonly) CGFloat a;

@end

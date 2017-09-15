//
//  KSSKMenu.m
//  Runestone
//
//  Created by Ben Wheatley on 14/09/2017.
//
//

#import "KSSKMenu.h"
#import "KSSKMenuItem.h"

@implementation KSSKMenu

-(instancetype) initWithItems:(NSArray*)items {
	if ((self=[super init])) {
		menuItems = [items mutableCopy];
		for (KSSKMenuItem *menuItem in menuItems) {
			[self addChild:menuItem];
		}
	}
	
	return self;
}

-(void)handleTouch:(CGPoint)locationInScene {
	for (KSSKMenuItem *menuItem in menuItems) {
		[menuItem handleTouch:locationInScene];
	}
}

-(void)alignItemsVerticallyWithPadding:(CGFloat)padding {
	CGFloat totalHeight = 0;
	for (KSSKMenuItem *menuItem in menuItems) {
		totalHeight += (menuItem.height+padding);
	}
	CGFloat currentY = totalHeight/2;
	for (KSSKMenuItem *menuItem in menuItems) {
		menuItem.position = CGPointMake(0, currentY);
		currentY -= (menuItem.height+padding);
	}
}

@end

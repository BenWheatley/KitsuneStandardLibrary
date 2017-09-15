//
//  KSSKMenuItem.m
//  Runestone
//
//  Created by Ben Wheatley on 14/09/2017.
//
//

#import "KSSKMenuItem.h"

@implementation KSSKMenuItem

-(instancetype) initWithNodes:(NSArray*)nodesArg block:(void (^)())blockArg {
	if ((self=[super init])) {
		nodes = [nodesArg mutableCopy];
		block = blockArg;
		for (SKNode *node in nodes) {
			[self addChild:node];
		}
	}
	
	return self;
}

-(void)handleTouch:(CGPoint)locationInScene {
	for (SKNode *node in nodes) {
		if (node.userInteractionEnabled && !node.hidden) {
			if ([node containsPoint:locationInScene]) {
				NSLog(@"containsPoint");
				if (block) {
					NSLog(@"performing block");
					block();
				}
			}
		}
	}
}

-(CGFloat)height {
	CGFloat height = 0;
	for (SKNode *node in nodes) {
		height = MAX(height, node.frame.size.height);
	}
	return height;
}

-(void)setSelectedIndex:(int)index {
	for (int i=0; i<nodes.count; ++i) {
		SKNode *node = nodes[i];
		node.hidden = i!=index;
	}
}

-(int)selectedIndex {
	for (int i=0; i<nodes.count; ++i) {
		SKNode *node = nodes[i];
		if (node.hidden == NO) {
			return i;
		}
	}
	return -1; // TODO: make it a constant not a magic number
}

@end

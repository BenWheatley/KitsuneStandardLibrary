//
//  KSSKMenuItem.h
//  Runestone
//
//  Created by Ben Wheatley on 14/09/2017.
//
//

#import <SpriteKit/SpriteKit.h>

/** A collection of SKNodes that constitute a single menu item. Sub-nodes may be hidden (or not), but collectively they represent only a single action. */
@interface KSSKMenuItem : SKNode {
	NSMutableArray *nodes;
	void (^block)();
}

-(instancetype) initWithNodes:(NSArray*)nodesArg block:(void (^)())blockArg NS_DESIGNATED_INITIALIZER;
-(void)handleTouch:(CGPoint)locationInScene;
/** Returns the height of the largest menu node. */
@property (NS_NONATOMIC_IOSONLY, readonly) CGFloat height;

@property (NS_NONATOMIC_IOSONLY) int selectedIndex;

@end

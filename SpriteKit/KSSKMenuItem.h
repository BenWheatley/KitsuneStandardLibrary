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
	id target; // TODO: This may be a memory cycle. It should be weak, but the current build target doesn't like that. Fix once it runs.
	SEL selector;
}

-(instancetype) initWithNode:(SKNode*)node target:(id)targetArg selector:(SEL)selectorArg;
-(instancetype) initWithNodes:(NSArray*)nodesArg target:(id)targetArg selector:(SEL)selectorArg;
-(instancetype) initWithNodes:(NSArray*)nodesArg block:(void (^)())block;
-(void)handleTouch:(CGPoint)locationInNode;
/** Returns the height of the largest menu node. */
-(CGFloat)height;

-(void)setSelectedIndex:(int)index;
-(int)selectedIndex;

@end

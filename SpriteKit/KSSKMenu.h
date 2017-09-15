//
//  KSSKMenu.h
//  Runestone
//
//  Created by Ben Wheatley on 14/09/2017.
//
//

#import <SpriteKit/SpriteKit.h>

@interface KSSKMenu : SKNode {
	NSMutableArray *menuItems;
}

-(instancetype) initWithItems:(NSArray*)items NS_DESIGNATED_INITIALIZER;
-(void)handleTouch:(CGPoint)locationInScene;
-(void)alignItemsVerticallyWithPadding:(CGFloat)padding;

@end

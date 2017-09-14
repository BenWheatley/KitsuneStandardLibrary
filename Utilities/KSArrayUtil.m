//
//  ArrayUtil.m
//  Runestone
//
//  Created by Ben Wheatley on 20/02/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "KSArrayUtil.h"


@implementation ArrayUtil

+(void)shuffleInPlace:(NSMutableArray*)theArray {
	int arrayLength = [theArray count];
	for (int i=0; i<arrayLength; ++i) {
		int newPosition = arc4random()%arrayLength;
		[theArray exchangeObjectAtIndex:i withObjectAtIndex:newPosition];
	}
}

@end

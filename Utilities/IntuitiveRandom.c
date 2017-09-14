//
//  IntuitiveRandom.c
//  Intuition Dice
//
//  Created by Ben Wheatley on 05/08/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "stdlib.h"
#include "IntuitiveRandom.h"
#include "math.h"
#include "stdio.h"

#define YES (1==1)
#define NO (1==0)

#define SET_SIZE (6)
#define ROLL_HISTORY_LENGTH (10)

int rollHistory[ROLL_HISTORY_LENGTH];
int numberOfRolls;

int NextIntuitiveRandomNumber(int range) {
    // Move existing history one item into the past, discarding oldest data point
	for (int i=ROLL_HISTORY_LENGTH-1; i>0; --i) {
		rollHistory[i] = rollHistory[i-1];
	}
    // Forbidden results:
    // * More than 2 of the same number in a set (of 6 rolls)
    // * More than 1 pair of matching numbers in a set "
    int matchCount;
    do {
        rollHistory[0] = rand()%range;
        matchCount = 0;
        for (int i=0; i<SET_SIZE && i<numberOfRolls; ++i) {
            for (int j=i+1; j<SET_SIZE && j<numberOfRolls; ++j) {
				if (rollHistory[i]==rollHistory[j]) {
					++matchCount; // Doing it like this makes 3-of-a-kind look like three instances of 2-of-a-kind
				}
            }
        }
    } while (matchCount>=2);
	
    ++numberOfRolls;
	
    return rollHistory[0];
}

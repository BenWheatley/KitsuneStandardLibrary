//
//  IntegerCoordinate.h
//  Runestone
//
//  Created by Ben Wheatley on 11/03/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

struct IntegerCoordinate {
    int x;
    int y;
    BOOL nonCoordinateFlag;
};
typedef struct IntegerCoordinate IntegerCoordinate;

#define INT_COORD_NONE ((IntegerCoordinate){0,0,YES})
#define INT_COORD_MAKE(__X__,__Y__) ((IntegerCoordinate){__X__,__Y__,NO})
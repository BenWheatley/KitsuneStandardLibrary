//
//  KSGameWebViewCreator.h
//  Runestone
//
//  Created by Ben Wheatley on 01/05/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark KSGameWebViewCreator

@interface KSGameWebViewCreator : NSObject {
    
}

+(UIWebView*) initWithLocalFile:(NSString*)fileNameBase fileNameExtension:(NSString*)fileNameExtension boundingRect:(CGRect)boundingRect;

@end


#pragma mark KSGameWebViewDelegate

@interface KSGameWebViewDelegate : NSObject <UIWebViewDelegate> {
@private
    
}

@end
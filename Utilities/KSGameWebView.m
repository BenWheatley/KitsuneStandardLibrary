//
//  KSGameWebViewCreator.m
//  Runestone
//
//  Created by Ben Wheatley on 01/05/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "KSGameWebView.h"


@implementation KSGameWebView

+(KSGameWebView*) makeWebViewWithLocalFile:(NSString*)fileNameBase fileNameExtension:(NSString*)fileNameExtension boundingRect:(CGRect)boundingRect {
	return [[KSGameWebView alloc] initWithLocalFile:fileNameBase fileNameExtension:fileNameExtension boundingRect:boundingRect];
}

-(instancetype) initWithLocalFile:(NSString*)fileNameBase fileNameExtension:(NSString*)fileNameExtension boundingRect:(CGRect)boundingRect {
	if (self=[super initWithFrame:boundingRect]) {
		self.backgroundColor = [UIColor clearColor];
		self.opaque = NO;
		
		NSBundle *mainBundle = [NSBundle mainBundle];
		
		NSString *path = mainBundle.bundlePath;
		NSURL *baseURL = [NSURL fileURLWithPath:path];
		NSString *filePath = [mainBundle pathForResource:fileNameBase ofType:fileNameExtension];
		NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
		
		[self loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
		
		// Remove the gradients that normally appear when user scrolls the UIWebView past the start or end of content region
		// This was written for iOS 4.2 and is almost certainly obsolete now (now = iOS 10), but it compiles and doesn't cause any harm.
		for (UIView *subView in self.subviews) {
			if ([subView isKindOfClass:UIScrollView.class]) {
				for (UIView *shadowView in subView.subviews) {
					if ([shadowView isKindOfClass:UIImageView.class]) {
						shadowView.hidden = YES;
					}
				}
			}
		}
		
		// Add a delegate
		self.delegate = KSGameWebViewDelegate.commonWebViewDelegate;
	}
    return self;
}

@end

@implementation KSGameWebViewDelegate

+ (KSGameWebViewDelegate *) commonWebViewDelegate {
	// Pattern from https://stackoverflow.com/questions/2199106/thread-safe-instantiation-of-a-singleton
	static KSGameWebViewDelegate * commonWebViewDelegate = nil;
	static dispatch_once_t pred;
	
	if (commonWebViewDelegate) {
		return commonWebViewDelegate;
	}
	
	dispatch_once(&pred, ^{
		commonWebViewDelegate = [KSGameWebViewDelegate alloc];
		commonWebViewDelegate = [commonWebViewDelegate init];
	});
	
	return commonWebViewDelegate;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [UIApplication.sharedApplication openURL:request.URL];
        return false;
    }
    return true;
}

@end

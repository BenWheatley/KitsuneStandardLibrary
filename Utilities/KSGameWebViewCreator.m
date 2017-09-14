//
//  KSGameWebViewCreator.m
//  Runestone
//
//  Created by Ben Wheatley on 01/05/2011.
//  Copyright 2011 Kitsune Software. All rights reserved.
//

#import "KSGameWebViewCreator.h"


@implementation KSGameWebViewCreator

+(UIWebView*) initWithLocalFile:(NSString*)fileNameBase fileNameExtension:(NSString*)fileNameExtension boundingRect:(CGRect)boundingRect
{
    UIWebView *result;
    
    result = [[UIWebView alloc] initWithFrame:boundingRect];
    result.backgroundColor = [UIColor clearColor];
    [result setOpaque:NO];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *path = [mainBundle bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString *filePath = [mainBundle pathForResource:fileNameBase ofType:fileNameExtension];
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    
    [result loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
    
    // Remove the gradients that normally appear when user scrolls the UIWebView past the start or end of content region
    for (UIView* subView in [result subviews]) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            for (UIView* shadowView in [subView subviews]) {
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:YES];
                }
            }
        }
    }
    
    // Add a delegate
    result.delegate = [[KSGameWebViewDelegate alloc] init];
    
    return result;
}

@end

@implementation KSGameWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:request.URL];
        return false;
    }
    return true;
}

@end

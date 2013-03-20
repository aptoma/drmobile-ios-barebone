//
//  DMViewController.m
//  DrMobile
//
//  Created by Peter Rudolfsen on 19/3/13.
//  Copyright (c) 2013 Aptoma AS. All rights reserved.
//

#import "DMViewController.h"

// URL to your integration HTML
#define INTEGRATION_URL @"http://integration/index.html"

@implementation DMViewController

@synthesize webView = _webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
}

- (void)viewDidUnload
{
    self.webView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSURL *url = [NSURL URLWithString:INTEGRATION_URL];

    self.webView.scrollView.bounces = NO;
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *encodedJson = [[request.URL resourceSpecifier] substringFromIndex:2];
    
    if (![[request.URL absoluteString] hasPrefix:@"event://"]) {
        return YES;
    }
    
    NSDictionary *data = [self encodedStringToJSON:encodedJson];
    
    NSLog(@"RECEIVED COMMAND: %@", data);
    
    return NO;
}

- (NSDictionary *)encodedStringToJSON:(NSString *)string
{
    NSString *decoded = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSData *data = [decoded dataUsingEncoding:[NSString defaultCStringEncoding]];
    
    return [NSJSONSerialization
            JSONObjectWithData:data
            options:0
            error:&error];
}

@end

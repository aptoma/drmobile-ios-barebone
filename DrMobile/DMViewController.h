//
//  DMViewController.h
//  DrMobile
//
//  Created by Peter Rudolfsen on 19/3/13.
//  Copyright (c) 2013 Aptoma AS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

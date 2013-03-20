//
//  DMAppDelegate.h
//  DrMobile
//
//  Created by Peter Rudolfsen on 19/3/13.
//  Copyright (c) 2013 Aptoma AS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMViewController;

@interface DMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DMViewController *viewController;

@end

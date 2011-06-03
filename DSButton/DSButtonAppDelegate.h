//
//  DSButtonAppDelegate.h
//  DSButton
//
//  Created by David Slone on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSButtonViewController;

@interface DSButtonAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DSButtonViewController *viewController;

@end

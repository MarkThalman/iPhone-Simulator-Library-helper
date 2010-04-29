//
//  iPhone_Simulator_Library_HelperAppDelegate.m
//  iPhone Simulator Library Helper
//
//  Created by Mark A. Thalman on 4/28/10.
//  Copyright DragonSoft 2010. All rights reserved.
//

#import "iPhone_Simulator_Library_HelperAppDelegate.h"
#import "iPhone_Simulator_Library_HelperViewController.h"

@implementation iPhone_Simulator_Library_HelperAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

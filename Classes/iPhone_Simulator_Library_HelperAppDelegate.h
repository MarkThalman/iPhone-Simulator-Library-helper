//
//  iPhone_Simulator_Library_HelperAppDelegate.h
//  iPhone Simulator Library Helper
//
//  Created by Mark A. Thalman on 4/28/10.
//  Copyright DragonSoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iPhone_Simulator_Library_HelperViewController;

@interface iPhone_Simulator_Library_HelperAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iPhone_Simulator_Library_HelperViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet iPhone_Simulator_Library_HelperViewController *viewController;

@end


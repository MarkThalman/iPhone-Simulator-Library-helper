//
//  iPhone_Simulator_Library_HelperViewController.h
//  iPhone Simulator Library Helper
//
//  Created by Mark A. Thalman on 4/28/10.
//  Copyright DragonSoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPhone_Simulator_Library_HelperViewController : UIViewController
{
	IBOutlet UITextView* results_log;
	NSMutableArray* images;
}
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void *)contextInfo;
@end


//
//  iPhone_Simulator_Library_HelperViewController.m
//  iPhone Simulator Library Helper
//
//  Created by Mark A. Thalman on 4/28/10.
//  Copyright DragonSoft 2010. All rights reserved.
//

#import "iPhone_Simulator_Library_HelperViewController.h"

@implementation iPhone_Simulator_Library_HelperViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if(!images)
		images = [[NSMutableArray alloc] init];

	[results_log setText:@""];
	UIFont* logFont = [UIFont fontWithName:@"Monaco" size:9];
	results_log.font = logFont;

	NSMutableString* resourceFullPath = [[[NSMutableString alloc] init] autorelease];
	[resourceFullPath setString:[[NSBundle mainBundle] resourcePath]];
	NSDirectoryEnumerator* itr = [[NSFileManager defaultManager] enumeratorAtPath:resourceFullPath];
	NSString* obj;
	
	while ((obj = [itr nextObject]))
	{
		if(([[obj pathExtension] isEqualToString:@"png"] || 
			[[obj pathExtension] isEqualToString:@"jpg"] ||
			[[obj pathExtension] isEqualToString:@"JPG"] ) &&
		   ![obj isEqualToString:@"Default.png"] &&
		   ![obj isEqualToString:@"Icon.png"])
		{
			NSString* fullPath = [resourceFullPath stringByAppendingPathComponent:obj];
			[images addObject:fullPath];
			[results_log setText:[NSString stringWithFormat:@"%@\nAdding:%@", [results_log text], obj]];
			[results_log setText:[NSString stringWithFormat:@"%@\nAdding:%@", [results_log text], obj]];
			
			// Autoscroll, but it requires a touch before it starts working.
			CGSize scrSize = [results_log contentSize];
			[results_log scrollRectToVisible:CGRectMake(0, scrSize.height, scrSize.width, 5) animated:YES];
		}
	}

	NSUInteger objIndex = 0;
	NSString* imageFullPath = images[objIndex];
	UIImage* image = [UIImage imageWithContentsOfFile:imageFullPath];
	UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), &objIndex);
}


- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void *)contextInfo
{
	NSUInteger objIndex = 0;
	[results_log setText:[NSString stringWithFormat:@"%@\nFinished saving %@ error:%@", [results_log text], [images[objIndex] lastPathComponent], error]];

	CGSize scrSize = [results_log contentSize];
	[results_log scrollRectToVisible:CGRectMake(0, scrSize.height, scrSize.width, 5) animated:YES];

	[images removeObjectAtIndex:objIndex];
	
	if ([images count] > 0)
	{
		NSString* imageFullPath = images[objIndex];
		UIImage* theImage = [UIImage imageWithContentsOfFile:imageFullPath];
		if(image)
			UIImageWriteToSavedPhotosAlbum(theImage, self, @selector(image:didFinishSavingWithError:contextInfo:), (void*)&objIndex);
	}
	else
		[results_log setText:[NSString stringWithFormat:@"%@\nDone!", [results_log text]]];
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [images release];
    [super dealloc];
}
@end

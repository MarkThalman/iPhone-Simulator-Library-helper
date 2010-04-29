//
//  main.m
//  iPhone Simulator Library Helper
//
//  Created by Mark A. Thalman on 4/28/10.
//  Copyright DragonSoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}

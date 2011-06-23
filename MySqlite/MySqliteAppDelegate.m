//
//  MySqliteAppDelegate.m
//  MySqlite
//
//  Created by Popcorny on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MySqliteAppDelegate.h"
#import "RootViewController.h"
#import "FMDatabase.h"

@implementation MySqliteAppDelegate

@synthesize window=_window;
@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    // Override point for customization after application launch.         
    UINavigationController* navController = [[[UINavigationController alloc] initWithRootViewController:self.viewController] autorelease];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end

//
//  AppDelegate.m
//  spotlight
//
//  Created by MyFlashLab on 6/23/16.
//  Copyright © 2016 MyFlashLab. All rights reserved.
//

#import "AppDelegate.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreSpotlight/CoreSpotlight.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler

{
    
    //check if your activity has type search action(i.e. coming from spotlight search)
    if ([userActivity.activityType isEqualToString:CSSearchableItemActionType ] == YES) {
        
        //the identifier you'll use to open specific views and the content in those views.
        NSString * identifierPath = [NSString stringWithFormat:@"%@",[userActivity.userInfo objectForKey:CSSearchableItemActivityIdentifier]];
        
        if (identifierPath != nil) {
            
            NSLog(@"identifierPath = %@", identifierPath);
            
            
            return YES;
        }
        
    }
    
    return NO;
}


- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType
{
    //TODO: I have no idea what this function does but when it return true, I can get rid of this fucking erro message:
    // Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior
    return YES;
}









- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  BaseClassSpotlight.h
//  spotlight
//
//  Created by MyFlashLab on 6/23/16.
//  Copyright © 2016 MyFlashLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseClassSpotlight : NSObject <UIAlertViewDelegate>
{
    BOOL okIsTouch;
}

@property (nonatomic) BOOL okIsTouch;

-(void)isTestVersion;
-(void)test;

-(BOOL)isIndexingAvailable;
-(void)indexItems:(NSString*)itemsJson;
-(void)deleteItemsWithIdentifiers:(NSArray*)identifiers;
-(void)deleteItemsWithDomainIdentifiers:(NSArray*)domainIdentifiers;
-(void)deleteAllItems;

-(void)checkOverride_willContinueUserActivityWithType;
-(void)checkOverride_continueUserActivityRestorationHandler;

@end

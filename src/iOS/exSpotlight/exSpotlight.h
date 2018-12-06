//
//  exSpotlight.h
//  exSpotlight
//
//  Created by MyFlashLab on 6/23/16.
//  Copyright © 2016 MyFlashLab. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANE_NAME @"com.myflashlab.air.extensions.spotlight"

// dispatch events
#define SPOTLIGHT_INDEXING_SUCCESS @"onSpotlightIndexingSuccess"
#define SPOTLIGHT_INDEXING_FAILURE @"onSpotlightIndexingFailure"
#define SPOTLIGHT_DELETING_SUCCESS @"onSpotlightDeletingSuccess"
#define SPOTLIGHT_DELETING_FAILURE @"onSpotlightDeletingFailure"

#define SPOTLIGHT_SEARCH_SELECTED @"onSpotlightSearchSelected"

@interface exSpotlight : NSObject

+ (void) dispatchEventEcode:(NSString *) ecode andElevel:(NSString *) elevel;
//+ (id)sharedAppDelegateInstanceSpotlight;

@end

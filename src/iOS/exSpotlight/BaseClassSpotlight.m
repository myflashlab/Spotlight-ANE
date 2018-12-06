//
//  BaseClassSpotlight.m
//  spotlight
//
//  Created by MyFlashLab on 6/23/16.
//  Copyright © 2016 MyFlashLab. All rights reserved.
//

#import "BaseClassSpotlight.h"
#import "exSpotlight.h"
#import "MyFlashLabsClass.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@implementation BaseClassSpotlight

@synthesize okIsTouch;

- (id) init
{
    self = [super init];
    
    return  self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        self.okIsTouch = YES;
    }
}

- (void) isTestVersion
{
    // If we know at least one ANE is DEMO, we don't need to show demo dialog again. It's already shown once.
    if([[MyFlashLabsClass sharedInstance] hasAnyDemoAne]) return;
    
    // Check if this ANE is registered?
    if([[MyFlashLabsClass sharedInstance] isAneRegistered:ANE_NAME]) return;
    
    // Otherwise, show the demo dialog.
    
    self.okIsTouch = NO;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"DEMO ANE!"
                                                    message:[NSString stringWithFormat:@"The library '%@' is not registered!", ANE_NAME]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)test
{
    
    NSOperatingSystemVersion ios9_0_0 = (NSOperatingSystemVersion){9, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios9_0_0])
    {
        CSSearchableItemAttributeSet* attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*)kUTTypeImage];
        attributeSet.title = @"My first ANE spotlight search";
        attributeSet.contentDescription = @"content description from Adobe Air!";
        attributeSet.keywords = [NSArray arrayWithObjects:@"ANE", @"spotlight", @"AdobeAir", nil];
        
        /*
         
         @property (nullable, copy) NSNumber *supportsPhoneCall;
         @property (nullable, copy) NSNumber *supportsNavigation;

         
        */
        
        CSSearchableItem* item = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"com.myflashlab" domainIdentifier:@"splotlight.sample" attributeSet:attributeSet];
        
        [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[item] completionHandler:^(NSError * _Nullable error)
         {
             if(!error)
             {
                 [exSpotlight dispatchEventEcode:@"index task completionHandler" andElevel:@"ok"];
             }
             else
             {
                 [exSpotlight dispatchEventEcode:@"index task completionHandler" andElevel:error.description];
             }
         }];
    }
}

-(BOOL)isIndexingAvailable
{
    NSOperatingSystemVersion ios9_0_0 = (NSOperatingSystemVersion){9, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios9_0_0])
    {
        return [CSSearchableIndex isIndexingAvailable];
    }
    
    return NO;
}

-(void)indexItems:(NSString*)itemsJson
{
    NSArray<CSSearchableItem*>*items = [self convertJsonToSearchableItems:itemsJson];
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:items completionHandler:^(NSError * _Nullable error)
     {
         if(!error)
         {
             [exSpotlight dispatchEventEcode:SPOTLIGHT_INDEXING_SUCCESS andElevel:@""];
         }
         else
         {
             [exSpotlight dispatchEventEcode:SPOTLIGHT_INDEXING_FAILURE andElevel:error.description];
         }
     }];
}

-(void)deleteItemsWithIdentifiers:(NSArray*)identifiers
{
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:identifiers completionHandler:^(NSError * _Nullable error)
    {
        if(!error)
        {
            [exSpotlight dispatchEventEcode:SPOTLIGHT_DELETING_SUCCESS andElevel:@""];
        }
        else
        {
            [exSpotlight dispatchEventEcode:SPOTLIGHT_DELETING_FAILURE andElevel:error.description];
        }
    }];
}

-(void)deleteItemsWithDomainIdentifiers:(NSArray*)domainIdentifiers
{
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:domainIdentifiers completionHandler:^(NSError * _Nullable error)
    {
        if(!error)
        {
            [exSpotlight dispatchEventEcode:SPOTLIGHT_DELETING_SUCCESS andElevel:@""];
        }
        else
        {
            [exSpotlight dispatchEventEcode:SPOTLIGHT_DELETING_FAILURE andElevel:error.description];
        }
    }];
}

-(void)deleteAllItems
{
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:^(NSError * _Nullable error)
    {
        if(!error)
        {
            [exSpotlight dispatchEventEcode:SPOTLIGHT_DELETING_SUCCESS andElevel:@""];
        }
        else
        {
            [exSpotlight dispatchEventEcode:SPOTLIGHT_DELETING_FAILURE andElevel:error.description];
        }
    }];
}

-(void)checkOverride_willContinueUserActivityWithType
{
    //TODO: I have no idea what this function does but when it return true, I can get rid of this fucking erro message:
    // Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior
}

-(void)checkOverride_continueUserActivityRestorationHandler
{
    NSUserActivity* userActivity = [[MyFlashLabsClass sharedInstance] retriveUserActivity];
    
    NSOperatingSystemVersion ios9_0_0 = (NSOperatingSystemVersion){9, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios9_0_0])
    {
        //check if your activity has type search action(i.e. coming from spotlight search)
        if ([userActivity.activityType isEqualToString:CSSearchableItemActionType ] == YES)
        {
            
            //the identifier you'll use to open specific views and the content in those views.
            NSString * identifierPath = [NSString stringWithFormat:@"%@",[userActivity.userInfo objectForKey:CSSearchableItemActivityIdentifier]];
            
            if (identifierPath != nil)
            {
                [exSpotlight dispatchEventEcode:SPOTLIGHT_SEARCH_SELECTED andElevel:identifierPath];
            }
        }
    }
}


// ------------------------------------------------------------------------- private methods
-(NSArray<CSSearchableItem*>*)convertJsonToSearchableItems:(NSString*)itemsJson
{
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:[itemsJson dataUsingEncoding:NSUTF8StringEncoding]
                                                       options:0
                                                         error:NULL];
    
    
    NSMutableArray* finalArr = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in jsonArr)
    {
        // build the attribute set
        CSSearchableItemAttributeSet* attributeSet = [self generateAttributeSet:dict];
        
        // add the attribute set to a Searchable Item
        CSSearchableItem* item = [[CSSearchableItem alloc] initWithUniqueIdentifier:[dict valueForKey:@"uniqueIdentifier"] domainIdentifier:[dict valueForKey:@"domainIdentifier"] attributeSet:attributeSet];
        
        [finalArr addObject:item];
    }
    
    return finalArr;
}

-(CSSearchableItemAttributeSet*)generateAttributeSet:(NSDictionary*)dict
{
    CSSearchableItemAttributeSet* attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*)[dict valueForKey:@"contentType"]];
    
    NSDictionary* attributes = [dict valueForKey:@"attributes"];
    
    for (id key in attributes)
    {
        if([[attributes valueForKey:key] isKindOfClass:[NSString class]])
        {
            if([key isEqualToString:@"thumbnailURL"]) // general
            {
                attributeSet.thumbnailURL = [[NSURL alloc] initFileURLWithPath:[attributes valueForKey:key]];
            }
            else if([key isEqualToString:@"URL"]) // media
            {
                attributeSet.URL = [NSURL URLWithString:[[attributes valueForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            else
            {
                /*
                 // general
                 displayName
                 title
                 
                 // documents
                 subject
                 theme
                 contentDescription
                 identifier
                 securityMethod
                 creator
                 kind
                 
                 // images
                 colorSpace
                 acquisitionMake
                 acquisitionModel
                 cameraOwner
                 lensModel
                 profileName
                 EXIFVersion
                 EXIFGPSVersion
                 meteringMode
                 exposureProgram
                 exposureTimeString
                 
                 // media
                 comment
                 copyright
                 version
                 role
                 rights
                 ratingDescription
                 information
                 director
                 producer
                 genre
                 originalFormat
                 originalSource
                 
                 // music
                 keySignature
                 timeSignature
                 audioEncodingApplication
                 composer
                 lyricist
                 album
                 artist
                 musicalGenre
                 musicalInstrumentCategory
                 musicalInstrumentName
                 
                 // messaging
                 accountIdentifier
                 textContent
                 
                 // places
                 headline
                 instructions
                 city
                 stateOrProvince
                 country
                 namedLocation
                 GPSStatus
                 GPSMeasureMode
                 GPSMapDatum
                 GPSProcessingMethod
                 GPSAreaInformation
                 
                 
                 */
                [attributeSet setValue:[attributes valueForKey:key] forKey:key];
            }
            
        }
        else if([[attributes valueForKey:key] isKindOfClass:[NSArray class]])
        {
            if([key isEqualToString:@"importantDates"])
            {
                //TODO: conver array of numbers to an Array of NSDate
            }
            else
            {
                /*
                 // general
                 keywords
                 
                 // documents
                 audiences
                 fontNames
                 
                 // images
                 layerNames
                 
                 // media
                 editors
                 participants
                 projects
                 contentSources
                 contactKeywords
                 codecs
                 mediaTypes
                 organizations
                 languages
                 publishers
                 contributors
                 coverage
                 performers
                 
                 // messaging
                 accountHandles
                 mailboxIdentifiers
                 authorNames
                 recipientNames
                 authorEmailAddresses
                 recipientEmailAddresses
                 authorAddresses
                 recipientAddresses
                 phoneNumbers
                 emailAddresses
                 instantMessageAddresses
                 
                 
                 */
                [attributeSet setValue:[attributes valueForKey:key] forKey:key];
            }
            
        }
        else if([[attributes valueForKey:key] isKindOfClass:[NSNumber class]])
        {
            if([key isEqualToString:@"dueDate"] || // Events
               [key isEqualToString:@"completionDate"] || // Events
               [key isEqualToString:@"startDate"] || // Events
               [key isEqualToString:@"endDate"] || // Events
               [key isEqualToString:@"downloadedDate"] || // media
               [key isEqualToString:@"contentCreationDate"] || // media
               [key isEqualToString:@"contentModificationDate"] || // media
               [key isEqualToString:@"addedDate"] || // media
               [key isEqualToString:@"lastUsedDate"] || // media
               [key isEqualToString:@"recordingDate"] || // music
               [key isEqualToString:@"GPSDateStamp"] || // places
               [key isEqualToString:@"timestamp"]) // places
            {
                [attributeSet setValue:[[NSDate alloc] initWithTimeIntervalSince1970:[[attributes valueForKey:key] doubleValue]] forKey:key];
            }
            else
            {
                /*
                 // documents
                 fileSize
                 pageCount
                 pageWidth
                 pageHeight
                 
                 // events
                 allDay
                 
                 // images
                 pixelHeight
                 pixelWidth
                 pixelCount
                 bitsPerSample
                 flashOn
                 focalLength
                 focalLength35mm
                 ISOSpeed
                 orientation
                 whiteBalance
                 aperture
                 resolutionWidthDPI
                 resolutionHeightDPI
                 exposureMode
                 exposureTime
                 hasAlphaChannel
                 redEyeOn
                 maxAperture
                 fNumber
                 
                 // media
                 duration
                 streamable
                 totalBitRate
                 videoBitRate
                 audioBitRate
                 deliveryType
                 rating
                 playCount
                 local
                 contentRating
                 
                 // music
                 audioSampleRate
                 audioChannelCount
                 tempo
                 audioTrackNumber
                 generalMIDISequence
                 
                 // messaging
                 likelyJunk
                 
                 // places
                 altitude
                 latitude
                 longitude
                 speed
                 imageDirection
                 GPSTrack
                 GPSDOP
                 GPSDestLatitude
                 GPSDestLongitude
                 GPSDestBearing
                 GPSDestDistance
                 GPSDifferental
                 
                 */
                [attributeSet setValue:[attributes valueForKey:key] forKey:key];
            }
            
        }
    }
    
    return attributeSet;
}



@end

//
//  ViewController.m
//  spotlight
//
//  Created by MyFlashLab on 6/23/16.
//  Copyright © 2016 MyFlashLab. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    NSString* itemsJson=@"[{\"contentType\":\"kUTTypeItem\",\"attributes\":{\"displayName\":\"NSString\",\"num\":2.34,\"keywords\":[\"NSString1\",\"NSString2\",\"NSString3\"]}}]";
    
    
    //NSString* itemsJson=@"{\"uniqueIdentifier\":\"com.site.uniquIdentifier\",\"contentType\":\"kUTTypeItem\",\"attributes\":{\"title\":\"title 1\",\"contentDescription\":\"content description 1\",\"keywords\":[\"Adobe Air\",\"ANE\",\"MyFLashLabs\"]},\"domainIdentifier\":\"domain.identifier\"}";
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:[itemsJson dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0
                                                            error:NULL];
    NSLog(@"jsonObject=%@", jsonArr);
    
    for (NSDictionary *dict in jsonArr)
    {
        NSLog(@"contentType = %@",[dict valueForKey:@"contentType"]);
        
        
        NSDictionary* attr = [dict valueForKey:@"attributes"];
        
        
        NSLog(@"-----------------");
        
        for (id key in attr)
        {
            //NSLog(@"key = %@", key);
            
            if([key isEqualToString:@"keywords"])
            {
                NSArray* keywords = [attr valueForKey:key];
                for (NSString *keyword in keywords)
                {
                    //NSLog(@">> %@", keyword);
                }

            }
            
            if([[attr valueForKey:key] isKindOfClass:[NSString class]])
            {
                NSLog(@"key = %@ and it is NSString", key);
            }
            else if([[attr valueForKey:key] isKindOfClass:[NSArray class]])
            {
                NSLog(@"key = %@ and it is NSArray", key);
            }
            else if([[attr valueForKey:key] isKindOfClass:[NSNumber class]])
            {
                NSLog(@"key = %@ and it is NSNumber", key);
            }
        }
    }
    
    
    /*
    CSSearchableItemAttributeSet* attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*)kUTTypeImage];
    attributeSet.title = @"My first spotlight search";
    attributeSet.contentDescription = @"content description";
    attributeSet.keywords = [NSArray arrayWithObjects:@"ANE", @"spotlight", nil];
    
    UIImage* image = [UIImage imageNamed:@"img"];
    NSData* imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    //attributeSet.thumbnailData = imageData;
    
    CSSearchableItem* item = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"com.myflashlab" domainIdentifier:@"splotlight.sample" attributeSet:attributeSet];
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[item] completionHandler:^(NSError * _Nullable error)
    {
        if(!error)
        {
            NSLog(@"search item indexes");
        }
    }];
    */
    
    
}

@end

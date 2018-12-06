//
//  exSpotlight.m
//  exSpotlight
//
//  Created by MyFlashLab on 6/23/16.
//  Copyright © 2016 MyFlashLab. All rights reserved.
//

#import "exSpotlight.h"
#import "MyFlashLabsClass.h"
#import "FlashRuntimeExtensions.h"
#import "BaseClassSpotlight.h"
@import ObjectiveC;

#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface exSpotlight ()

typedef enum
{
    isTestVersion,
    test,
    
    isIndexingAvailable,
    indexItems,
    deleteItemsWithIdentifiers,
    deleteItemsWithDomainIdentifiers,
    deleteAllItems,
    
    checkOverride_continueUserActivityRestorationHandler,
    checkOverride_willContinueUserActivityWithType,
    
    defaultEnum
} commandType;

@end

@implementation exSpotlight

FREContext freContextSpotlight;
static BaseClassSpotlight *base = nil;

commandType getEnumTitleSpotlight(NSString *theType)
{
#define CHECK_ENUM(X)   if([theType isEqualToString:@#X]) return X
    
    CHECK_ENUM(isTestVersion);
    CHECK_ENUM(test);
    
    CHECK_ENUM(isIndexingAvailable);
    CHECK_ENUM(indexItems);
    CHECK_ENUM(deleteItemsWithIdentifiers);
    CHECK_ENUM(deleteItemsWithDomainIdentifiers);
    CHECK_ENUM(deleteAllItems);
    
    CHECK_ENUM(checkOverride_continueUserActivityRestorationHandler);
    CHECK_ENUM(checkOverride_willContinueUserActivityWithType);
    
    return defaultEnum;
    
#undef CHECK_ENUM
}

/*
+ (id)sharedAppDelegateInstanceSpotlight
{
    return base;
}
 */

+ (void) dispatchEventEcode:(NSString *) ecode andElevel:(NSString *) elevel
{
    if (freContextSpotlight == NULL)
    {
        return;
    }
    
    const uint8_t* enentLevel = (const uint8_t*) [elevel UTF8String];
    const uint8_t* eventCode = (const uint8_t*) [ecode UTF8String];
    FREDispatchStatusEventAsync(freContextSpotlight, eventCode, enentLevel);
}

// -------------------------------------------------------------------------
FREObject commandSpotlight(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    FREObject retFREObject = nil;
    
    NSString *command = [MyFlashLabsClass AirToIos_String:argv[0]];
    commandType temp = getEnumTitleSpotlight(command);
    
    // save the active context from flash
    freContextSpotlight = ctx;
    
    switch (temp)
    {
        case isTestVersion:
            
            [base isTestVersion];
            
            break;
        case test:
            
            [base test];
            
            break;
        case isIndexingAvailable:
            
            retFREObject = [MyFlashLabsClass IosToAir_Boolean:[base isIndexingAvailable]];
            
            break;
        case indexItems:
            
            [base indexItems:[MyFlashLabsClass AirToIos_String:argv[1]]];
            
            break;
        case deleteItemsWithIdentifiers:
            
            [base deleteItemsWithIdentifiers:[MyFlashLabsClass AirToIos_Array:argv[1]]];
            
            break;
        case deleteItemsWithDomainIdentifiers:
            
            [base deleteItemsWithDomainIdentifiers:[MyFlashLabsClass AirToIos_Array:argv[1]]];
            
            break;
        case deleteAllItems:
            
            [base deleteAllItems];
            
            break;
        case checkOverride_willContinueUserActivityWithType:
            
            [base checkOverride_willContinueUserActivityWithType];
            
            break;
        case checkOverride_continueUserActivityRestorationHandler:
            
            [base checkOverride_continueUserActivityRestorationHandler];
            
            break;
        default:
            
            retFREObject = [MyFlashLabsClass IosToAir_String:[[MyFlashLabsClass sharedInstance] retriveCommandNotFound]];
            break;
    }
    
    // Return data back to flash
    return retFREObject;
}

void contextInitializerSpotlight(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    // make sure the base class is initialized
    if (!base) base = [[BaseClassSpotlight alloc] init];
    
    /*
    // ------------------------------------------------------------------------------------- inject required methods
    
    id delegate = [[UIApplication sharedApplication] delegate];
    Class objectClass = object_getClass(delegate);
    NSString *newClassName = [NSString stringWithFormat:@"Custom_%@", NSStringFromClass(objectClass)];
    Class modDelegate = NSClassFromString(newClassName);
    
    if (modDelegate == nil)
    {
        modDelegate = objc_allocateClassPair(objectClass, [newClassName UTF8String], 0);
        
        SEL selectorToOverride1 = @selector(application:continueUserActivity:restorationHandler:);
        SEL selectorToOverride2 = @selector(application:willContinueUserActivityWithType:);
        
        // get the info on the method we're going to override
        Method m1 = class_getInstanceMethod(objectClass, selectorToOverride1);
        Method m2 = class_getInstanceMethod(objectClass, selectorToOverride2);
        
        // add the method to the new class
        class_addMethod(modDelegate, selectorToOverride1, (IMP)onContinueUserActivity, method_getTypeEncoding(m1));
        class_addMethod(modDelegate, selectorToOverride2, (IMP)onWillContinueUserActivityWithType, method_getTypeEncoding(m2));
        
        // register the new class with the runtime
        objc_registerClassPair(modDelegate);
    }
    
    // change the class of the object
    object_setClass(delegate, modDelegate);
    
    
    // -------------------------------------------------------------------------------------
     */
    
    *numFunctionsToTest = 1;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    func[0].name = (const uint8_t*) "command";
    func[0].functionData = NULL;
    func[0].function = &commandSpotlight;
    
    *functionsToSet = func;
}

void contextFinalizerSpotlight(FREContext ctx)
{
    return;
}

void comMyflashlabSpotlightExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &contextInitializerSpotlight;
    *ctxFinalizerToSet = &contextFinalizerSpotlight;
}

void comMyflashlabSpotlightExtensionFinalizer(void* extData)
{
    return;
}


/*
// -------------------------------------------------------------------------------- overriding original ObjC funcs
BOOL onContinueUserActivity(id self, SEL _cmd, UIApplication *application, NSUserActivity *userActivity, id restorationHandler)
{
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
                
                return YES;
            }
        }
    }
    
    return NO;
}

BOOL onWillContinueUserActivityWithType(id self, SEL _cmd, UIApplication *application, NSString *userActivityType)
{
    //TODO: I have no idea what this function does but when it return true, I can get rid of this fucking erro message:
    // Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior
    return YES;
}
*/


@end

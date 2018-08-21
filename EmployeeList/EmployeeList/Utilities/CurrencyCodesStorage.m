//
//  CurrencyCodesStorage.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 21/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "CurrencyCodesStorage.h"

@interface CurrencyCodesStorage ()

@property NSDictionary<NSString*, NSLocale*> *map;

@end

@implementation CurrencyCodesStorage

+ (CurrencyCodesStorage *)sharedInstance {
    static CurrencyCodesStorage *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        for (NSString* localeIdentifier in NSLocale.availableLocaleIdentifiers){
            NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
            if (locale.currencyCode) {
                [dict setObject:locale forKey:locale.currencyCode];
            }
        }
        
        sharedInstance = [[CurrencyCodesStorage alloc] init];
        sharedInstance.map = dict;
    });
    
    return sharedInstance;
}

- (NSLocale*)findLocalWithCurrencyCode:(NSString*)code {
    return [self.map valueForKey:code];
}

@end

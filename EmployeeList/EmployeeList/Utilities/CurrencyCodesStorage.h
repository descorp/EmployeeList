//
//  CurrencyCodesStorage.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 21/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyCodesStorage : NSObject

+ (CurrencyCodesStorage *)sharedInstance;

- (NSLocale*)findLocalWithCurrencyCode:(NSString*)code;

@end

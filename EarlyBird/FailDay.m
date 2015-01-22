//
//  FailDay.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "FailDay.h"


@implementation FailDay

@dynamic amountLost;

- (NSString *)amountLostString
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    return [formatter stringFromNumber:self.amountLost];
}

- (instancetype)initAndInsertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *description = [NSEntityDescription entityForName:@"FailDay" inManagedObjectContext:context];
    
    return [self initWithEntity:description insertIntoManagedObjectContext:context];
}

@end

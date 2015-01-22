//
//  Timeline.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "Timeline.h"
#import "Day.h"


@implementation Timeline

@dynamic currentBet;
@dynamic days;

- (NSString *)currentBetString
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    return [formatter stringFromNumber:self.currentBet];
}

+ (instancetype)timelineWithManagedObjectContext:(NSManagedObjectContext *)context
{
    NSParameterAssert(context);
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Timeline"];
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (results == nil) {
        NSLog(@"Failed to get timeline. Error: %@", error);
    }
    if ([results count] > 1) {
        NSLog(@"Too many timelines in store");
    }
    if ([results count] == 1) {
        return results[1];
    } else {
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Timeline" inManagedObjectContext:context];
        return [[self alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
    }

}

@end

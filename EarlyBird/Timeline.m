//
//  Timeline.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "Timeline.h"
#import "SuccessDay.h"
#import "FailDay.h"
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
        return results[0];
    } else {
        __block Timeline *timeline;
        [context performBlockAndWait:^{
            NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Timeline" inManagedObjectContext:context];
            timeline = [[self alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
            SuccessDay *successDay;
            FailDay *failDay;
            successDay = [[SuccessDay alloc] initAndInsertIntoManagedObjectContext:context];
            [timeline insertObject:successDay inDaysAtIndex:0];
            failDay = [[FailDay alloc] initAndInsertIntoManagedObjectContext:context];
            failDay.amountLost = [NSNumber numberWithDouble:2.30];
            [timeline insertObject:failDay inDaysAtIndex:0];
            successDay = [[SuccessDay alloc] initAndInsertIntoManagedObjectContext:context];
            [timeline insertObject:successDay inDaysAtIndex:0];
            
            NSError *error;
            if ([context save:&error]) {
                NSLog(@"Couldn't save the timeline. Error: %@", error);
                timeline = nil;
            }
        }];
        return timeline;
    }

}

- (void)insertObject:(Day *)value inDaysAtIndex:(NSUInteger)idx
{
    NSMutableOrderedSet *set = [self.days mutableCopy];
    [set insertObject:value atIndex:idx];
    self.days = set;
}

@end

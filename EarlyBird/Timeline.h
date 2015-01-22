//
//  Timeline.h
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Day;

@interface Timeline : NSManagedObject

@property (nonatomic, retain) NSNumber * currentBet;
@property (nonatomic, retain) NSOrderedSet *days;
@end

@interface Timeline (CoreDataGeneratedAccessors)

- (void)insertObject:(Day *)value inDaysAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDaysAtIndex:(NSUInteger)idx;
- (void)insertDays:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDaysAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDaysAtIndex:(NSUInteger)idx withObject:(Day *)value;
- (void)replaceDaysAtIndexes:(NSIndexSet *)indexes withDays:(NSArray *)values;
- (void)addDaysObject:(Day *)value;
- (void)removeDaysObject:(Day *)value;
- (void)addDays:(NSOrderedSet *)values;
- (void)removeDays:(NSOrderedSet *)values;
@end

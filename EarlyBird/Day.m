//
//  Day.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "Day.h"
#import "Timeline.h"


@implementation Day

@dynamic timeline;

- (instancetype)initAndInsertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    NSAssert(NO, @"Virtual class, shouldn't init.");
    return nil;
}

@end

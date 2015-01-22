//
//  SuccessDay.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "SuccessDay.h"


@implementation SuccessDay

@dynamic photoData;
@synthesize photo;

- (instancetype)initAndInsertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *description = [NSEntityDescription entityForName:@"SuccessDay" inManagedObjectContext:context];
    
    return [self initWithEntity:description insertIntoManagedObjectContext:context];
}

@end

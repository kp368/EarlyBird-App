//
//  TimelineModel.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 20/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "TimelineModel.h"
#import "SuccessDay.h"
#import "FailDay.h"

@implementation TimelineModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentBetString = @"£3.00";
        _days = @[[[SuccessDay alloc] init], [[FailDay alloc] init]];
    }
    return self;
}

@end

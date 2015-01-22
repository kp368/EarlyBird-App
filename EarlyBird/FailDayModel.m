//
//  FailDayModel.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 20/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "FailDayModel.h"

@implementation FailDayModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _amountLostString = @"-£2.00";
    }
    return self;
}

@end

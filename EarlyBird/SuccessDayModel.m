//
//  SuccessDayModel.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 20/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "SuccessDayModel.h"

@implementation SuccessDayModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photo = [UIImage imageNamed:@"second"];
    }
    return self;
}

@end

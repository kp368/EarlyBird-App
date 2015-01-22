//
//  TimelineModel.h
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 20/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimelineModel : NSObject

@property (readonly, nonatomic, strong) NSString *currentBetString;

@property (readonly, nonatomic, strong) NSArray *days;

@end

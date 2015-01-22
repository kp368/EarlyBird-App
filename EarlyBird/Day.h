//
//  Day.h
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Timeline;

@interface Day : NSManagedObject

@property (nonatomic, retain) Timeline *timeline;

@end

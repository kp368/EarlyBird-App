//
//  SuccessDay.h
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 21/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Day.h"


@interface SuccessDay : Day

@property (readonly, nonatomic, retain) UIImage *photo;
@property (nonatomic, retain) NSData * photoData;

@end

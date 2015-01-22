//
//  TimelineController.m
//  EarlyBird
//
//  Created by Samuel Pattuzzi on 20/01/2015.
//  Copyright (c) 2015 Samuel Pattuzzi. All rights reserved.
//

#import "AppDelegate.h"
#import "TimelineController.h"
#import "ImageCell.h"
#import "CurrentBetTableViewCell.h"
#import "FailedTableViewCell.h"
#import "Timeline.h"
#import "SuccessDay.h"
#import "FailDay.h"

@interface TimelineController ()

@property (readonly, strong, nonatomic) Timeline *model;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation TimelineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self->_managedObjectContext = appDelegate.managedObjectContext;
;
    self->_model = [Timeline timelineWithManagedObjectContext:self->_managedObjectContext];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    __block NSInteger result;
    [self.model.managedObjectContext performBlockAndWait:^{
        result = [self.model.days count] + 1;
    }];
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"ImageCell";
    
    NSInteger index = [indexPath indexAtPosition:1];
    UITableViewCell *resultCell;
    if (index == 0) {
        // First row
        identifier = @"CurrentBetCell";
        CurrentBetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        cell.currentBet.text = self.model.currentBetString;
        resultCell = cell;
        
    } else {
        // Day's are stored in chronological order but displayed in reverse.
        NSInteger currentDayIndex = [self.model.days count] - index;
        NSObject *currentDay = self.model.days[currentDayIndex];
        
        if ([currentDay isKindOfClass:[SuccessDay class]]) {
            identifier = @"ImageCell";
            ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            cell.currentDay.text = [NSString stringWithFormat:@"%ld", (long)currentDayIndex + 1];
            resultCell = cell;

        } else {
            FailDay *successDay = (FailDay *)currentDay;
            identifier = @"FailedCell";
            FailedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            cell.amountLost.text = successDay.amountLostString;
            
            resultCell = cell;

        }
    }
    
    return resultCell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

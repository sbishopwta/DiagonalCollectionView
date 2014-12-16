//
//  REDTableViewController.m
//  REDDiagonalTableViewController
//
//  Created by Steven Bishop on 12/6/14.
//  Copyright (c) 2014 WillowTree Apps. All rights reserved.
//

#import "REDTableHeaderView.h"
#import "REDTableViewCell.h"
#import "REDTableViewController.h"

@interface REDTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) REDTableViewCell *sizeCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIButton *circleButton;
@property (weak, nonatomic) IBOutlet UIView *contentContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomTableViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingTableViewConstraint;
@property (nonatomic, readwrite) CGFloat viewRotation;
@end

@implementation REDTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewRotation = 52 * M_PI/180.0; // Converts 52 degrees to radians
    self.circleButton.hidden = NO;
    [self cellSetUp];
    [self determineBottomAndTrailingTableViewConstraint];
    [self transformViews];
}

#pragma mark - Utilities

- (void)cellSetUp
{
    self.sizeCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([REDTableViewCell class])
                                                   owner:self
                                                 options:nil] objectAtIndex:0];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([REDTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass([REDTableViewCell class])];
}

- (void)transformViews
{
    self.contentContainerView.transform = CGAffineTransformMakeRotation(self.viewRotation);
    self.tableView.clipsToBounds = NO;
//    self.tableView.layer.borderColor = [[UIColor greenColor] CGColor];
//    self.tableView.layer.borderWidth = 2.0f;
//    self.headerView.transform = CGAffineTransformMakeRotation(self.viewRotation);
    
}

- (NSArray *)arrayOfImages;
{
    NSArray *images = @[
                        @"Foodie",
                        @"Explorer",
                        @"GasGuzzler",
                        @"Gatherer",
                        @"Superstar",
                        @"Shopaholic",
                        @"Foodie",
                        @"Explorer",
                        @"GasGuzzler",
                        @"Gatherer",
                        @"Superstar",
                        @"Shopaholic",
                        ];
    return images;
}

- (void)determineBottomAndTrailingTableViewConstraint
{
    CGFloat deviceWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat deviceHeight = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    CGFloat tableViewHeight = CGRectGetHeight(self.tableView.frame);
    NSLog(@"\nDevice Width: %f \nDevice Height:%f \nTableview Height:%f", deviceWidth, deviceHeight, tableViewHeight);
    self.bottomTableViewConstraint.constant = deviceHeight/3;
    self.trailingTableViewConstraint.constant = deviceHeight/2 - deviceHeight/3;
    NSLog(@"\nTableview Height: %f \nBottom Constant: %f \nTrailing Constant: %f", tableViewHeight, self.bottomTableViewConstraint.constant, self.trailingTableViewConstraint.constant);
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    REDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([REDTableViewCell class])];
    cell.contentRotation = -self.viewRotation;
    [cell configureCellAtIndexPath:indexPath withArrayOfImages:[self arrayOfImages]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heightToReturn = CGRectGetHeight(self.sizeCell.frame);
    if (indexPath.row == [[self arrayOfImages] count] -1)
    {
        heightToReturn = CGRectGetHeight(self.sizeCell.frame) + 50;
    }
    return heightToReturn;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self arrayOfImages] count];
}

@end

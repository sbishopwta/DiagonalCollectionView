//
//  REDTableViewCell.m
//  REDDiagonalTableViewController
//
//  Created by Steven Bishop on 12/6/14.
//  Copyright (c) 2014 WillowTree Apps. All rights reserved.
//

#import "REDTableViewCell.h"

@interface REDTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *buttonImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end

@implementation REDTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
//    [[[self lineView] layer] setAllowsEdgeAntialiasing:YES];
}

- (void)configureCellAtIndexPath:(NSIndexPath *)indexPath withArrayOfImages:(NSArray *)images
{
    NSString *imageNamed = images[indexPath.row];
    UIImage *image = [UIImage imageNamed:imageNamed];
    [self.buttonImage setImage:image forState:UIControlStateNormal];
//    self.buttonImage.transform = CGAffineTransformMakeRotation(self.contentRotation);
    self.titleLabel.text = imageNamed;
//    self.titleLabel.transform = CGAffineTransformMakeRotation(self.contentRotation); //so magic
//    self.lineView.transform = CGAffineTransformMakeRotation(self.contentRotation);
    self.containerView.transform = CGAffineTransformMakeRotation(self.contentRotation);
}



@end

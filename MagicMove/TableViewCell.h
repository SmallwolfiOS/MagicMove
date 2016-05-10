//
//  TableViewCell.h
//  MaigicMove
//
//  Created by Jason on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UIImageView *subImageView;


- (void)loadSubView;

@end

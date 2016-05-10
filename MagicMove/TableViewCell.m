//
//  TableViewCell.m
//  MaigicMove
//
//  Created by Jason on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadSubView{
    _subLabel.text = [NSString stringWithFormat:@"coding 第 %ld 行",(long)self.tag];
    if (self.tag % 2 == 1 ) {
        _subImageView.image = nil;
    }
}
@end

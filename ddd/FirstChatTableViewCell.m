//
//  FirstChatTableViewCell.m
//  ddd
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstChatTableViewCell.h"
#define CELL @"cell"
#define DECRIPTION_ORIGINAL_HEIGHT 50

@implementation FirstChatTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)creatWithDictionary:(NSMutableDictionary *)dic inTableView:(UITableView *)tableView
{
    static NSString * identifier = CELL;
    FirstChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:kNilOptions].firstObject;
    }
    cell.avatar.image = [UIImage imageNamed:[dic objectForKey:AVATAR]];
    cell.name.text = [dic objectForKey:NAME];
    cell.occupation.text = [dic objectForKey:OCCUPATION];
    cell.decriptionLabel.text = [dic objectForKey:DECRIPTION];
    cell.originalHeightConstraint = DECRIPTION_ORIGINAL_HEIGHT;
    __weak typeof(tableView) weakTable = tableView;
    cell.flashTable = ^{
        [weakTable reloadData];
    /** 
     以下两种刷新的方法，都不是太有效（点击奇数次，方法走了但不奏效，点击偶数次，奏效）。只能用reloadData才能达到效果。不造为什么。
//        //刷新指定的row
//        NSArray * indexArray = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil];
//        [weakTable reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationNone];
//        //刷新对应的区
//        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:0];
//        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    */
     };
    
    //扩展button 是否出现
    CGRect descriptionRect = [[dic objectForKey:DECRIPTION] boundingRectWithSize:CGSizeMake(cell.decriptionLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : cell.decriptionLabel.font} context:nil];
    if (descriptionRect.size.height > cell.originalHeightConstraint){
        cell.expandBtn.hidden = NO;
    }else{
        cell.expandBtn.hidden = YES;
    }
    
    return cell;
}


- (IBAction)expandBtnClick:(UIButton *)sender {
    //改变decription的height约束值，来实现展开和折叠
    if (self.decriptionLabelHeightConstraint.constant == self.originalHeightConstraint){
        //展开
        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        
        CGRect descriptionRect = [self.decriptionLabel.text boundingRectWithSize:CGSizeMake(self.decriptionLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.decriptionLabel.font} context:nil];
        self.decriptionLabelHeightConstraint.constant = descriptionRect.size.height;
    }else{
        //折叠
        sender.imageView.transform = CGAffineTransformIdentity;
        self.decriptionLabelHeightConstraint.constant = self.originalHeightConstraint;
    }
    self.decriptionLabelHeightConstraint.priority = UILayoutPriorityDefaultHigh + 1;
    self.flashTable();
}

@end

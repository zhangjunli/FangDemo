//
//  FirstTableViewCell.m
//  ddd
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstTableViewCell.h"
#define CELL                 @"first_cell"
#define CONTENT_LEFT_MARGIN  15
#define CONTENT_RIGHT_MARGIN CONTENT_LEFT_MARGIN

/**
 
 用xib设置的label控件，将numberOfLine = 0后，直接赋值即可显示，折行效果。而不需要code计算高度，再从新赋值给label控件。但此时的label的frame取得的是xib中的大小，而不是填充文字后的frame大小。故不可获得label的frame做事情。
 */


@implementation FirstTableViewCell

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
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:kNilOptions].lastObject;
    }
    cell.dataDic = dic;//引用tableview的数据源，此处是浅拷贝
    cell.avatar.image = [UIImage imageNamed:[dic objectForKey:AVATAR]];
    cell.name.text = [dic objectForKey:NAME];
    cell.describe.text = [dic objectForKey:DESCRIBE];
    cell.image.image = [UIImage imageNamed:[dic objectForKey:IMAGE]];
    cell.content.text = [dic objectForKey:CONTENT];
    cell.classify.text = [dic objectForKey:CLASSIFY];
    cell.attent.text = [dic objectForKey:ATTENT];
    cell.ask.text = [dic objectForKey:ASK];
    cell.isConcern = [[dic objectForKey:IS_CONCERNED] boolValue];
    [cell.careBtn setImage:[UIImage imageNamed:cell.isConcern ? @"concerned" : @"concern"] forState:UIControlStateNormal];

    return cell;
}

/*
//修改label的width
- (void)changeLabelWidth:(UILabel *)label
{
    CGSize textSize = [label.text sizeWithAttributes:@{NSFontAttributeName : label.font}];
    CGRect tempRect = label.frame;
    tempRect.size.width = textSize.width;
    label.frame = tempRect;
}

//修改label的height
- (void)changeLabelHeight:(UILabel *)label
{
    CGRect textRect = [label.text boundingRectWithSize:CGSizeMake(self.bounds.size.width - CONTENT_LEFT_MARGIN*2, MAXFLOAT) options:NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil];
    CGRect tempRect = label.frame;
    tempRect.size.height = textRect.size.height;
    label.frame = tempRect;
}
 */

- (IBAction)careBtnClick:(UIButton *)sender {
    
    self.isConcern = !self.isConcern;
    [self.dataDic setObject:@(self.isConcern) forKey:IS_CONCERNED];
    [sender setImage:[UIImage imageNamed:self.isConcern ? @"concerned" : @"concern"] forState:UIControlStateNormal];
}
@end

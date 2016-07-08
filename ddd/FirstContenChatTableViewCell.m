//
//  FirstContenChatTableViewCell.m
//  ddd
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstContenChatTableViewCell.h"
#import "FirstChatTableViewCell.h"
#define Content_CHAT   @"content_chat"
#define ANWSER_DESCRIPTION_HEIGHT_CONSTRAINT   50
#define TIME_LABEL_TOP_CONSTRAINT_MAX          38
#define TIME_LABEL_TOP_CONSTRAINT_MIN          20
#define ANWSER_DESCRIPTION_LEFT_MARGIN         45
#define ANWSER_DESCRIPTION_RIGHT_MARGIN        20

@implementation FirstContenChatTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)creatWithDictionary:(NSMutableDictionary *)dic inTableView:(UITableView *)tableView
{
    static NSString * identifier = Content_CHAT;
    FirstContenChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"FirstChatTableViewCell" owner:nil options:kNilOptions].lastObject;
    }
    cell.dataDic = dic;//浅拷贝
    cell.askAvatar.image = [UIImage imageNamed:[dic objectForKey:ASK_AVATAR]];
    cell.askName.text = [dic objectForKey:ASK_NAME];
    cell.askDescription.text = [dic objectForKey:ASK_DESCRIPTION];
    cell.anwserAvatar.image = [UIImage imageNamed:[dic objectForKey:ANWSER_AVATAR]];
    cell.anwserName.text = [dic objectForKey:ANWSER_NAME];
    cell.anwserDescription.text = [dic objectForKey:ANWSER_DESCRIPTION];
    cell.timeLabel.text = [dic objectForKey:ANWSER_TIME];
    cell.praiseNumber.text = [dic objectForKey:PRAISE_LABEL];
    cell.commentNumber.text = [dic objectForKey:COMMENT_NUMBER];
    cell.isExpand = [[dic objectForKey:IS_EXPAND] boolValue];

    __weak typeof(tableView) weakTable = tableView;
    if (!cell.flashTable) {
        cell.flashTable = ^{
            [weakTable reloadData];
        };
    }
    
    //设置expandBtn 隐藏还是显示
    //改变约束值
    CGRect anwserDescriptionRect = [cell.anwserDescription.text boundingRectWithSize:CGSizeMake((cell.frame.size.width - ANWSER_DESCRIPTION_LEFT_MARGIN - ANWSER_DESCRIPTION_RIGHT_MARGIN), MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName : cell.anwserDescription.font} context:nil];
    
    if (anwserDescriptionRect.size.height > ANWSER_DESCRIPTION_HEIGHT_CONSTRAINT) {
        //显示
        cell.expandBtn.hidden = NO;
        cell.timeLabelTopConstraint.constant = TIME_LABEL_TOP_CONSTRAINT_MAX;
        
        if (!cell.isExpand) {
            cell.anwserDescriptionHeightConstraint.constant = ANWSER_DESCRIPTION_HEIGHT_CONSTRAINT;
            cell.expandBtn.imageView.transform = CGAffineTransformIdentity;
        }else{
            //加上>=0.1，才可以显示完整。否则显示不完整。
            cell.anwserDescriptionHeightConstraint.constant = anwserDescriptionRect.size.height + 0.1;
            cell.expandBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }
    }else{
        //隐藏
        cell.expandBtn.hidden = YES;
        cell.timeLabelTopConstraint.constant = TIME_LABEL_TOP_CONSTRAINT_MIN;
        cell.anwserDescriptionHeightConstraint.constant = anwserDescriptionRect.size.height;
    }
    
    cell.timeLabelTopConstraint.priority = UILayoutPriorityDefaultHigh + 1;
    cell.anwserDescriptionHeightConstraint.priority = UILayoutPriorityDefaultHigh + 1;
    
    return cell;
}

- (IBAction)shareBtnClick:(id)sender {
}

- (IBAction)praiseBtnClick:(UIButton *)sender {
}

- (IBAction)commentBtnClick:(UIButton *)sender {
}

- (IBAction)expandBtnClick:(UIButton *)sender {
    
    self.isExpand = !self.isExpand;
    //及时更新数据源的值
    [self.dataDic setObject:@(self.isExpand) forKey:IS_EXPAND];
    self.flashTable();
}

@end

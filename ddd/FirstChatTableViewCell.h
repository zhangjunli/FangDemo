//
//  FirstChatTableViewCell.h
//  ddd
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AVATAR               @"avatar"
#define NAME                 @"name"
#define OCCUPATION           @"occupation"
#define DECRIPTION           @"description"


@interface FirstChatTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *occupation;
@property (weak, nonatomic) IBOutlet UILabel *decriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *expandBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *decriptionLabelHeightConstraint;
@property (assign, nonatomic) CGFloat originalHeightConstraint;
@property (copy, nonatomic) void(^flashTable)(void);

- (IBAction)expandBtnClick:(UIButton *)sender;

+ (instancetype)creatWithDictionary:(NSMutableDictionary *)dic inTableView:(UITableView *)tableView;

@end

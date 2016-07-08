//
//  FirstContenChatTableViewCell.h
//  ddd
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ASK_AVATAR          @"askAvatar"
#define ASK_NAME            @"askName"
#define ASK_DESCRIPTION     @"askDescription"
#define ANWSER_AVATAR       @"anwserAvatar"
#define ANWSER_NAME         @"anwserName"
#define ANWSER_DESCRIPTION  @"anwserDescription"
#define ANWSER_TIME         @"anwserTime"
#define PRAISE_LABEL        @"praiseLable"
#define COMMENT_NUMBER      @"commentNumber"
#define IS_EXPAND           @"isExpand"


@interface FirstContenChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *askAvatar;
@property (weak, nonatomic) IBOutlet UILabel *askName;
@property (weak, nonatomic) IBOutlet UILabel *askDescription;
@property (weak, nonatomic) IBOutlet UIImageView *anwserAvatar;
@property (weak, nonatomic) IBOutlet UILabel *anwserName;
@property (weak, nonatomic) IBOutlet UILabel *anwserDescription;
@property (weak, nonatomic) IBOutlet UIButton *expandBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UILabel *praiseNumber;
@property (weak, nonatomic) IBOutlet UILabel *commentNumber;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *praiseBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *anwserDescriptionHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timeLabelTopConstraint;
@property (copy, nonatomic) void(^flashTable)(void);
@property (assign, nonatomic) BOOL isExpand;
@property (strong, nonatomic) NSMutableDictionary * dataDic;

- (IBAction)expandBtnClick:(UIButton *)sender;

- (IBAction)commentBtnClick:(UIButton *)sender;

- (IBAction)praiseBtnClick:(UIButton *)sender;

- (IBAction)shareBtnClick:(UIButton *)sender;

+ (instancetype)creatWithDictionary:(NSMutableDictionary *)dic inTableView:(UITableView *)tableView;
@end

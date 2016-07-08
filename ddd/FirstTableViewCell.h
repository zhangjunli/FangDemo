//
//  FirstTableViewCell.h
//  ddd
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AVATAR               @"avatar"
#define NAME                 @"name"
#define DESCRIBE             @"describe"
#define IMAGE                @"image"
#define CONTENT              @"content"
#define CLASSIFY             @"classify"
#define ATTENT               @"attent"
#define ASK                  @"ask"
#define IS_CONCERNED         @"isConcerned"

@interface FirstTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *describe;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *classify;
@property (weak, nonatomic) IBOutlet UILabel *attent;
@property (weak, nonatomic) IBOutlet UILabel *ask;
@property (weak, nonatomic) IBOutlet UIButton *careBtn;
@property (assign, nonatomic) BOOL isConcern;
@property (strong, nonatomic) NSMutableDictionary * dataDic;//引用table的数据源

- (IBAction)careBtnClick:(UIButton *)sender;
+ (instancetype)creatWithDictionary :(NSMutableDictionary *)dic inTableView :(UITableView *)tableView;

@end

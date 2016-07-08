//
//  ChatContentTableViewHeaderFootView.h
//  ddd
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ASK    @"ask"
#define ANWSER @"anwser"
#define STATE  @"state"

@interface ChatContentTableViewHeaderFootView : UITableViewHeaderFooterView

@property (strong, nonatomic) UILabel * askLabel;
@property (strong, nonatomic) UILabel * pointLabel;
@property (strong, nonatomic) UILabel * anwserLabel;
@property (strong, nonatomic) UILabel * stateLabel;
@property (strong, nonatomic) UIButton * lastNewBtn;
@property (strong, nonatomic) UIButton * lastHotBtn;

+ (instancetype)createFootHeaderViewWithDictionary:(NSMutableDictionary *)dic inTable:(UITableView *)tableView;

@end

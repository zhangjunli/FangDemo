//
//  FirstChatViewController.h
//  ddd
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstChatViewController : UIViewController
{
    BOOL isConcern;
    CGFloat originalTopConstraint;//table上面view的约束的初始值
    CGFloat originalBgImgTopConstraint;//背景图的约束的初始值
    NSMutableDictionary * sectionZeroDic;
    NSMutableDictionary * headerDic;
    NSMutableArray * sectionOneArray;
}
@property (strong, nonatomic) NSMutableDictionary * dataDic;
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *attention;
@property (weak, nonatomic) IBOutlet UIButton *careBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewTopConstraint;//table上面view的约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgImgTopConstraint;//背景图的约束
@property (weak, nonatomic) IBOutlet UITableView *customTabelView;

- (IBAction)careBtnClick:(UIButton *)sender;

@end

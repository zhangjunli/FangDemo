//
//  FirstChatViewController.m
//  ddd
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstChatViewController.h"
#import "CustomNavigationViewController.h"
#import "FirstChatTableViewCell.h"
#import "FirstContenChatTableViewCell.h"
#import "ChatContentTableViewHeaderFootView.h"
#import "FirstContenChatTableViewCell.h"


#define DESCRIBE             @"describe"
#define IMAGE                @"image"
#define CONTENT              @"content"
#define CLASSIFY             @"classify"
#define ATTENT               @"attent"
#define ASK                  @"ask"
#define IS_CONCERNED         @"isConcerned"
#define CONTAINER_MAX_TOP_CONSTRAINT  126


typedef NS_ENUM(NSUInteger, Direction) {
    directionUp = 0,
    directionDown
};

@interface FirstChatViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation FirstChatViewController

- (void)viewWillAppear:(BOOL)animated{
    //创建navigationbar
    CustomNavigationViewController * customNavigation = (CustomNavigationViewController *) self.navigationController;
    [customNavigation createNavigationBarBackgroundColor:[UIColor clearColor] titile:self.dataDic[CONTENT] leftNormalImg:@"navigation_back" leftHightImg:@"navigation_back_hight" rightNormalImg:@"navigation_share" rightHightImg:@"navigation_share_hight" addTarget:self leftBtnSelector:@selector(leftBtnClick:) rightBtnSelector:@selector(rightBtnClick:)];
    [customNavigation titleLabelAlpha:0.0];
    [customNavigation titleLabelFont:16.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUIData];
    [self createSectionZeroData];
    [self createHeaderDictionary];
    [self createSectionOneArray];

}

- (void)setUIData{
    
    self.bgImg.image = [UIImage imageNamed:self.dataDic[IMAGE]];
    self.containerView.backgroundColor = [UIColor clearColor];
    self.content.text = self.dataDic[CONTENT];
    self.attention.text = self.dataDic[ATTENT];
    NSString * imgName = [self.dataDic[IS_CONCERNED] boolValue] ? @"concerned" : @"concern";
    [self.careBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    originalTopConstraint = self.containerViewTopConstraint.constant;
    originalBgImgTopConstraint = self.bgImgTopConstraint.constant;
    
    //iOS8之后支持，利用xib自动计算cell的大小
    self.customTabelView.estimatedRowHeight = 2;
    self.customTabelView.rowHeight = UITableViewAutomaticDimension;
}

- (void)createSectionZeroData{
    sectionZeroDic = [NSMutableDictionary dictionary];
    [sectionZeroDic setObject:self.dataDic[AVATAR] forKey:AVATAR];
    [sectionZeroDic setObject:self.dataDic[NAME] forKey:NAME];
    [sectionZeroDic setObject:self.dataDic[DESCRIBE] forKey:OCCUPATION];
    [sectionZeroDic setObject:@"我是王思远，现就读于北京化工大学。2010-1012年由高校招生入伍服役于武警某机动部队，担负师机关警卫和执行工作，以及师机关国旗升降人物。次年担任班长负责新兵入伍训练工作。连续两年获全师队列比武团队第一名，共获嘉奖7次。退伍后加入北京化工大学国旗护卫队任队长兼教官，连续三年带队获得首都高校国旗仪仗队评比一等奖，现负责校方征兵工作。" forKey:DECRIPTION];
}

- (void)createHeaderDictionary{
    
    headerDic = [NSMutableDictionary dictionary];
    [headerDic setObject:@"170提问" forKey:ASK];
    [headerDic setObject:@"153回复" forKey:ANWSER];
    [headerDic setObject:@"进行中" forKey:STATE];
}

- (void)createSectionOneArray{
    
    NSArray * askNameArr = [NSArray arrayWithObjects:@"木木君爱吃蛋糕",@"天地寂寥山雨后",@"m134****0969",@"m152****0065",@"那一刀的风情",@"看到你就开心",@"此生应无恨",@"狼族的腾",@"海纳百川EBL5",@"小人国的牛",nil];
    NSArray * askDescriptionArr = [NSArray arrayWithObjects:@"老师，请问塘上行中傍能行仁义的傍是什么意思？",@"老师，有人说魏晋时期豪门土族以《道德经》注解《论语》等儒家经典是真的吗？你怎么看待这种情况？",@"老师，你好，我是一位学生，最近要准备写一篇关于魏晋名士的15min的综合性学习，请问老师您能否提供一些大纲以及能吸引人的事例，我真的很需要，谢谢，请尽快。",@"宁老师，请问如何创作小说？还有，古代古文言小说有哪些非常经典的，求推荐（具体到书也可以）",@"当年明月的明朝那些事上说王守仁龙场悟道，悟的什么道？知我行合一能具体解释一下吗？是像老毛说的那样精通的目的在于运用？求解，教师",@"老师，我有一个问题（0_0）？，为什么古代的中国人做学问或有学问的人都加子，比如孔子，孟子，孙子等。",@"你的回答都是废话，作为学者教授不应改耍这些态度，认真严肃点。",@"老师你好，你怎么看待从今穿古的穿越小说呢？",@"我是名高中生，有时候我在背古诗文时会有种荣耀感。中华文化有太多精华，您觉得仅靠考试来传承文化可行吗？",@"老师您好，第一版人民币您能鉴定吗？我有几张",nil];
    NSArray * anwserDecriptionArr = [NSArray arrayWithObjects:@"依靠",@"这正是玄学的学术创新之处。",@"请注意，这里是问吧，不是枪手吧。",@"我本人不是作家，没有资格说如何创作小说。文言小说最经典的是《聊斋志异》，往前推，唐传奇，还有六朝志怪志人，都有很多精彩名篇。我本人不是作家，没有资格说如何创作小说。文言小说",@"龙场悟道，知行合一，可以问百度",@"从字源看，子是象形字。甲骨文字形，象小儿在襁褓中，有头，身，臀膀，两足象并起来的样子。“子”是汉子的一个部首。本义：婴儿。子是抵地支的第一位，属鼠：～龙场悟道，知行合一，可以问百度从字源看，子是象形字。甲骨文字形，象小儿在襁褓中，有头，身，臀膀，两足象并起来的样子。“子”是汉子的一个部首。本义：婴儿。子是抵地支的第一位，属鼠：～龙场悟道，知行合一，可以问百度可以问百度",@"从字源看，子是象形字。甲骨文字形，象小儿在襁褓中，有头，身，臀膀，两足象并起来的样子。“子”是汉子的一个部首。本义：婴儿。子是抵地支的第一位，属鼠：～",@"文学创作本身没有界限没有禁区，问题在于艺术质量。",@"用废话回答是最好的方式",@"用废话回答是最好的方式",@"用废话回答是最好的方式",nil];
    NSArray * timeArr = [NSArray arrayWithObjects:@"13小时前",@"2016-04－18",@"2016-04－18",@"2016-04-17",@"2016-04－18",@"2016-04－18",@"2016-04－18",@"2016-04－18",@"2016-04－18",@"2016-04－18",nil];
    NSArray * praiseArr = [NSArray arrayWithObjects:@"2",@"99",@"102",@"1102",@"11102",@"111102",@"2",@"",@"",@"",nil];
    NSArray * commentArr = [NSArray arrayWithObjects:@"2",@"99",@"102",@"1102",@"11102",@"111102",@"2",@"",@"",@"",nil];
    NSArray * expandArray = [NSArray arrayWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    
    sectionOneArray = [NSMutableArray array];
    for (int i = 0; i < commentArr.count; i ++) {
        
        NSMutableDictionary * dic1 = [NSMutableDictionary dictionary];
        [dic1 setObject:@"microphone" forKey:ASK_AVATAR];
        [dic1 setObject:askNameArr[i] forKey:ASK_NAME];
        [dic1 setObject:askDescriptionArr[i] forKey:ASK_DESCRIPTION];
        [dic1 setObject:self.dataDic[AVATAR] forKey:ANWSER_AVATAR];
        [dic1 setObject:self.dataDic[NAME] forKey:ANWSER_NAME];
        [dic1 setObject:anwserDecriptionArr[i] forKey:ANWSER_DESCRIPTION];
        [dic1 setObject:timeArr[i] forKey:ANWSER_TIME];
        [dic1 setObject:praiseArr[i] forKey:PRAISE_LABEL];
        [dic1 setObject:commentArr[i] forKey:COMMENT_NUMBER];
        [dic1 setObject:expandArray[i] forKey:IS_EXPAND];
        
        [sectionOneArray addObject:dic1];
    }
    
}

- (void)leftBtnClick:(UIButton *)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)rightBtnClick:(UIButton *)btn{
    
}

- (IBAction)careBtnClick:(UIButton *)sender {
    
    isConcern = !isConcern;
    [self.dataDic setObject:@(isConcern) forKey:IS_CONCERNED];
    [sender setImage:[UIImage imageNamed:isConcern ? @"concerned" : @"concern"] forState:UIControlStateNormal];
}

#pragma mark -UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        FirstChatTableViewCell * cell = [FirstChatTableViewCell creatWithDictionary:sectionZeroDic inTableView:tableView];

        return cell;
    }
    
    FirstContenChatTableViewCell * cell = [FirstContenChatTableViewCell creatWithDictionary:sectionOneArray[indexPath.row] inTableView:tableView];

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        ChatContentTableViewHeaderFootView * headerView = [ChatContentTableViewHeaderFootView createFootHeaderViewWithDictionary:headerDic inTable:tableView];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 30;
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //改变约束的值，使containerview跟随tableview一起移动
    self.containerViewTopConstraint.constant = originalTopConstraint - scrollView.contentOffset.y;

    //scrollViewDidScroll捕捉到的contentOffset.y，在上一次为0，在此次，就有可能是45，因为大的差距在，故设置约束的最大值和最小值。必须在此范围内变化。否则，会出现UI异常
    //范围[-126,20]
    self.containerViewTopConstraint.constant = MAX(self.containerViewTopConstraint.constant, -CONTAINER_MAX_TOP_CONSTRAINT) > originalTopConstraint ? originalTopConstraint : MAX(self.containerViewTopConstraint.constant, -CONTAINER_MAX_TOP_CONSTRAINT);
    self.containerViewTopConstraint.priority = UILayoutPriorityDefaultHigh+1;
    
    //改变containerview的alpha值
    self.containerView.alpha = 1 - (-(self.containerViewTopConstraint.constant) + originalTopConstraint)/(originalTopConstraint + CONTAINER_MAX_TOP_CONSTRAINT);
    
    //显示navigation的title
    CustomNavigationViewController * customNavigation = (CustomNavigationViewController *) self.navigationController;
    [customNavigation titleLabelAlpha:(1 - self.containerView.alpha)];
    
    //图片下移范围为[－20，0]
    self.bgImgTopConstraint.constant = self.containerView.alpha * originalBgImgTopConstraint;
    self.bgImgTopConstraint.constant = MIN(self.bgImgTopConstraint.constant,0) < originalBgImgTopConstraint ? originalBgImgTopConstraint : MIN(self.bgImgTopConstraint.constant,0);
    self.bgImgTopConstraint.priority = UILayoutPriorityDefaultHigh+1;
}
@end

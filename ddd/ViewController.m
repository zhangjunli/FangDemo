//
//  ViewController.m
//  ddd
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CustomNavigationViewController.h"
#import "FXBlurView.h"
#import "ViewController.h"
#import "FristTableViewController.h"
#import "SecondTableViewController.h"
#import "ThirdTableViewController.h"
#import "FourTableViewController.h"
#import "FirstChatViewController.h"

#define SCROLL_WIDTH     350
#define SCROLL_HEIGHT    30
#define SCROLL_Y         NAVIGATION_BAR_HEIGHT
#define SCROLL_X         10
#define BUTTON_SPACE     20
#define COVER_VIEW_WIDTH 15
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define NAVIGATION_BAR_HEIGHT 64
#define STATUS_BAR_HEIGHT     20

typedef NS_ENUM(NSUInteger, Direction) {
    directionLeft = 0,
    directionRight
};

@interface ViewController ()<UIScrollViewDelegate>
{
    NSMutableArray * widthArray;
    NSMutableArray * vcArray;
    NSMutableArray * dataArray;
    UIButton       * lastBtn;
    UIScrollView * titleScrollView;
    UIScrollView * contentScrollView;
    
}

@end

@implementation ViewController

- (BOOL)isPureNumandCharacters:(NSString *)string
{
    if (string && string.length > 0)
    {
        NSString * tmpstring = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        if(tmpstring.length > 0)
        {
            return NO;
        }
        return YES;
    }else
    {
        return NO;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    //创建navigationbar
    CustomNavigationViewController * customNavigation = (CustomNavigationViewController *) self.navigationController;
    [customNavigation createNavigationBarBackgroundColor:[UIColor redColor] titile:@"问吧" leftNormalImg:nil leftHightImg:nil rightNormalImg:@"login_normal" rightHightImg:@"login_hight" addTarget:self leftBtnSelector:nil rightBtnSelector:@selector(rightBtnClick:)];
    [customNavigation titleLabelAlpha:1.0];
    
    //刷新表
    UITableViewController * tableController = vcArray[(lastBtn.tag - 1)%4];
    [tableController.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    //第一种方法，判断是否为纯数字
    BOOL isNumber = [self isPureNumandCharacters:@"23"];
    NSLog(@"isNumber = %d",isNumber);
    
    //第二种，判断是否为纯数字
    NSLog(@"%d",[@"-45.345" intValue]);
     */
    
    [self createArray];
    [self createContentScrollView];
    [self createTitleScrollView];

}

- (void)rightBtnClick:(UIButton *)btn
{
    
}

#pragma mark -初始化数据 & UI
- (void)createArray
{
    vcArray = [NSMutableArray array];
    
    FristTableViewController * firstVC = [[FristTableViewController alloc] init];
    SecondTableViewController *secondVC = [[SecondTableViewController alloc] init];
    ThirdTableViewController *thirdVC = [[ThirdTableViewController alloc] init];
    FourTableViewController *fourVC = [[FourTableViewController alloc] init];
    
    __weak typeof(self) weakSelf = self;
    firstVC.firstVCTransition = ^(NSInteger index , NSMutableDictionary * dic){
        FirstChatViewController * chatVC = [[FirstChatViewController alloc] init];
        chatVC.dataDic = dic;
        [weakSelf.navigationController pushViewController:chatVC animated:YES];
    };
    
    [vcArray addObject:firstVC];
    [vcArray addObject:secondVC];
    [vcArray addObject:thirdVC];
    [vcArray addObject:fourVC];
    
    widthArray = [NSMutableArray array];
    
    dataArray = [NSMutableArray arrayWithObjects:@"头条",@"娱乐",@"热点",@"体育",@"南京",@"网易号",@"财经",@"科技",@"汽车",@"时尚",@"图片",@"跟帖",@"房产",@"直播",@"轻松一刻",@"段子",@"军事",@"历史",@"家具",@"独家",@"游戏",@"健康",@"政务",@"漫画",@"哒哒趣闻",@"彩票", nil];
}

- (void)createContentScrollView
{
    contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SCROLL_Y + SCROLL_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - SCROLL_HEIGHT - SCROLL_Y)];
    contentScrollView.delegate = self;
    contentScrollView.pagingEnabled = YES;
    contentScrollView.directionalLockEnabled = YES;
    contentScrollView.clipsToBounds = YES;
    contentScrollView.alwaysBounceHorizontal = YES;
    contentScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:contentScrollView];
    [contentScrollView setContentSize:CGSizeMake(dataArray.count * SCREEN_WIDTH, SCREEN_HEIGHT - SCROLL_HEIGHT - SCROLL_Y)];
}

- (void)createTitleScrollView
{
    //创建titlescroller
    titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(SCROLL_X, SCROLL_Y, SCROLL_WIDTH, SCROLL_HEIGHT)];
    titleScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:titleScrollView];
    
    //scrollView 两端的遮罩层
    //左端
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(SCROLL_X, SCROLL_Y, COVER_VIEW_WIDTH, SCROLL_HEIGHT)];
    [self insertGradientLayerWithView:leftView direction:directionLeft];
    [self.view addSubview:leftView];
    //右端
    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleScrollView.frame) - COVER_VIEW_WIDTH, SCROLL_Y, COVER_VIEW_WIDTH, SCROLL_HEIGHT)];
    [self insertGradientLayerWithView:rightView direction:directionRight];
    [self.view addSubview:rightView];
    
    CGFloat totalWidth = COVER_VIEW_WIDTH;
    for (int i = 0; i < dataArray.count; i ++)
    {
        CGSize size = [dataArray[i] sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(totalWidth, 0, size.width, SCROLL_HEIGHT);
        [button setTitle:dataArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = i + 1;
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleScrollView addSubview:button];
        if (i == 0)
        {
            [self titleClick:button];
        }
        
        totalWidth += (size.width + BUTTON_SPACE);
        [widthArray addObject:@(size.width)];
    }
    titleScrollView.contentSize = CGSizeMake(totalWidth, 0);
}

#pragma mark -对view添加渐变色
- (void)insertGradientLayerWithView:(UIView *)aView direction:(Direction)direction
{
    //初始化渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, aView.frame.size.width, aView.frame.size.height);
    [aView.layer addSublayer:gradientLayer];
    
    //设置渐变颜色方向  横向
    gradientLayer.startPoint = CGPointMake(0.0, 1.0);
    gradientLayer.endPoint = CGPointMake(1.0, 1.0);
    
    if (direction == directionLeft)
    {
        //设定颜色组z
        gradientLayer.colors = @[(id)[[UIColor whiteColor] colorWithAlphaComponent:0.9].CGColor,(id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor,(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor];
        //设定颜色分割点(0.5,0.5)表示各一半
        gradientLayer.locations = @[@(0.2),@(0.5f),@(1.0f)];
    }else
    {
        //设定颜色组z
        gradientLayer.colors = @[(id)[[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor,(id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor,(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.9].CGColor];
        //设定颜色分割点(0.5,0.5)表示各一半
        gradientLayer.locations = @[@(0.3),@(0.6f),@(1.0f)];
    }

}

#pragma mark -buttonClick

- (void)titleClick:(UIButton *)btn
{
    if (lastBtn)
    {
        //放大，改变颜色
        if (lastBtn.tag == btn.tag)
        {
            return;
        }
        
        lastBtn.transform = CGAffineTransformIdentity;
        [lastBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    lastBtn = btn;
    
    //移动位置
    CGFloat currentLocation = 15;
    for (int i = 0; i < widthArray.count; i ++)
    {
        if (i < (btn.tag - 1))
        {
            currentLocation += [widthArray[i] floatValue] + BUTTON_SPACE;
        }
        else if (i == (btn.tag - 1))
        {
            currentLocation += [widthArray[i] floatValue];
        }
    }

    BOOL leftCriticalCondition = (currentLocation - titleScrollView.contentOffset.x) - SCROLL_WIDTH/2.0 < 0;
    BOOL rightCriticalCondition = (currentLocation - titleScrollView.contentOffset.x) - SCROLL_WIDTH/2.0 > 0;
    if (leftCriticalCondition)
    {
        CGFloat offsetX = MIN((SCROLL_WIDTH/2.0 - (currentLocation - titleScrollView.contentOffset.x)), titleScrollView.contentOffset.x);
        [titleScrollView setContentOffset:CGPointMake(titleScrollView.contentOffset.x - offsetX, 0) animated:YES];
    }
    
    if (rightCriticalCondition)
    {
        CGFloat offsetX = MIN(((currentLocation - titleScrollView.contentOffset.x) - SCROLL_WIDTH/2.0), (titleScrollView.contentSize.width - SCROLL_WIDTH) - titleScrollView.contentOffset.x);
        [titleScrollView setContentOffset:CGPointMake(titleScrollView.contentOffset.x + offsetX, 0) animated:YES];
    }
    
    //显示对应的view
    UITableViewController * vc = vcArray[(btn.tag - 1)%4];
    if (contentScrollView.subviews.count == 0) {
        vc.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SCROLL_HEIGHT);
        [contentScrollView addSubview:vc.view];
    }else
    {
        if (vc.view.frame.origin.x != (btn.tag - 1)*SCREEN_WIDTH)
        {
            vc.view.frame = CGRectMake((btn.tag - 1)*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SCROLL_HEIGHT);
            [contentScrollView addSubview:vc.view];
        }else
        {
            //刷新表
            [vc.tableView reloadData];
        }
    }
    [contentScrollView setContentOffset:CGPointMake((btn.tag - 1)*SCREEN_WIDTH, 0) animated:NO];
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = (int)(scrollView.contentOffset.x/SCREEN_WIDTH);
    UIButton * btn = [titleScrollView viewWithTag:(index+1)];
    [self titleClick:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

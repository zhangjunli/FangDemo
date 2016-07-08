//
//  CustomNavigationViewController.m
//  ddd
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CustomNavigationViewController.h"

#define SCREEN_WIDTH                  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT                 [UIScreen mainScreen].bounds.size.height
#define NAVIGATION_BAR_HEIGHT          64
#define STATUS_BAR_HEIGHT              20
#define NAVIGATION_TITLE_LEFT_MARGIN   50
#define NAVIGATION_TITLE_RIGHT_MARGIN  NAVIGATION_TITLE_LEFT_MARGIN

@interface CustomNavigationViewController ()
{
    UIView * customNavigationBar;
    UILabel * titleLabel;
    UIButton * leftBtn;
    UIButton * rightBtn;
}

@end

@implementation CustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createNavigationBarBackgroundColor:(UIColor *)bgColor titile:(NSString *)title leftNormalImg:(NSString *)leftNormalImg leftHightImg:(NSString *)leftHightImg rightNormalImg:(NSString *)rightNormalImg rightHightImg:(NSString *)rightHightImg addTarget:(nullable id)target leftBtnSelector:(SEL)leftSelector rightBtnSelector:(SEL)rightSelector
{
    //创建navigationbar
    if (!customNavigationBar)
    {
        customNavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
        [self.view addSubview:customNavigationBar];
    }
    customNavigationBar.backgroundColor = bgColor;

    //创建navigationbar title
    if (title)
    {
        if (!titleLabel)
        {
            titleLabel = [[UILabel alloc] init];
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.font = [UIFont systemFontOfSize:18];
            [customNavigationBar addSubview:titleLabel];
        }
        CGSize textSize = [title sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]}];
        if (textSize.width > (SCREEN_WIDTH - 2 * NAVIGATION_TITLE_LEFT_MARGIN))
        {
            textSize.width = SCREEN_WIDTH - 2 * NAVIGATION_TITLE_LEFT_MARGIN;
        }
        titleLabel.bounds = CGRectMake(0, 0, textSize.width, textSize.height);
        titleLabel.center = CGPointMake(customNavigationBar.center.x, (NAVIGATION_BAR_HEIGHT - textSize.height)/2 + (textSize.height + STATUS_BAR_HEIGHT)/2);
        titleLabel.text = title;
        titleLabel.hidden = NO;
    }else{
        titleLabel.hidden = YES;
    }
    
    //左侧按钮
    if (leftNormalImg){
        if (!leftBtn){
            leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [customNavigationBar addSubview:leftBtn];
        }
        UIImage * leftBgImg = [UIImage imageNamed:leftNormalImg];
        leftBtn.bounds = CGRectMake(0, 0, leftBgImg.size.width, leftBgImg.size.height);
        leftBtn.center = CGPointMake(leftBgImg.size.width/2, (NAVIGATION_BAR_HEIGHT - leftBgImg.size.height)/2 + (leftBgImg.size.height + STATUS_BAR_HEIGHT)/2);
        [leftBtn setImage:leftBgImg forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:leftHightImg] forState:UIControlStateHighlighted];
        [leftBtn addTarget:target action:leftSelector forControlEvents:UIControlEventTouchUpInside];
        leftBtn.hidden = NO;
    }else{
        leftBtn.hidden = YES;
    }
    
    //右侧按钮
    if (rightNormalImg){
        if (!rightBtn) {
            rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [customNavigationBar addSubview:rightBtn];
        }
        UIImage * rightBgImg = [UIImage imageNamed:rightNormalImg];
        rightBtn.bounds = CGRectMake(0, 0, rightBgImg.size.width, rightBgImg.size.height);
        rightBtn.center = CGPointMake(2 * customNavigationBar.center.x - rightBgImg.size.width/2, (NAVIGATION_BAR_HEIGHT - rightBgImg.size.height)/2 + (rightBgImg.size.height + STATUS_BAR_HEIGHT)/2);
        [rightBtn setImage:rightBgImg forState:UIControlStateNormal];
        [rightBtn setImage:[UIImage imageNamed:rightHightImg] forState:UIControlStateHighlighted];
        [rightBtn addTarget:target action:rightSelector forControlEvents:UIControlEventTouchUpInside];
        rightBtn.hidden = NO;
    }else{
        rightBtn.hidden = YES;
    }
}

- (void)titleLabelAlpha:(CGFloat)alphaValue{
    
    titleLabel.alpha = alphaValue;
}

- (void)titleLabelFont:(CGFloat)fontValue{
    titleLabel.font = [UIFont systemFontOfSize:fontValue];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

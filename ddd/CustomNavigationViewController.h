//
//  CustomNavigationViewController.h
//  ddd
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationViewController : UINavigationController

- (void)createNavigationBarBackgroundColor:(UIColor *)bgColor titile:(NSString *)title leftNormalImg:(NSString *)leftNormalImg leftHightImg:(NSString *)leftHightImg rightNormalImg:(NSString *)rightNormalImg rightHightImg:(NSString *)rightHightImg addTarget:(id)target leftBtnSelector:(SEL)leftSelector rightBtnSelector:(SEL)rightSelector;

- (void)titleLabelAlpha:(CGFloat)alphaValue;

- (void)titleLabelFont:(CGFloat)fontValue;

@end

//
//  FristTableViewController.h
//  ddd
//
//  Created by mac on 16/4/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FristTableViewController : UITableViewController
@property (copy, nonatomic) void(^firstVCTransition)(NSInteger index,NSMutableDictionary * dic);

@end

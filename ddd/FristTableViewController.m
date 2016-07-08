//
//  FristTableViewController.m
//  ddd
//
//  Created by mac on 16/4/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FristTableViewController.h"
#import "FirstTableViewCell.h"

@interface FristTableViewController ()
{
    NSMutableArray * dataSource;
}

@end

@implementation FristTableViewController

- (void)createDataSource
{
    dataSource = [NSMutableArray array];
    
    NSArray * avatarArray = [[NSArray alloc] initWithObjects:@"defaultAvatar",@"robot",@"defaultAvatar",@"robot",@"defaultAvatar",@"robot",@"defaultAvatar",@"robot",@"defaultAvatar",@"robot", nil];
    NSArray * nameArray = [[NSArray alloc] initWithObjects:@"刘晨",@"赵紫峰",@"bboy洪岩",@"邢洋",@"田华",@"王韬钦",@"传古先生",@"高辰",@"水色",@"刘康谨", nil];
    NSArray * describeArray = [[NSArray alloc] initWithObjects:@"社会学研究者",@"大自然生活专家",@"车评人，修理工",@"运动员",@"物流仓库系统专家",@"法律工作者",@"姓名学专家",@"民航安全员",@"马拉松爱好者",@"心里疗愈工作者", nil];
    NSArray * imageArray = [[NSArray alloc] initWithObjects:@"picture2",@"pic",@"picture2",@"pic",@"picture2",@"pic",@"picture2",@"pic",@"picture2",@"pic", nil];
    NSArray * contentArray = [[NSArray alloc] initWithObjects:@"我是社会学博士刘晨，有关乡村治理，网络政治与反腐的问题，问我吧！",@"我是胡子爸爸，关于农业种植，环保建筑，养狗，艺术，美食等问题，问我吧！",@"我是独立车评人及修理工洪岩，关于修车，养车的问题，问我吧！",@"我是CUBA运动员邢洋，科比最后一役，感谢科比，再见青春！",@"我是田华，关于物流系统，智能化仓储，物流系统规划实施方面的一切问题，问我吧！",@"我是法律人王韬钦，关于公司法，劳动合同法的问题，问我吧！",@"我是传古先生，关于起名，测名等相关姓名的一切问题，问我吧！",@"我是民航安全员高辰，关于民航安全等各种相关问题，问我吧！",@"我是马拉松爱好者水色，关于马拉松相关问题，问我吧！",@"我是心理疗愈工作者刘康谨，关于亲子关系，亲密关系如何维护的问题，问我吧！", nil];
    NSArray * classifyArray = [[NSArray alloc] initWithObjects:@"社会时政",@"生活健康",@"汽车",@"体育",@"科技",@"社会时政",@"历史人文",@"生活健康",@"体育",@"生活健康", nil];
    NSArray * attentArray = [[NSArray alloc] initWithObjects:@"2217 关注",@"5160 关注",@"5.8万 关注",@"5094 关注",@"424 关注",@"309 关注",@"1606 关注",@"2.8万 关注",@"1728 关注",@"1.1万 关注", nil];
    NSArray * askArray = [[NSArray alloc] initWithObjects:@"35 提问",@"68 提问",@"2158 提问",@"140 提问",@"8 提问",@"问题征集中",@"180 提问",@"2721 提问",@"55 提问",@"206 提问", nil];
    NSArray * isConcernArray = [[NSArray alloc] initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    for (int i = 0; i < askArray.count; i ++)
    {
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        [dic setObject:avatarArray[i] forKey:AVATAR];
        [dic setObject:nameArray[i] forKey:NAME];
        [dic setObject:describeArray[i] forKey:DESCRIBE];
        [dic setObject:imageArray[i] forKey:IMAGE];
        [dic setObject:contentArray[i] forKey:CONTENT];
        [dic setObject:classifyArray[i] forKey:CLASSIFY];
        [dic setObject:attentArray[i] forKey:ATTENT];
        [dic setObject:askArray[i] forKey:ASK];
        [dic setObject:isConcernArray[i] forKey:IS_CONCERNED];
        
        [dataSource addObject:dic];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 280;
    self.title = @"问吧";
    [self createDataSource];
    
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [FirstTableViewCell creatWithDictionary:dataSource[indexPath.row] inTableView:tableView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.firstVCTransition(indexPath.row,dataSource[indexPath.row]);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  HFSetWayViewController.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFSetWayViewController.h"
#import "HFSetTableViewCell.h"
#import "HFModel.h"

@interface HFSetWayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) CGFloat cellHeight;
@end

@implementation HFSetWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)setupUI{
    //    self.tableView.estimatedRowHeight = 200;
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HFSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    HFModel *model = self.dataArr[indexPath.row];
   self.cellHeight = [cell setWithModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return self.cellHeight;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HFSetTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    
    return _tableView;
}
@end

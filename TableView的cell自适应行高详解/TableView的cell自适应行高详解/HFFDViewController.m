//
//  HFFDViewController.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFFDViewController.h"
#import "HFFDTableViewCell.h"
#import "HFModel.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface HFFDViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HFFDViewController
- (void)viewDidLoad{
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
    HFFDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    HFModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"cellID" configuration:^(HFFDTableViewCell *cell) {
        
       cell.model = self.dataArr[indexPath.row];
    }];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HFFDTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    
    return _tableView;
}
@end


//
//  HFTheSingletonViewController.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFTheSingletonViewController.h"
#import "HFTheSingletonTableViewCell.h"
#import "HFModel.h"

@interface HFTheSingletonViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HFTheSingletonViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
}
- (void)setupUI{
    self.tableView.estimatedRowHeight = 200;
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HFTheSingletonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    HFModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static HFTheSingletonTableViewCell *cell;
    //只初始化一次cell
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    });
    HFModel *model = self.dataArr[(NSUInteger) indexPath.row];
    cell.model = model;
    
    if (model.SingletonTableViewCellheight <= 0) {
        //使用systemLayoutSizeFittingSize获取高度
        model.SingletonTableViewCellheight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    }
    return model.heightOfCell;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HFTheSingletonTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    
    return _tableView;
}
@end


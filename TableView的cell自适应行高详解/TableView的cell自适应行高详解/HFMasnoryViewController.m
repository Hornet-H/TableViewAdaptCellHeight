//
//  HFMasnoryViewController.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFMasnoryViewController.h"
#import "HFMasnoryTableViewCell.h"
#import "HFModel.h"


@interface HFMasnoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation HFMasnoryViewController

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
    HFMasnoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    HFModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;

}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HFMasnoryTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    
    return _tableView;
}
@end


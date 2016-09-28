//
//  HFFrameModelViewController.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/28.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFFrameModelViewController.h"
#import "HFFrameModelTableViewCell.h"
#import "HFFrameModel.h"

@interface HFFrameModelViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *frameModelArr;

@end

@implementation HFFrameModelViewController

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
    HFFrameModelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    HFModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    HFFrameModel *model = self.frameModelArr[indexPath.row];
    
    return model.cellHeight;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HFFrameModelTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }

    return _tableView;
}
- (NSArray *)frameModelArr{
    if (!_frameModelArr) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (HFModel *model in self.dataArr) {
            HFFrameModel *frameModel = [[HFFrameModel alloc]init];
            frameModel.model = model;
            [tempArr addObject:frameModel];
            
        }
        _frameModelArr = tempArr.copy;
    }

    return _frameModelArr;
}
@end

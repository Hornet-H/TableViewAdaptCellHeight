//
//  HFBaseViewController.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/26.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFBaseViewController.h"
#import "HFModel.h"

@interface HFBaseViewController ()


@end

@implementation HFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    }

- (void)setupUI{



}



- (NSArray *)dataArr{
    if (!_dataArr) {
            NSMutableArray * tempArr = [HFModel objectArrayWithFilename:@"Property List.plist"];
        _dataArr = tempArr.copy;
    }
    return _dataArr;
}



@end

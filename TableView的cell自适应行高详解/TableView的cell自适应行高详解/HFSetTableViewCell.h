//
//  HFSetTableViewCell.h
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/28.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HFModel;
@interface HFSetTableViewCell : UITableViewCell
@property (strong, nonatomic) HFModel *model;
- (CGFloat )setWithModel:(HFModel *)model;
@end

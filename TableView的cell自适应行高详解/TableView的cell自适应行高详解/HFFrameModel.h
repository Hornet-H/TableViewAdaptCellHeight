//
//  HFFrameModel.h
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HFModel.h"

@class HFModel;
@interface HFFrameModel : NSObject
@property (strong, nonatomic) HFModel *model;
@property (assign, nonatomic) CGFloat cellHeight;


@end

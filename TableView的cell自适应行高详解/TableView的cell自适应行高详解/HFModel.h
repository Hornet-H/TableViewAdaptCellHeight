//
//  HFModel.h
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFModel : NSObject

@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *guide;
@property (copy, nonatomic) NSString *time;

@property (assign, nonatomic) CGFloat cellHeight;

@end

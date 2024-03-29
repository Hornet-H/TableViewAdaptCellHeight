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

/** 在setModel里面获取*/
@property (assign, nonatomic) CGFloat cellHeight;
/** 行高在model里面计算得出的结果*/
@property (assign, nonatomic,readonly) CGFloat heightOfCell;


/** 采用单利的方式获取*/
@property (assign, nonatomic) CGFloat SingletonTableViewCellheight;



@end

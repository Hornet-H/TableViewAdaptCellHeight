//
//  HFFrameModel.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFFrameModel.h"

@implementation HFFrameModel

- (void)setModel:(HFModel *)model{
    _model = model;
    CGRect titleLabelFrame = CGRectMake(margin, margin/2, kScreenWidth - 2 * margin - 50, 25);
//    CGRect priceLabelFrame = CGRectMake(titleLabelFrame.origin.x + titleLabelFrame.size.width, margin/2, 50, 25);
    CGSize maxSize = CGSizeMake(kScreenWidth - 2 * margin, CGFLOAT_MAX);
    CGRect descRect = [model.desc boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    
    CGRect descLabelFrame = CGRectMake(margin, titleLabelFrame.origin.y + titleLabelFrame.size.height , descRect.size.width, descRect.size.height);
    
    CGRect guideRect = [model.guide boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    CGRect guideLabelFrame = CGRectMake(margin, descLabelFrame.origin.y + descLabelFrame.size.height, guideRect.size.width, guideRect.size.height);
    
    CGRect timeLabelFrame = CGRectMake(kScreenWidth - 100 - margin, guideLabelFrame.origin.y + guideLabelFrame.size.height, 100, 20) ;

    self.cellHeight = timeLabelFrame.origin.y +margin;

}


@end

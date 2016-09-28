//
//  HFModel.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/27.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFModel.h"

@interface HFModel ()
@property (assign, nonatomic) CGFloat heightOfCell;

@end

@implementation HFModel

- (CGFloat)heightOfCell{
    if(_heightOfCell == 0){
        
        CGFloat height = margin + 25  + 20 ;
        
        //title高度
        height += ceil([self heightWithText:self.desc fontSize:16  Width:kScreenWidth - 2 * margin]) ;
        //高度
        height += ceil([self heightWithText:self.guide fontSize:16  Width:kScreenWidth - 2* margin]);
        height += margin;
        
        _heightOfCell = height;
    }
    return _heightOfCell;

}
- (CGFloat)heightWithText:(NSString *)text fontSize:(CGFloat)fontsize Width:(CGFloat)width{
    // 设置一个字典保存文本属性
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]};
    // 预设尺寸 文本最大不会超过这个尺寸
    CGSize size = CGSizeMake(width, 1000);
    // 根据文本信息计算得到一个CGRECT
    // 参数1:尺寸范围
    // 参数2:获取文本尺寸的方式
    // 参数3:获取文本属性
    // 参数3:无用信息(上下文)
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}@end

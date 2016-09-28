//
//  HFFrameModelTableViewCell.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/28.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFFrameModelTableViewCell.h"
#import "HFModel.h"

@interface HFFrameModelTableViewCell ()
@property (strong, nonatomic) UILabel  *titleLabel;
@property (strong, nonatomic) UILabel *descLabel;
@property (strong, nonatomic) UILabel *guideLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *priceLabel;

@end

@implementation HFFrameModelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.guideLabel];
    [self.contentView addSubview:self.timeLabel];
    
    [self layoutIfNeeded];
}

- (void)setModel:(HFModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.priceLabel.text = model.price;
    self.descLabel.text = model.desc;
    self.guideLabel.text = model.guide;
    self.timeLabel.text = model.time;
    [self setSubViewsFrameWithModel:model];
}

- (void)setSubViewsFrameWithModel:(HFModel *)model {
    
    CGSize maxSize = CGSizeMake(kScreenWidth - 2 * margin, CGFLOAT_MAX);
    CGRect descRect = [model.desc boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    self.descLabel.frame = CGRectMake(margin, self.titleLabel.bottom, descRect.size.width, descRect.size.height);
    
    CGRect guideRect = [model.guide boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    self.guideLabel.frame = CGRectMake(margin, self.descLabel.bottom, guideRect.size.width, guideRect.size.height);
    NSLog(@"----%f-----",self.guideLabel.origin.y);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(margin, margin/2, kScreenWidth - 2 * margin - 50, 25);
    self.priceLabel.frame = CGRectMake(self.titleLabel.right, margin/2, 50, 25);
    //    self.descLabel.frame = CGRectMake(margin, self.titleLabel.bottom, kScreenWidth - 2 * margin , 0);
    //    self.guideLabel.frame = CGRectMake(margin, self.descLabel.bottom, kScreenWidth - 2 * margin , 0);
    self.timeLabel.frame = CGRectMake(kScreenWidth - 100 - margin, self.guideLabel.bottom, 100, 20) ;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = randomColor;
        _titleLabel.font = [UIFont systemFontOfSize:20];
            }
    return _titleLabel;
}

-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.numberOfLines = 0;
        _descLabel.backgroundColor = randomColor;
        _descLabel.font = [UIFont systemFontOfSize:16];
    }
    return _descLabel;
}

- (UILabel *)guideLabel{
    if (!_guideLabel) {
        _guideLabel = [[UILabel alloc]init];
        _guideLabel.numberOfLines = 0;
        _guideLabel.backgroundColor = randomColor;
//        _guideLabel.textColor = randomColor;
        _guideLabel.font = [UIFont systemFontOfSize:16];
    }
    return _guideLabel;
}

- (UILabel *)timeLabel{
    
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.numberOfLines = 0;
        _timeLabel.backgroundColor = randomColor;
//        _timeLabel.textColor = randomColor;
        _timeLabel.font = [UIFont systemFontOfSize:20];
    }
    return _timeLabel;
    
    
}
- (UILabel *)priceLabel{
    
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.numberOfLines = 0;
        _priceLabel.backgroundColor = randomColor;
//        _priceLabel.textColor = randomColor;
        _priceLabel.font = [UIFont systemFontOfSize:20];
    }
    return _priceLabel;
}


@end

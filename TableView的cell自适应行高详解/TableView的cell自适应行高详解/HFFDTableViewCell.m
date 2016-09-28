//
//  HFFDTableViewCell.m
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/28.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFFDTableViewCell.h"
#import "HFModel.h"

@interface HFFDTableViewCell ()

@property (strong, nonatomic) UILabel  *titleLabel;
@property (strong, nonatomic) UILabel *descLabel;
@property (strong, nonatomic) UILabel *guideLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *priceLabel;

@end

@implementation HFFDTableViewCell
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
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(margineSide);
        make.left.equalTo(self.contentView.mas_left).offset(margineSide);
        make.width.equalTo(kScreenWidth - 60 - 2 * margineSide);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(margineSide);
        make.left.equalTo(self.titleLabel.mas_right);
        make.width.equalTo(60);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(margineSide);
        make.left.equalTo(self.contentView.mas_left).offset(margineSide);
        make.right.equalTo(self.contentView.mas_right).offset(- margineSide);
    }];
    [self.guideLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descLabel.mas_bottom).offset(margineSide);
        make.left.equalTo(self.contentView.mas_left).offset(margineSide);
        make.right.equalTo(self.contentView.mas_right).offset(- margineSide);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.guideLabel.mas_bottom).offset(margineSide);
        make.width.equalTo(100);
        make.right.equalTo(self.contentView.mas_right).offset(- margineSide);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(- margineSide);
    }];
    
}
- (void)setModel:(HFModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.priceLabel.text = model.price;
    self.descLabel.text = model.desc;
    self.guideLabel.text = model.guide;
    self.timeLabel.text = model.time;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:20];
        
        _titleLabel.textColor = randomColor;
    }
    return _titleLabel;
}

-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.numberOfLines = 0;
        //        _descLabel.backgroundColor = randomColor;
        //        _descLabel.preferredMaxLayoutWidth = kScreenWidth - 2 * margin;
        _descLabel.font = [UIFont systemFontOfSize:16];
    }
    return _descLabel;
}

- (UILabel *)guideLabel{
    if (!_guideLabel) {
        _guideLabel = [[UILabel alloc]init];
        _guideLabel.numberOfLines = 0;
        _guideLabel.textColor = randomColor;
        //        _guideLabel.preferredMaxLayoutWidth = kScreenWidth - 2 * margin;
        _guideLabel.font = [UIFont systemFontOfSize:16];
    }
    return _guideLabel;
}

- (UILabel *)timeLabel{
    
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.numberOfLines = 0;
        //        _timeLabel.textColor = randomColor;
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:16];
    }
    return _timeLabel;
    
    
}
- (UILabel *)priceLabel{
    
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.numberOfLines = 0;
        //        _priceLabel.backgroundColor = randomColor;
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        //        _priceLabel.textColor = randomColor;
        _priceLabel.font = [UIFont systemFontOfSize:20];
    }
    return _priceLabel;
}


@end

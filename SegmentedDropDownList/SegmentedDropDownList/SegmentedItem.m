//
//  SegmentedItem.m
//  MeeYou
//
//  Created by 杨贺 on 15/5/13.
//  Copyright (c) 2015年 renren. All rights reserved.
//

#import "SegmentedItem.h"
@interface SegmentedItem()
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView  *verticalView;
@end

@implementation SegmentedItem

-(id)initWithTitle:(NSString *)title data:(NSArray *)listData{
    self = [super init];
    if (self) {
        _title = title;
        _listData = listData;

        self.titleLabel.text = _title;
        
        [self addSubview:self.titleLabel];

    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];

    [self.titleLabel setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}

-(void)setTitleColor:(UIColor *)titleColor{
    [self.titleLabel setTextColor:titleColor];
}

#pragma mark init

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

@end

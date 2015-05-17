//
//  SegmentedItem.h
//  MeeYou
//
//  Created by 杨贺 on 15/5/13.
//  Copyright (c) 2015年 renren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedItem : UIView

-(id)initWithTitle:(NSString *)title data:(NSArray *)listData;

@property (nonatomic,strong)NSArray *listData;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)UIColor  *titleColor;
@end

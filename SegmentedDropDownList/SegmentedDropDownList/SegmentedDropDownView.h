//
//  SegmentedDropDownView.h
//  SegmentedDropDownList
//
//  Created by 杨贺 on 15/5/12.
//  Copyright (c) 2015年 yanghe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentedItem.h"
@protocol SegmentedDropDownViewDelegate <NSObject>
-(void)segmentedDropDownView:(UITableView *)dropDownView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface SegmentedDropDownView : UIView
@property(nonatomic, weak) id<SegmentedDropDownViewDelegate> delegate;
@property(nonatomic,strong)NSArray *items;
-(id)initWithFrame:(CGRect)frame items:(NSArray *)items;
-(void)closeDropDownListWithCompletion:(void (^)(void))Completion;
-(void)tapAction:(UIGestureRecognizer *)gr;
@end

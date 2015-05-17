//
//  SegmentedDropDownView.m
//  SegmentedDropDownList
//
//  Created by 杨贺 on 15/5/12.
//  Copyright (c) 2015年 yanghe. All rights reserved.
//

#import "SegmentedDropDownView.h"


const static CGFloat kHeight = 44;
const static CGFloat kAnimationDuration = 0.2;

@interface SegmentedDropDownView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView    *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,assign)BOOL            isShowDropDownView;
@property(nonatomic,assign)CGRect          oldFrame;
@property(nonatomic,assign)NSUInteger      oldItemClickedTag;
@end

@implementation SegmentedDropDownView

-(id)initWithFrame:(CGRect)frame items:(NSArray *)items{
    self = [super initWithFrame:frame];
    if (self) {
        self.isShowDropDownView = NO;
        self.oldFrame = frame;
        
        _items = [NSArray arrayWithArray:items];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        CGFloat itemWidth = frame.size.width/items.count;
        CGFloat itemHeight = frame.size.height;
        
        [self addSubview:self.tableView];
        
        [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            SegmentedItem *item = (SegmentedItem *)obj;
            item.tag = idx;
            [item setFrame:CGRectMake(itemWidth*idx, 0, itemWidth, itemHeight)];
            
            UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            [item addGestureRecognizer:tapGR];
            [self addSubview:item];
        }];
    }
    return self;
}


-(void)tapAction:(UIGestureRecognizer *)gr{
    
    [self.superview bringSubviewToFront:self];
    
    [self.dataArray removeAllObjects];
    
    SegmentedItem *item;
    if ([gr.view isKindOfClass:[SegmentedItem class]]) {
        item = (SegmentedItem *)gr.view;
        [self.dataArray addObjectsFromArray:item.listData];
    }
    [self.tableView reloadData];
    
    if (self.isShowDropDownView) {
        self.isShowDropDownView = NO;
        [self closeDropDownListWithCompletion:nil];
    }else{
        self.isShowDropDownView = YES;
        [self showDropDownList];
    }
}

-(void)showDropDownList{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [self.tableView setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, kHeight*self.dataArray.count)];

        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height+(kHeight*self.dataArray.count))];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)closeDropDownListWithCompletion:(void (^)(void))Completion{
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.oldFrame.size.height)];
        [self.tableView setFrame:CGRectMake(0, 0, self.frame.size.width, 0)];

    } completion:^(BOOL finished) {
        if (Completion) {
            Completion();
        }
    }];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(segmentedDropDownView:didSelectRowAtIndexPath:)]) {
            [self.delegate segmentedDropDownView:tableView didSelectRowAtIndexPath:indexPath];
        }
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setBackgroundColor:[UIColor grayColor]];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark 控件

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[[NSMutableArray alloc] initWithCapacity:3];
    }
    return _dataArray;
}
@end

//
//  ViewController.m
//  SegmentedDropDownList
//
//  Created by 杨贺 on 15/5/12.
//  Copyright (c) 2015年 yanghe. All rights reserved.
//

#import "ViewController.h"
#import "SegmentedDropDownView.h"

const static CGFloat kHeight = 44.0f;

@interface ViewController ()<SegmentedDropDownViewDelegate>
@property(nonatomic,strong)SegmentedDropDownView *segmentedDDV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    //声明一个3个分类的DropDownList
    SegmentedItem *item1 =[[SegmentedItem alloc] initWithTitle:@"我是1号" data:[NSArray arrayWithObjects:@"11",@"12",@"13",@"14",@"11",@"12",@"13",@"14",nil]];
    [item1 setTitleColor:[UIColor blackColor]];
    [item1 setBackgroundColor:[UIColor blueColor]];
    
    SegmentedItem *item2 =[[SegmentedItem alloc] initWithTitle:@"我是2号" data:[NSArray arrayWithObjects:@"21",@"22",@"23",@"24",@"21",@"22",@"23",@"24", nil]];
    [item2 setTitleColor:[UIColor blackColor]];
    [item2 setBackgroundColor:[UIColor redColor]];
    
    SegmentedItem *item3 =[[SegmentedItem alloc] initWithTitle:@"我是3号" data:[NSArray arrayWithObjects:@"31",@"32",@"33",@"34",@"31",@"32",@"33",@"34",nil]];
    [item3 setTitleColor:[UIColor blackColor]];
    [item3 setBackgroundColor:[UIColor yellowColor]];
    
    NSArray *array = [NSArray arrayWithObjects:item1,item2,item3, nil];
    
    self.segmentedDDV = [[SegmentedDropDownView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, kHeight) items:array];
    self.segmentedDDV.delegate = self;
    
    [self.view addSubview:self.segmentedDDV];
}

#pragma mark - SegmentedDropDownViewDelegate
-(void)segmentedDropDownView:(UITableView *)dropDownView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.segmentedDDV closeDropDownListWithCompletion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

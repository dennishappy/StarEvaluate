//
//  ViewController.m
//  StarEvaluate
//
//  Created by aidong on 16/3/22.
//  Copyright © 2016年 aidong. All rights reserved.
//

#import "ViewController.h"

#import "UIView+View.h"
#import "ZJD_StarEvaluateView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView *_tableView;
    
    NSInteger _starIndex1;
    NSInteger _starIndex2;
    NSInteger _starIndex3;
    NSInteger _starIndex4;
    NSInteger _starIndex5;
    
    NSString *_averageScore;
    
    NSMutableArray *_dataSource;
    
    BOOL _isCanEdit;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self layoutOtherView];
    
    [self initData];
}

#pragma mark - LayoutView
- (void)layoutOtherView{
    
    CGFloat BtnWidth = 64;
    CGFloat BtnHeight = 44;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width - 64, 20, BtnWidth, BtnHeight)];
    [btn setTitle:@"修改" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _tableView = [self layoutTableViewWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    [self.view addSubview:_tableView];
}

#pragma mark - initData
- (void)initData
{
    _starIndex1 = 3;
    _starIndex2 = 1;
    _starIndex3 = 4;
    _starIndex4 = 2;
    _starIndex5 = 5;
    
    _isCanEdit = NO;
    
    CGFloat score = _starIndex1 + _starIndex2 + _starIndex3 + _starIndex4 + _starIndex5;
    _averageScore = [NSString stringWithFormat:@"%.1f分",score / 5];
    
    _dataSource = [NSMutableArray new];

    NSArray *arr0 = @[@{@"title":@"星评"}];
    
    NSArray *arr1 = @[@{@"title":@"环境设施的配备"},
                      @{@"title":@"讲师与助教的配合"},
                      @{@"title":@"动手实践的比例"},
                      @{@"title":@"学生参与的程度"},
                      @{@"title":@"安全保障的水平"}];
    
    NSArray *arr2 = @[@{@"title":@"平均分"}];
    
    
    [_dataSource addObject:arr0];
    [_dataSource addObject:arr1];
    [_dataSource addObject:arr2];
}


// tableView
- (UITableView *)layoutTableViewWithFrame:(CGRect)frame{
    
    UITableView *tableView;
    tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.userInteractionEnabled = YES;
    tableView.delegate = self;
    tableView.dataSource = self;
    return tableView;
}
#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_dataSource count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    
    for (UIView *v in cell.contentView.subviews) {
        [v removeFromSuperview];
    }
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = (NSDictionary *)_dataSource[indexPath.section][indexPath.row];
    
    CGFloat LeftPadding = 170.f;
    UIFont *cellFont = [UIFont systemFontOfSize:17];
    UIColor *cellTextColor = [UIColor blackColor];
    cell.textLabel.text = dic[@"title"];
    
    if (indexPath.section == 0) {
        
    }
    else if (indexPath.section == 1) {
        
        NSInteger index = 0;
        if (indexPath.row == 0) {
            index = _starIndex1;
        } else if (indexPath.row == 1) {
            index = _starIndex2;
        } else if (indexPath.row == 2) {
            index = _starIndex3;
        } else if (indexPath.row == 3) {
            index = _starIndex4;
        } else if (indexPath.row == 4) {
            index = _starIndex5;
        }
        
        CGFloat starWidth = 20.f;
        CGFloat space = 5.f;
        BOOL isCanTap = _isCanEdit;
        ZJD_StarEvaluateView *starView = [[ZJD_StarEvaluateView alloc] initWithFrame:CGRectMake(LeftPadding, 0, self.view.width - LeftPadding, 44) starIndex:index starWidth:starWidth space:space defaultImage:nil lightImage:nil isCanTap:isCanTap];
        starView.starEvaluateBlock = ^(ZJD_StarEvaluateView * starView, NSInteger starIndex){
            
            if (indexPath.row == 0) {
                _starIndex1 = starIndex;
            } else if (indexPath.row == 1) {
                _starIndex2 = starIndex;
            } else if (indexPath.row == 2) {
                _starIndex3 = starIndex;
            } else if (indexPath.row == 3) {
                _starIndex4 = starIndex;
            } else if (indexPath.row == 4) {
                _starIndex5 = starIndex;
            }
            
            CGFloat score = _starIndex1 + _starIndex2 + _starIndex3 + _starIndex4 + _starIndex5;
            _averageScore = [NSString stringWithFormat:@"%.1f分",score / 5];
            
            // 更新平均分数
            UILabel *label = (UILabel *)[_tableView viewWithTag:10];
            label.text = _averageScore;
            
        };
        [cell.contentView addSubview:starView];
        
    } else if (indexPath.section == 2) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake( LeftPadding, 0, self.view.width - LeftPadding, 44)];
        label.tag = 10;
        label.font = cellFont;
        label.text = _averageScore;
        label.textColor = cellTextColor;
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:label];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - BtnAction
- (void)editBtnAction:(UIButton *)btn {
    
    _isCanEdit = !_isCanEdit;
    [_tableView reloadData];
}

#pragma mark - self
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

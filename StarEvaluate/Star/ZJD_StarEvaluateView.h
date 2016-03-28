//
//  ZJD_StarEvaluateView.h
//  KFXX
//
//  Created by aidong on 16/3/19.
//  Copyright © 2016年 aidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJD_StarEvaluateView : UIView

typedef void(^StarEvaluateBlock)(ZJD_StarEvaluateView *starView,NSInteger index);

// 点击星星后的Block ，返回当前视图，和当前点击的第几个星星（从1开始数）
@property (nonatomic, copy) StarEvaluateBlock starEvaluateBlock;

// 默认星星
@property (nonatomic, strong) UIImage *defaultImage;
// 亮的星星
@property (nonatomic, strong) UIImage *lightImage;

// 默认有五个星星
- (instancetype)initWithFrame:(CGRect)frame
                   totalStars:(NSInteger)totalStars
                    starIndex:(NSInteger)index
                    starWidth:(CGFloat)starWidth
                        space:(CGFloat)space
                 defaultImage:(UIImage *)defaultImage
                   lightImage:(UIImage *)lightImage
                     isCanTap:(BOOL)isCanTap;

// 默认有五个星星
- (instancetype)initWithFrame:(CGRect)frame
                    starIndex:(NSInteger)index
                    starWidth:(CGFloat)starWidth
                        space:(CGFloat)space
                 defaultImage:(UIImage *)defaultImage
                   lightImage:(UIImage *)lightImage
                     isCanTap:(BOOL)isCanTap;

@end

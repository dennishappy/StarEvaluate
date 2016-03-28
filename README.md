# StarEvaluate
五星星评

// 导入Star文件夹

// #import "UIView+View.h"
// #import "ZJD_StarEvaluateView.h"

// 创建视图
CGFloat starWidth = 20.f;     
CGFloat space = 5.f;  
BOOL isCanTap = YES;   
ZJD_StarEvaluateView *starView = [[ZJD_StarEvaluateView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44) starIndex:0 starWidth:starWidth space:space defaultImage:nil lightImage:nil isCanTap:isCanTap];
        
// 回调   
starView.starEvaluateBlock = ^(ZJD_StarEvaluateView * starView, NSInteger starIndex){   
        NSLog(@"%d",starIndex);   
        };

// 详细使用情况请见代码。

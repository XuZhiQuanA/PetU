//
//  FirstPageScrollView.m
//  Pet
//
//  Created by 徐智全 on 2020/5/4.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "FirstPageScrollView.h"

@interface FirstPageScrollView()

@property(weak,nonatomic) NSTimer *timer;

@property(weak,nonatomic) UIPageControl *pageControl;

@property(weak,nonatomic) UIScrollView *lunboScrollView;

@end

@implementation FirstPageScrollView

static NSInteger currentPage = -1;

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        //配置
        [self loadMessage];
        
        //初始化NSTimer
        [self loadTimer];
    }
    
    return self;
    
}



- (void)loadMessage{
    
    self.frame = [UIScreen mainScreen].bounds;
//    self.backgroundColor = [UIColor yellowColor];
    
    //自上而下
    
    //加载第一个子控件
    UIImageView *firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 382)];
    firstImageView.backgroundColor = [UIColor redColor];
    firstImageView.image = [UIImage imageNamed:@"FirstPage_firstImage"];

    [self addSubview:firstImageView];

    //第二个按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(255, 261, 120, 110)];
    [btn addTarget:self action:@selector(jiYang) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"FirstPage_buttonImage"] forState:UIControlStateNormal];
    [self addSubview:btn];
    
//    //xib做一下试试 后面再说吧
//    NSArray * xibArray = [[NSBundle mainBundle] loadNibNamed:@"FirstPageScrollView" owner:nil options:nil];
//    UIView *xibView = xibArray[0];
//    xibView.frame = CGRectMake(0, 44, self.bounds.size.width, 1024);
//    [self addSubview: xibView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(72, 419, 60, 19)];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(229, 419, 60, 19)];
    
    
    label1.text = @"申请家庭";
    [label1 sizeToFit];
    label2.text = @"宠物领养";
    [label2 sizeToFit];
    
    [self addSubview:label1];
    [self addSubview:label2];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(156, 409, 38, 38)];
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(313, 413, 31, 34)];
    [btn1 setImage:[UIImage imageNamed:@"FirstPage_petFamily"] forState:UIControlStateNormal];
//    [image1 setImage:[UIImage imageNamed:@"FirstPage_petFamily"]];
//    [image2 setImage:[UIImage imageNamed:@"FirstPage_petIn"]];
    [btn2 setImage:[UIImage imageNamed:@"FirstPage_petIn"] forState:UIControlStateNormal];
    
    [btn1 addTarget:self action:@selector(applyForFamily) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(takeCareOfPet) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn1];
    [self addSubview:btn2];
    
    //轮播图
    UIScrollView *lunboScrollView = ({
        
        UIScrollView *lunboScrollView = [[UIScrollView alloc] init];
        CGRect frame = CGRectMake(50, 475, 335, 118);
        
        lunboScrollView.center = CGPointMake(self.bounds.size.width * 0.5, 475 + 141 * 0.5);
        [self addSubview:lunboScrollView];
        
        lunboScrollView.frame = CGRectMake(50, 475, 335, 141);
        lunboScrollView.contentSize = CGSizeMake(frame.size.width*4, 0);
        lunboScrollView.pagingEnabled = YES;
        lunboScrollView.showsHorizontalScrollIndicator = false;
//        lunboScrollView.backgroundColor = [UIColor redColor];
        
        //加入四张图片
        
        for (NSInteger i = 0; i < 4; i++) {
            
            UIButton *btn = [[UIButton alloc] init];
            [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            
            btn.frame = CGRectMake(i*frame.size.width, 0, frame.size.width, frame.size.height);
            
            switch (i) {
                case 0:
                    [btn setImage:[UIImage imageNamed:@"FirstPage_lunbo_1"] forState:UIControlStateNormal];
                    break;
                
                case 1:
                    [btn setImage:[UIImage imageNamed:@"FirstPage_lunbo_2"] forState:UIControlStateNormal];
                    break;
                    
                case 2:
                    [btn setImage:[UIImage imageNamed:@"FirstPage_lunbo_1"] forState:UIControlStateNormal];
                    break;
                    
                case 3:
                    [btn setImage:[UIImage imageNamed:@"FirstPage_lunbo_2"] forState:UIControlStateNormal];
                    break;
                    
                default:
                    break;
            }
            
            [lunboScrollView addSubview:btn];
        }
        
        
        
        lunboScrollView;
    });
    
    self.lunboScrollView = lunboScrollView;
    
    
//    CGRect frame = CGRectMake(50, 519, 335, 118);
    
    //UIPageControl
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.center = CGPointMake(lunboScrollView.frame.origin.x+lunboScrollView.frame.size.width*0.5, lunboScrollView.frame.origin.y + lunboScrollView.frame.size.height*0.9);
    pageControl.numberOfPages = 4;
    self.pageControl = pageControl;
    

    [self addSubview:pageControl];
    
    
    //精选
    UILabel *label_1 = [[UILabel alloc] init];
    label_1.text = @"精选";
    [label_1 sizeToFit];
    label_1.textColor = [UIColor blackColor];
    label_1.center = CGPointMake(self.bounds.size.width*0.5, self.lunboScrollView.frame.origin.y+self.lunboScrollView.frame.size.height+40);
    
    [self addSubview:label_1];
    
    //下面的线条
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(self.lunboScrollView.frame.origin.x+50, label_1.frame.origin.y+10, 150, 2)];
    view1.center = CGPointMake(self.bounds.size.width*0.5, label_1.center.y + label_1.bounds.size.height);
    view1.backgroundColor = [UIColor blackColor];
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 6)];
    view2.center = view1.center;
    view2.backgroundColor = [UIColor yellowColor];
    [self addSubview:view2];
    
    //最下面的按钮
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.lunboScrollView.frame.origin.x, CGRectGetMaxY(view2.frame) + 30, self.lunboScrollView.bounds.size.width, 300)];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"FirstPage_bottomBtnImage"] forState:UIControlStateNormal];
    [self addSubview:bottomBtn];
    
    [bottomBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(bottomBtn.frame));
    
}

- (void)loadTimer{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(switchImage) userInfo:nil repeats:YES];
    self.timer = timer;
    NSLog(@"%@",self.timer);
    NSRunLoop *mainRunloop = [NSRunLoop currentRunLoop];
    [mainRunloop addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)switchImage{
    
    currentPage++;
    if (currentPage == 4) {
        currentPage = 0;
    }
    
    self.pageControl.currentPage = currentPage;
    
    [self.lunboScrollView setContentOffset:CGPointMake(currentPage*self.lunboScrollView.bounds.size.width, 0) animated:YES];
    
    
}

- (void)btnClick{
    NSLog(@"btnClick");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"popClickLunboView" object:nil];
    
}

- (void)jiYang{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JiYang" object:nil];
}

- (void)applyForFamily{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"applyForFamily" object:nil];
    
}

- (void)takeCareOfPet{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"takeCareOfPet" object:nil];
}

@end

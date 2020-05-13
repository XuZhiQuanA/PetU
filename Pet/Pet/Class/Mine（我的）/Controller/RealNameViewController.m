//
//  RealNameViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/5.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "RealNameViewController.h"

@interface RealNameViewController ()

@end

@implementation RealNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //
    [self loadScrollView];
    
}

- (void)loadScrollView{
    
    //
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 806)];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 875);
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, 753)];
    imageV.image = [UIImage imageNamed:@"RealName_1"];
    [scrollView addSubview:imageV];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(45, 775, 325 , 37)];
    [btn setImage:[UIImage imageNamed:@"Personal_6"] forState:UIControlStateNormal];
    [scrollView addSubview:btn];
    
}

@end

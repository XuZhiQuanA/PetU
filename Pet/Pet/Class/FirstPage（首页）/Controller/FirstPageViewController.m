//
//  FirstPageViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/4.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "FirstPageViewController.h"
#import "FirstPageScrollView.h"
#import "ClickLunboViewController.h"
#import "JiYangViewController.h"
#import "ApplyViewController.h"

@interface FirstPageViewController ()

@property(weak,nonatomic) FirstPageScrollView *scrollView;

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"First");
    
    //添加一个scrollview
    [self loadScrollView];
    
    //
    [self loadObserver];
}

- (void)loadObserver{
    //popClickLunboView
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popClickLunboView) name:@"popClickLunboView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(JiYang) name:@"JiYang" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applyForFamily) name:@"applyForFamily" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(takeCareOfPet) name:@"takeCareOfPet" object:nil];
}

- (void)loadScrollView{
    
    FirstPageScrollView *scrollView = [[FirstPageScrollView alloc] init];
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    
}

- (void)popClickLunboView{
    
    [self presentViewController:[ClickLunboViewController new] animated:YES completion:nil];
    
}

- (void)JiYang{
    [self presentViewController:[JiYangViewController new] animated:YES completion:nil];
}

- (void)applyForFamily{
    [self presentViewController:[ApplyViewController new] animated:YES completion:nil];
}

- (void)takeCareOfPet{
    
}


@end

//
//  LRViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/5.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "LRViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "PetTabbarController.h"


@interface LRViewController ()

@property(weak,nonatomic) UIScrollView *scrollView;

@end

@implementation LRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.构建scrollview - 内部包含登陆和注册界面
    [self loadLRScrollView];
    
    //2.接收通知
    [self observer];
}

- (void)loadLRScrollView{
    
    //1.
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scrollview;
    
    scrollview.contentSize = CGSizeMake(2*self.view.bounds.size.width, self.view.bounds.size.height);
    scrollview.scrollEnabled = false;
    
    [self.view addSubview:scrollview];
    
    //2.加载view
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self addChildViewController:loginVC];
    loginVC.view.frame = self.view.bounds;
    [scrollview addSubview:loginVC.view];
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    registerVC.view.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [scrollview addSubview:registerVC.view];
    [self addChildViewController:registerVC];
    
    
}

- (void)observer{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerIB) name:@"registerIB" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginIB) name:@"loginIB" object:nil];
    //loginAction
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login) name:@"loginAction" object:nil];
}

- (void)registerIB{
    
    [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:YES];
}

- (void)loginIB{
    
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

- (void)login{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[PetTabbarController alloc] init];
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

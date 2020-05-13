//
//  LoginViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/5.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//点击注册按钮
- (IBAction)registerAction:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"registerIB" object:nil];
    
    
}
- (IBAction)loginAction:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginAction" object:nil];
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

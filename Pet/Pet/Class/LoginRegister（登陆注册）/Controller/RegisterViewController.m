//
//  RegisterViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/5.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//直接登陆
- (IBAction)getMa:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginAction" object:nil];
    
}

//跳到登陆界面
- (IBAction)login:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginIB" object:nil];
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

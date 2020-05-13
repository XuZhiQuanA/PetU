//
//  MineViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/4.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "MineViewController.h"
#import "PersonalViewController.h"
#import "RealNameViewController.h"
#import "LRViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController
- (IBAction)personalAction:(id)sender {
    [self presentViewController:[PersonalViewController new] animated:YES completion:nil];
}
- (IBAction)shiming:(id)sender {
    [self presentViewController:[RealNameViewController new] animated:YES completion:nil];
}

- (IBAction)resigin:(id)sender {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [LRViewController new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Mine");
    self.view.frame = [UIScreen mainScreen].bounds;
}



@end

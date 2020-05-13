//
//  PetTabbarController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/4.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "PetTabbarController.h"
#import "FirstPageViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"

@interface PetTabbarController ()



@end

@implementation PetTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"PetTabbarController");
    
    //1.加载子控制器并配置tabbarItem信息
    [self loadChildVC];
    
    NSLog(@"--%f",self.view.bounds.size.height);
    
}

- (void)loadChildVC{
    
    //首页
    FirstPageViewController *firstPageVC = [[FirstPageViewController alloc] init];
    firstPageVC.view.tag = 1;
    
    //配置
    [self setBadgeMessage:firstPageVC value:firstPageVC.view.tag];
    
    //默认将首页view添加到视图中
    firstPageVC.view.frame = [UIScreen mainScreen].bounds;
    
    //添加
    [self addChildViewController: firstPageVC];
    [self.view addSubview:firstPageVC.view];
    
    //发现
    NSInteger discoverFlag = 2;
    DiscoverViewController *discoverVC = [DiscoverViewController new];
//    discoverVC.view.tag = 2;
    [self setBadgeMessage:discoverVC value:discoverFlag];
    [self addChildViewController:discoverVC];
    
    NSInteger mineFlag = 3;
    //我的
    MineViewController *mineVC = [MineViewController new];
//    mineVC.view.tag = 3;
    [self setBadgeMessage:mineVC value:mineFlag];
    [self addChildViewController:mineVC];
    
}

//设置tabbar上的东西
- (void)setBadgeMessage:(UIViewController *)vc value:(NSInteger)value{
    
    
    NSLog(@"%ld",value);
    NSString *title = @"";
    NSString *imageName = @"";
    NSString *imageSelectedName = @"";
    switch (value) {
        case 1:
            title = @"首页";
            imageName = @"firstPage";
            imageSelectedName = @"firstPage_selected";
            break;
        
        case 2:
        title = @"发现";
        imageName = @"discover";
        imageSelectedName = @"discover_selected";
        break;
            
        case 3:
        title = @"我的";
        imageName = @"mine";
        imageSelectedName = @"mine_selected";
        break;
            
        default:
            break;
    }
    
    vc.tabBarItem.title = title;

    vc.tabBarItem.image = [self clipImageWithName:imageName];
    vc.tabBarItem.image = [vc.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [self clipImageWithName:imageSelectedName];
    vc.tabBarItem.selectedImage = [vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    //设置选中文字颜色为黑色
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [vc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

}

- (UIImage *)clipImageWithName:(NSString *)imageName{
    
    CGSize size = CGSizeMake(25, 25);

    UIGraphicsBeginImageContext(size);
    
    UIImage *image1 = [UIImage imageNamed:imageName];

    [image1 drawInRect:CGRectMake(0, 0, size.width, size.height)];
    [image1 drawInRect:CGRectMake(0, 0, size.width, size.height) blendMode:kCGBlendModeHue alpha:1];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return newImage;
    
    
}

@end

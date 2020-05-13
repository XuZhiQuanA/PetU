//
//  ClickLunboViewController.m
//  Pet
//
//  Created by 徐智全 on 2020/5/5.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "ClickLunboViewController.h"

@interface ClickLunboViewController ()

@end

@implementation ClickLunboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setScrollView];
    
    //popClickLunboView
    
}

- (void)setScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"ClickLunbo_1"];
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 6228 / 1080 * 1.0);
    
    //1080 × 6228
    
    
    [scrollView addSubview:imageView];
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, imageView.bounds.size.height);
    
    [self.view addSubview:scrollView];
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

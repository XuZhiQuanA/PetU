//
//  ClickLunboView.m
//  Pet
//
//  Created by 徐智全 on 2020/5/5.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "ClickLunboView.h"

@implementation ClickLunboView

- (instancetype)init{
    self = [super init];
    
    if (self) {
        [self setScrollView];
    }
    
    return self;
}

- (void)setScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = [UIImage imageNamed:@"ClickLunbo_1"];
    
    [scrollView sizeToFit];
    [scrollView addSubview:imageView];
    
    [self addSubview:scrollView];
}

@end

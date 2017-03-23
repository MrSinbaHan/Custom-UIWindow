//
//  AlertWindow.m
//  UIWindow
//
//  Created by 韩潇雨 on 2017/3/23.
//  Copyright © 2017年 sinbahan. All rights reserved.
//

#import "AlertWindow.h"
@interface AlertWindow()
@property(nonatomic,strong)UIView *contentView;
@end
static AlertWindow *singleInstance;

@implementation AlertWindow

-(instancetype)init
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        self.windowLevel = UIWindowLevelAlert - 1;
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 80, 200)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView setCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height /2 )];
        [self addSubview:_contentView];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _contentView.frame.size.width, 150)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"show the window";
        label.textColor = [UIColor blackColor];
        [_contentView addSubview:label];
        
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, 149, _contentView.frame.size.width, 1)];
        line.backgroundColor = [UIColor blackColor];
        [_contentView addSubview:line];
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 150, _contentView.frame.size.width, 50);
        [button setTitle:@"Done" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(hideWithAnimation) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:button];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideWithAnimation)];
        [self addGestureRecognizer:tap];
        
        UITapGestureRecognizer *other = [[UITapGestureRecognizer alloc] init];
        [_contentView addGestureRecognizer:other];
        
        singleInstance = self;
        
    }
    return self;
}

-(void)hideWithAnimation
{
    [self hideWithAnimation:YES];
}

- (void)showWithAnimation:(BOOL)animation
{
    [self makeKeyAndVisible];
    
    [UIView animateWithDuration:animation ? 0.3 : 0
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void)hideWithAnimation:(BOOL)animation
{
    [UIView animateWithDuration:animation ? 0.3 : 0
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         singleInstance = nil;
                     }];
}

- (void)dealloc
{
    [self resignKeyWindow];
}

@end

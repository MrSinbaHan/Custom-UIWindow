//
//  ViewController.m
//  UIWindow
//
//  Created by 韩潇雨 on 2017/3/23.
//  Copyright © 2017年 sinbahan. All rights reserved.
//

#import "ViewController.h"
#import "AlertWindow.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)showTheWindow:(id)sender {
    AlertWindow * window = [[AlertWindow alloc] init];
    [window showWithAnimation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

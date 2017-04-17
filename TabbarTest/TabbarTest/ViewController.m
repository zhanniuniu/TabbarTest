//
//  ViewController.m
//  TabbarTest
//
//  Created by 战立军 on 2017/4/14.
//  Copyright © 2017年 战立军. All rights reserved.
//

#import "ViewController.h"
#import "TabbarOne.h"
#import "TabbarTwo.h"
#import "TabbarThree.h"
#import "TabbarFour.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 100, (self.view.frame.size.width-30*3)/2, 50);
    [btn setTitle:@"仿qq空间" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(CGRectGetMaxX(btn.frame)+30, 100, (self.view.frame.size.width-30*3)/2, 50);
    [btn1 setTitle:@"仿闲鱼" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(button2Press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(30, CGRectGetMaxY(btn.frame)+30, (self.view.frame.size.width-30*3)/2, 50);
    [btn2 setTitle:@"寻常脉脉" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(button3Press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(CGRectGetMaxX(btn2.frame)+30, CGRectGetMaxY(btn.frame)+30, (self.view.frame.size.width-30*3)/2, 50);
    [btn3 setTitle:@"超多tabbar" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor redColor];
    [btn3 addTarget:self action:@selector(button4Press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPress
{
    [self presentViewController:[[TabbarOne alloc] init] animated:NO completion:nil];
}
- (void)button2Press
{
    [self presentViewController:[[TabbarTwo alloc] init] animated:NO completion:nil];
}
- (void)button3Press
{
    [self presentViewController:[[TabbarThree alloc] init] animated:NO completion:nil];
}
- (void)button4Press
{
    [self presentViewController:[[TabbarFour alloc] init] animated:NO completion:nil];
}



@end

//
//  TabbarFour.m
//  TabbarTest
//
//  Created by 战立军 on 2017/4/14.
//  Copyright © 2017年 战立军. All rights reserved.
//

#import "TabbarFour.h"
#import "VVgaojiVC.h"

#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface TabbarFour ()<UITabBarControllerDelegate>

@end

@implementation TabbarFour

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    UIViewController *c1=[[UIViewController alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.view.backgroundColor=[UIColor greenColor];
    c1.tabBarItem.title=@"首页";
    c1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_feeds_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c1.tabBarItem.image=[UIImage imageNamed:@"tab_feeds_normal"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 100, (self.view.frame.size.width-30*3)/2, 50);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(backbuttonPress) forControlEvents:UIControlEventTouchUpInside];
    [c1.view addSubview:btn];
    
    
    //    c1.tabBarItem.badgeValue=@"";
    //    c1.tabBarItem.
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor grayColor];
    c2.view.backgroundColor=[UIColor greenColor];
    c2.tabBarItem.title=@"消息";
    c2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c2.tabBarItem.image=[UIImage imageNamed:@"tab_message_normal"];
    //    c2.tabBarItem.badgeValue=@"123";
    
    
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.view.backgroundColor=[UIColor grayColor];
    c3.view.backgroundColor=[UIColor greenColor];
    c3.tabBarItem.title=@"消息";
    c3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c3.tabBarItem.image=[UIImage imageNamed:@"tab_message_normal"];
    
    
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.view.backgroundColor=[UIColor grayColor];
    c4.view.backgroundColor=[UIColor greenColor];
    c4.tabBarItem.title=@"人脉办事";
    c4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_contacts_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c4.tabBarItem.image=[[UIImage imageNamed:@"tab_contacts_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    c4.tabBarItem.badgeValue=@"123";
    
    UIViewController *c5=[[UIViewController alloc]init];
    c5.view.backgroundColor=[UIColor grayColor];
    c5.view.backgroundColor=[UIColor greenColor];
    c5.tabBarItem.title=@"我";
    c5.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_myself_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c5.tabBarItem.image=[UIImage imageNamed:@"tab_myself_normal"];
    
    UIViewController *c6=[[UIViewController alloc]init];
    c6.view.backgroundColor=[UIColor grayColor];
    c6.view.backgroundColor=[UIColor greenColor];
    c6.tabBarItem.title=@"我";
    c6.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_myself_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c6.tabBarItem.image=[UIImage imageNamed:@"tab_myself_normal"];
    
    //    c5.tabBarItem.badgeValue=@"1";
    
    //  255 190 76
    
    self.tabBar.tintColor = Color(0, 188, 249);
    self.viewControllers = @[c1,c2,c3,c4,c5,c6];
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_bg"]];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark   返回

- (void)backbuttonPress
{
    VVgaojiVC *vv = [[VVgaojiVC alloc] init];
    vv.hidesBottomBarWhenPushed = YES;
    
//    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark tabbar

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"### %@",viewController.tabBarItem.title);
    
    
}


@end

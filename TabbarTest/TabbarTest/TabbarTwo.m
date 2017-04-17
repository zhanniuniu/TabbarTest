//
//  TabbarTwo.m
//  TabbarTest
//
//  Created by 战立军 on 2017/4/14.
//  Copyright © 2017年 战立军. All rights reserved.
//

#import "TabbarTwo.h"

#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface TabbarTwo ()<UITabBarControllerDelegate>
{
    UIButton *button;//中间的button
    UIView *backView;//弹出页
    UIButton *btnbacke;//弹出页的button
}


@end

@implementation TabbarTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate=self;
    
    UIViewController *c1=[[UIViewController alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.view.backgroundColor=[UIColor greenColor];
    c1.tabBarItem.title=@"闲鱼";
    c1.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c1.tabBarItem.image=[UIImage imageNamed:@"home_normal"];
    
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
    c2.tabBarItem.title=@"鱼塘";
    c2.tabBarItem.selectedImage = [[UIImage imageNamed:@"fishpond_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c2.tabBarItem.image=[UIImage imageNamed:@"fishpond_normal"];
    //    c2.tabBarItem.badgeValue=@"123";
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.view.backgroundColor=[UIColor grayColor];
    c3.view.backgroundColor=[UIColor yellowColor];
    c3.tabBarItem.title=@"发布";
    //    c3.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 20);
    //    c3.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //    c3.tabBarItem.image=[UIImage imageNamed:@"tabbar_btn"];
    //    c3.tabBarItem.badgeValue=@"123";
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.view.backgroundColor=[UIColor grayColor];
    c4.view.backgroundColor=[UIColor greenColor];
    c4.tabBarItem.title=@"消息";
    c4.tabBarItem.selectedImage = [[UIImage imageNamed:@"message_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c4.tabBarItem.image=[[UIImage imageNamed:@"message_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    c4.tabBarItem.badgeValue=@"123";
    
    UIViewController *c5=[[UIViewController alloc]init];
    c5.view.backgroundColor=[UIColor grayColor];
    c5.view.backgroundColor=[UIColor greenColor];
    c5.tabBarItem.title=@"我的";
    c5.tabBarItem.selectedImage = [[UIImage imageNamed:@"account_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c5.tabBarItem.image=[UIImage imageNamed:@"account_normal"];
    //    c5.tabBarItem.badgeValue=@"1";
    
    //  255 190 76
    
    self.tabBar.tintColor = Color(255, 190, 76);
    self.viewControllers = @[c1,c2,c3,c4,c5];
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_bg"]];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;
    
    [self setup];
    [self addCenterButton];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//####################中间button#########################

#pragma mark - 添加中间模块
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    button.adjustsImageWhenHighlighted=NO;
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGPoint center = self.tabBar.center;
        center.y = center.y - buttonImage.size.height*0.4;
    NSLog(@"￥￥￥￥  %f",center.y);
    button.center = center;
    [self.view addSubview:button];
}
/**
 中间button按下
 
 @param sender 中间button
 */
-(void)pressChange:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view addSubview:backView];
        [UIView animateWithDuration:0.3 animations:^{
             btnbacke.transform=CGAffineTransformMakeRotation(M_PI*0.25);
        } completion:^(BOOL finished) {
            
        }];
    }];
    
    
   
}


/**
 添加按钮
 */
-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage:[UIImage imageNamed:@"post_normal"] selectedImage:[UIImage imageNamed:@""]];
    self.delegate=self;
}

#pragma mark- TabBar Delegate
//  换页和button的状态关联上
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if(viewController == [tabBarController.viewControllers objectAtIndex:2]){
        return NO;
    }else {
        return YES;
    }
}

#pragma mark 中间页相关

- (void)addCenterButton
{
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIApplication sharedApplication].windows[0].frame.size.height, [UIApplication sharedApplication].windows[0].frame.size.height)];
    backView.backgroundColor = [UIColor yellowColor];
    backView.alpha = 0.95;
    
    
    UIImage *image = [UIImage imageNamed:@"post_animate_add"];

    
    btnbacke = [UIButton buttonWithType:UIButtonTypeCustom];
    btnbacke.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    CGPoint center = self.tabBar.center;
    center.y = center.y - image.size.height*0.4+5;
    
    NSLog(@"####web  %f",center.y);
    btnbacke.center = center;
    
    [btnbacke setImage:image forState:UIControlStateNormal];
    btnbacke.adjustsImageWhenHighlighted = NO;
    [btnbacke addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:btnbacke];
}

- (void)buttonPress
{
    
    [UIView animateWithDuration:0.3 animations:^{
        btnbacke.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
         [backView removeFromSuperview];
    }];
    
}

#pragma mark   返回

- (void)backbuttonPress
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end

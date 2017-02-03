//
//  ViewController.m
//  CXLayout
//
//  Created by chuxiao on 2017/2/3.
//  Copyright © 2017年 chuxiao. All rights reserved.
//

#import "ViewController.h"
#import "CXLayout.h"

@interface ViewController ()
@property (nonatomic, strong)UIView * redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createUI{
    CGFloat ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIButton *button = [UIButton new];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Update Constraints" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(updateConstraints) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    _redView = redView;
    
    /**
        add constraints
     */
    [button CX_AutoLayout:^(CXLayoutManager *mgr) {
        mgr.Equal_width(nil,CX_Default,200).height(CX__Default,44).center(CGPointMake(0, - ScreenHeight/2 + 80));
    }];
    
    [greenView CX_AutoLayout:^(CXLayoutManager *mgr){
        mgr.Equal_left(button.left,CX_Default,0).width(CX__Default,100).height(CX__Default,50).top(button.bottom,CX_Default,50);
    }];
    
    [redView CX_AutoLayout:^(CXLayoutManager *mgr) {
        mgr.equal.size(CGSizeMake(150, 150)).left(CX_Equal(greenView.left)).top(CX__Default,250);
    }];
    
}

// update constraints
- (void)updateConstraints{
    static int i = 0;
    
    CGSize size;
    if (i == 0) {
        size = CGSizeMake(100, 50);
        i = 1;
    }else{
        size = CGSizeMake(150, 150);
        i = 0;
    }
    
    [_redView CX_AutoLayoutUpdate:^(CXLayoutManager *mgr) {
        mgr.equal.size(size);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

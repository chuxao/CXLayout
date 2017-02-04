# CXLayout

类似Masonry的自动布局，但比Masonry用起来更加简单，只需要一行代码就能搞定约束。拥有添加约束、更新约束等常用功能。
使用方法：
Step 1：添加控件
    UIView *greenView = UIView.new;
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
Step 2:添加约束
    [greenView CX_AutoLayout:^(CXLayoutManager *mgr) {
        mgr.Equal_width(nil,CX_Default,200).height(CX__Default,44).center(CGPointMake(0, - ScreenHeight/2 + 80));
    }];

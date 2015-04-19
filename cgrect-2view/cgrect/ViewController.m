//
//  ViewController.m
//  cgrect
//
//  Created by macbook on 2014/09/10.
//  Copyright (c) 2014年 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    /*
    // UIViewクラスをサイズを指定して生成
    MyDrawView *drawView = [[MyDrawView alloc] initWithFrame:self.view.bounds];
    
    // レイヤの設定
    CALayer *layer1 = [CALayer layer];
    layer1.backgroundColor = [UIColor clearColor].CGColor;
    layer1.frame = self.view.layer.bounds;
    // レイヤをサブビューへ追加
    //[drawView.layer addSublayer:layer1];
    // サブビューの追加
    [self.view addSubview:drawView];
    */
    AnimationView *animeView = [[AnimationView alloc] initWithFrame:self.view.bounds];
    // サブビューの追加
    [self.view addSubview:animeView];
    // animeViewを最前面へ
    [self.view bringSubviewToFront:animeView];
    // ラベル
    UILabel *explanLabel = [[UILabel alloc] init];
    explanLabel.frame = CGRectMake(10, 300, 300, 50);
    explanLabel.backgroundColor = [UIColor clearColor];
    explanLabel.textColor = [UIColor blackColor];
    explanLabel.font = [UIFont fontWithName:@"AvenirNext-Italic" size:14];
    explanLabel.textAlignment = NSTextAlignmentLeft;
    explanLabel.text = @"touch black and remove all Othello.";
    [self.view addSubview:explanLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

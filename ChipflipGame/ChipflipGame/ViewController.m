//
//  ViewController.m
//  ChipflipGame
//
//  Created by macbook on 2015/04/20.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    DrawingView *drawView = [[DrawingView alloc] initWithFrame:self.view.bounds];
    // サブビューの追加
    [self.view addSubview:drawView];
    // animeViewを最前面へ
    [self.view bringSubviewToFront:drawView];
    
    // ラベルを作成
    UILabel *explainLabel1 = [[UILabel alloc] init];
    explainLabel1.frame = CGRectMake(10, 300, 150, 30);
    explainLabel1.backgroundColor = [UIColor clearColor];
    explainLabel1.textColor = [UIColor blackColor];
    explainLabel1.font = [UIFont fontWithName:@"AvenirNext-Italic" size:20];
    explainLabel1.textAlignment = NSTextAlignmentLeft;
    explainLabel1.text = @"Touch black and";
    UILabel *explainLabel2 = [[UILabel alloc] init];
    explainLabel2.frame = CGRectMake(100, 330, 250, 30);
    explainLabel2.backgroundColor = [UIColor clearColor];
    explainLabel2.textColor = [UIColor blackColor];
    explainLabel2.font = [UIFont fontWithName:@"AvenirNext-Italic" size:20];
    explainLabel2.textAlignment = NSTextAlignmentLeft;
    explainLabel2.text = @"remove all Reversi's chip.";
    // ボタンを作成
    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetBtn.center = CGPointMake(150, 250);
    [resetBtn setBackgroundColor:[UIColor whiteColor]];
    [resetBtn.layer setShadowOpacity:1.0f];
    [resetBtn setTitle:@"Reset"
              forState:UIControlStateNormal];
    [resetBtn sizeToFit];
    [resetBtn addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    // ボタンとラベルをビューに追加
    //[self.view addSubview:resetBtn];
    [self.view addSubview:explainLabel1];
    [self.view addSubview:explainLabel2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// ボタンの動作
- (void)button_Tapped:(id)sender
{
    // リロード
}


@end

//
//  DrawingView.h
//  ChipflipGame
//
//  Created by macbook on 2015/04/20.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView

// オセロの丸表示位置
@property NSArray *cgrectArr;
// オセロの状態[0:白,1:黒,2:なし]
@property NSMutableArray *isBlack;
@property int BEGIN_CHIP_NUM;
@property int BEGIN_BLACK_NUM;

@end

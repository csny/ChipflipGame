//
//  AnimationView.h
//  cgrect
//
//  Created by macbook on 2014/09/13.
//  Copyright (c) 2014年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationView : UIView

// オセロの丸表示位置
@property NSArray *cgrectArr;
// オセロの状態{0:白,1:黒,2:なし}
@property NSMutableArray *isBlack;

@end

//
//  DrawingView.m
//  ChipflipGame
//
//  Created by macbook on 2015/04/20.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    // チップ総数と黒オセロの初期数
    _BEGIN_CHIP_NUM=12;
    _BEGIN_BLACK_NUM=7;
    
    // 丸の座標を配列へ格納
    NSValue *val0,*val1,*val2,*val3,*val4,*val5,*val6,*val7,*val8,*val9,*val10,*val11;
    val0 = [NSValue valueWithCGRect:CGRectMake(1, 51, 48, 48)];
    val1 = [NSValue valueWithCGRect:CGRectMake(51, 51, 48, 48)];
    val2 = [NSValue valueWithCGRect:CGRectMake(101, 51, 48, 48)];
    val3 = [NSValue valueWithCGRect:CGRectMake(151, 51, 48, 48)];
    val4 = [NSValue valueWithCGRect:CGRectMake(201, 51, 48, 48)];
    val5 = [NSValue valueWithCGRect:CGRectMake(251, 51, 48, 48)];
    val6 = [NSValue valueWithCGRect:CGRectMake(1, 101, 48, 48)];
    val7 = [NSValue valueWithCGRect:CGRectMake(51, 101, 48, 48)];
    val8 = [NSValue valueWithCGRect:CGRectMake(101, 101, 48, 48)];
    val9 = [NSValue valueWithCGRect:CGRectMake(151, 101, 48, 48)];
    val10 = [NSValue valueWithCGRect:CGRectMake(201, 101, 48, 48)];
    val11 = [NSValue valueWithCGRect:CGRectMake(251, 101, 48, 48)];
    _cgrectArr = @[val0,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11];
    
    // オセロの並びの配列初期化
    int blackNum = _BEGIN_BLACK_NUM; // 黒オセロの残数
    _isBlack=[NSMutableArray array];
    for(int i=0;i<_BEGIN_CHIP_NUM;i++){
        if (_BEGIN_CHIP_NUM-i==blackNum){
            // 黒が使い切れない場合
            _isBlack[i]=[NSNumber numberWithInteger:1];
            blackNum--;
            //NSLog(@"1");
        } else if(blackNum>0) {
            // 白黒シャッフルで代入
            //NSLog(@"randum");
            int randVlaue=arc4random_uniform(2);
            switch (randVlaue) {
                case 0:
                    _isBlack[i]=[NSNumber numberWithInteger:randVlaue];
                    break;
                default:
                    _isBlack[i]=[NSNumber numberWithInteger:randVlaue];
                    blackNum--;
                    break;
            }
        } else {
            // 黒を使い切った場合
            _isBlack[i]=[NSNumber numberWithInteger:0];
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 描画管理の構造体contextを初期化
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 色を定義
    CGFloat white[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    CGFloat black[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGFloat cyan[4] = {0.5f, 0.8f, 1.0f, 1.0f};
    
    // グリッドを描画
    CGContextSetStrokeColor(context, cyan);
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, .5f);
    for (int y = 50; y < self.bounds.size.height; y+=50) {
        CGContextMoveToPoint(context, 0, y);
        CGContextAddLineToPoint(context, self.bounds.size.width, y);
    }
    for (int x = 50; x < self.bounds.size.width; x+=50) {
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x, self.bounds.size.height);
    }
    CGContextStrokePath(context);
    
    // フラグに応じて円を描画
    for(int i=0;i<_BEGIN_CHIP_NUM;i++){
        NSValue *tempRect = [_cgrectArr objectAtIndex:i];
        int i_val = [[_isBlack objectAtIndex:i] intValue];
        switch (i_val) {
            case 0:
                // 白
                CGContextSetFillColor(context, white);
                CGContextFillEllipseInRect(context, [tempRect CGRectValue]);
                break;
            case 1:
                // 黒
                CGContextSetFillColor(context, black);
                CGContextFillEllipseInRect(context, [tempRect CGRectValue]);
                break;
            default:
                // なし
                break;
        }
    }
    
    // 成功判定
    int i_val0 = [[_isBlack objectAtIndex:0] intValue];
    int i_val1 = [[_isBlack objectAtIndex:1] intValue];
    int i_val2 = [[_isBlack objectAtIndex:2] intValue];
    int i_val3 = [[_isBlack objectAtIndex:3] intValue];
    int i_val4 = [[_isBlack objectAtIndex:4] intValue];
    int i_val5 = [[_isBlack objectAtIndex:5] intValue];
    int i_val6 = [[_isBlack objectAtIndex:6] intValue];
    int i_val7 = [[_isBlack objectAtIndex:7] intValue];
    int i_val8 = [[_isBlack objectAtIndex:8] intValue];
    int i_val9 = [[_isBlack objectAtIndex:9] intValue];
    int i_val10 = [[_isBlack objectAtIndex:10] intValue];
    int i_val11 = [[_isBlack objectAtIndex:11] intValue];
    if (i_val0==2&&i_val1==2&&i_val2==2&&i_val3==2&&i_val4==2&&i_val5==2&&i_val6==2&&i_val7==2&&i_val8==2&&i_val9==2&&i_val10==2&&i_val11==2) {
        NSLog(@"Congratulation! All Reversi's chip was remoed.");
    }
}

// タッチイベント
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // タッチ位置を点で取得
    CGPoint pt = [[touches anyObject] locationInView:self];
    int i_val,i_valdec,i_valinc;
    // i=0,11のみあとで処理
    for(int i=1;i<11;i++){
        NSValue *tempRect = [_cgrectArr objectAtIndex:i];
        i_val = [[_isBlack objectAtIndex:i] intValue];
        i_valdec = [[_isBlack objectAtIndex:i-1] intValue];
        i_valinc = [[_isBlack objectAtIndex:i+1] intValue];
        
        // タッチ位置と丸の位置の判定
        if (CGRectContainsPoint([tempRect CGRectValue],pt)){
            // 黒オセロの位置であれば、オセロを消して両隣のオセロを反転させる
            if (i_val==1) {
                _isBlack[i]=[NSNumber numberWithInteger:2];
                switch (i_valinc) {
                    case 0:
                        _isBlack[i+1]=[NSNumber numberWithInteger:1];
                        break;
                    case 1:
                        _isBlack[i+1]=[NSNumber numberWithInteger:0];
                        break;
                    default:
                        break;
                }
                switch (i_valdec) {
                    case 0:
                        _isBlack[i-1]=[NSNumber numberWithInteger:1];
                        break;
                    case 1:
                        _isBlack[i-1]=[NSNumber numberWithInteger:0];
                        break;
                    default:
                        break;
                }
            }
        }
    }
    
    // i=0,11のみ別処理（i_valdec,i_valincがエラーを出すため）
    NSValue *tempRect0 = [_cgrectArr objectAtIndex:0];
    i_val = [[_isBlack objectAtIndex:0] intValue];
    i_valinc = [[_isBlack objectAtIndex:1] intValue];
    if (CGRectContainsPoint([tempRect0 CGRectValue],pt)){
        if (i_val==1) {
        _isBlack[0]=[NSNumber numberWithInteger:2];
            switch (i_valinc) {
                case 0:
                    _isBlack[1]=[NSNumber numberWithInteger:1];
                    break;
                case 1:
                    _isBlack[1]=[NSNumber numberWithInteger:0];
                    break;
                default:
                    break;
            }
        }
    }
    NSValue *tempRect11 = [_cgrectArr objectAtIndex:11];
    i_val = [[_isBlack objectAtIndex:11] intValue];
    i_valdec = [[_isBlack objectAtIndex:10] intValue];
    if (CGRectContainsPoint([tempRect11 CGRectValue],pt)){
        if (i_val==1) {
            _isBlack[11]=[NSNumber numberWithInteger:2];
            switch (i_valdec) {
                case 0:
                    _isBlack[10]=[NSNumber numberWithInteger:1];
                    break;
                case 1:
                    _isBlack[10]=[NSNumber numberWithInteger:0];
                    break;
                default:
                    break;
            }
        }
    }
    
    // CGRectを再読み込・再描画
    [self setNeedsDisplay];
}



@end
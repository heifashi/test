//
//  ViewController.m
//  UIAlart
//
//  Created by 黑法师 on 16/7/18.
//  Copyright © 2016年 黑法师. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIAlertView *alert;
@property (nonatomic,strong) UITapGestureRecognizer *recognizerTap;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *sheetBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    sheetBtn.frame =CGRectMake(100, 170, 100, 40);
    [sheetBtn setTitle:@"弹出行动表" forState:UIControlStateNormal];
    [sheetBtn addTarget:self action:@selector(show_alert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sheetBtn];
}
- (IBAction)show_alert:(id)sender {
    
    _alert = [[UIAlertView alloc] initWithTitle:@"测试"
                                       message:@"点击四周的区域我就消失"
                                      delegate:nil
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:nil];
    [_alert show];
    _recognizerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBehind:)];
    
    [_recognizerTap setNumberOfTapsRequired:1];
    _recognizerTap.cancelsTouchesInView = NO;
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:_recognizerTap];
}

- (void)handleTapBehind:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint location = [sender locationInView:nil];
        if (![_alert pointInside:[_alert convertPoint:location fromView:_alert.window] withEvent:nil]){
            //[_alert.window removeGestureRecognizer:sender];
            [_alert dismissWithClickedButtonIndex:0 animated:YES];
        }  
    }  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

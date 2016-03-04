//
//  ViewController.m
//  QQ密码强度显示
//
//  Created by 谢谦 on 16/2/28.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "ViewController.h"

CGFloat const lowPwd = 20;
CGFloat const centerPwd = 60;
CGFloat const highPwd = 90;

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *levelProgress;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@end

@implementation ViewController

-(BOOL)judgeWithArray:(NSArray *)arr withPwd:(NSString *)pwd
{
    NSRange range;
    for (int i =0; i<arr.count; i++) {
        range = [pwd rangeOfString:arr[i]];
        
        if (range.location != NSNotFound) {
            return YES;
        }
    }
    return NO;

}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.pwdTextField becomeFirstResponder];
//    NSLog(@"%d",self.pwdTextField.isEditing);
    NSArray* termArray1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    NSArray* termArray2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
    NSArray* termArray3 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    NSArray* termArray4 = [[NSArray alloc] initWithObjects:@"~",@"`",@"@",@"#",@"$",@"%",@"^",@"&",@"*",@"(",@")",@"-",@"_",@"+",@"=",@"{",@"}",@"[",@"]",@"|",@":",@";",@"“",@"'",@"‘",@"<",@",",@".",@">",@"?",@"/",@"、", nil];
    
    
    NSString *strResult1 = [NSString stringWithFormat:@"%d",[self judgeWithArray:termArray1 withPwd:self.pwdTextField.text]];
    NSString *strResult2 = [NSString stringWithFormat:@"%d",[self judgeWithArray:termArray2 withPwd:self.pwdTextField.text]];
    NSString *strResult3 = [NSString stringWithFormat:@"%d",[self judgeWithArray:termArray3 withPwd:self.pwdTextField.text]];
    NSString *strResult4 = [NSString stringWithFormat:@"%d",[self judgeWithArray:termArray4 withPwd:self.pwdTextField.text]];
    
    NSMutableArray *arrResult = [[NSMutableArray alloc]init];
    
    [arrResult addObject:strResult1];
    [arrResult addObject:strResult2];
    [arrResult addObject:strResult3];
    [arrResult addObject:strResult4];
    
    
    int intResult = 0;
    for (int j = 0; j<arrResult.count; j++) {
        if ([arrResult[j] isEqualToString:@"1"]) {
            intResult ++;
        }
    }
    
    if (intResult <2) {
        self.levelLabel.text = @"弱";
        self.levelProgress.progress = 0.2;
        self.levelProgress.progressTintColor = [UIColor redColor];
    }else if(intResult == 2){
        self.levelLabel.text = @"中";
        self.levelProgress.progressTintColor = [UIColor yellowColor];
        self.levelProgress.progress = 0.6;
    }else if (intResult >2){
        self.levelProgress.progressTintColor = [UIColor greenColor];
        self.levelProgress.progress = 0.9;
        self.levelLabel.text = @"强";
    }
    
 
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.pwdTextField.delegate = self;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

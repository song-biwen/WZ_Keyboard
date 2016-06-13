//
//  WZKeyboardViewController.m
//  键盘处理
//
//  Created by songbiwen on 16/6/13.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "WZKeyboardViewController.h"
#import "WZToolbar.h"

@interface WZKeyboardViewController ()
<UITextFieldDelegate,
WZToolbarDelegate
>

@property (nonatomic, strong) NSArray *textFieldItems;

@property (nonatomic, strong) WZToolbar *toolBar;
@end

@implementation WZKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 
     //更换键盘
     UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
     self.name_textField.inputView = button;
     
     
     //设置键盘顶部的工具条
     self.email_textField.inputAccessoryView = button;
     
     */
    
    self.textFieldItems = [NSArray arrayWithObjects:self.name_textField,self.email_textField,self.address_textField, nil];
    
    WZToolbar *toolBar = [WZToolbar toolBar];
    toolBar.toolBarDelegate = self;
    self.toolBar = toolBar;
    
    self.name_textField.inputAccessoryView = toolBar;
    self.email_textField.inputAccessoryView = toolBar;
    self.address_textField.inputAccessoryView = toolBar;
    
}

#pragma mark - WZToolbarDelegate
- (void)keyboardToolBar:(WZToolbar *)toolBar clickItem:(WZToolbarItem)item {
    
    NSInteger currentIndex = 0;
    for (UIView *view in self.view.subviews) {
        if ([view isFirstResponder]) {
            currentIndex = [self.textFieldItems indexOfObject:view];
            break;
        }
    }
    
    if (item == WZToolbarItemPrevious) {
        currentIndex --;
        self.toolBar.previous_item.enabled = (currentIndex != 0);
        self.toolBar.next_item.enabled = YES;
        UITextField *textField = [self.textFieldItems objectAtIndex:currentIndex];
        [textField becomeFirstResponder];
    }
    if (item == WZToolbarItemNext) {
        currentIndex ++;
        self.toolBar.previous_item.enabled = YES;
        self.toolBar.next_item.enabled = (currentIndex != self.textFieldItems.count - 1);
        UITextField *textField = [self.textFieldItems objectAtIndex:currentIndex];
        [textField becomeFirstResponder];
    }
    
    if (item == WZToolbarItemDone) {
        [self.view endEditing:YES];
    }
}


#pragma mark - UITextFieldDelegate
//点击return按钮时，走这个方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.name_textField) {
        [self.email_textField becomeFirstResponder];
    }
    else if (textField == self.email_textField) {
        [self.address_textField becomeFirstResponder];
    }
    else if (textField == self.address_textField) {
        //隐藏消失
        [self.view endEditing:YES];
    }
    
    return YES;
}

//键盘弹出
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSInteger currentIndex = [self.textFieldItems indexOfObject:textField];
    self.toolBar.previous_item.enabled = (currentIndex != 0);
    self.toolBar.next_item.enabled = (currentIndex != self.textFieldItems.count - 1);
}

//点击空白，键盘消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

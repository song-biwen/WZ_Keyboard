//
//  WZToolbar.m
//  键盘处理
//
//  Created by songbiwen on 16/6/13.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "WZToolbar.h"

@implementation WZToolbar

+ (instancetype)toolBar {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

//上一项
- (IBAction)previousItemAction:(id)sender {
    if (self.toolBarDelegate && [self.toolBarDelegate respondsToSelector:@selector(keyboardToolBar:clickItem:)]) {
        [self.toolBarDelegate keyboardToolBar:self clickItem:WZToolbarItemPrevious];
    }
}

//下一项
- (IBAction)nextItemAction:(id)sender {
    if (self.toolBarDelegate && [self.toolBarDelegate respondsToSelector:@selector(keyboardToolBar:clickItem:)]) {
        [self.toolBarDelegate keyboardToolBar:self clickItem:WZToolbarItemNext];
    }
}

//完成
- (IBAction)doneItemAction:(id)sender {
    if (self.toolBarDelegate && [self.toolBarDelegate respondsToSelector:@selector(keyboardToolBar:clickItem:)]) {
        [self.toolBarDelegate keyboardToolBar:self clickItem:WZToolbarItemDone];
    }
}

@end

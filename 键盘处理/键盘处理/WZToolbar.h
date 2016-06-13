//
//  WZToolbar.h
//  键盘处理
//
//  Created by songbiwen on 16/6/13.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WZToolbarItemPrevious,
    WZToolbarItemNext,
    WZToolbarItemDone
} WZToolbarItem;

@class WZToolbar;
@protocol WZToolbarDelegate <NSObject>

@optional
- (void)keyboardToolBar:(WZToolbar *)toolBar clickItem:(WZToolbarItem)item;

@end
@interface WZToolbar : UIToolbar

+ (instancetype)toolBar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *previous_item;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *next_item;

@property (nonatomic, weak) id<WZToolbarDelegate> toolBarDelegate;

@end

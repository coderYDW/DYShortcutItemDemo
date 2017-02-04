//
//  PreviewingViewController.m
//  DYShortcutItemDemo
//
//  Created by DovYoung on 2017/1/20.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "DYPreviewingViewController.h"
#import "ViewController.h"

@interface DYPreviewingViewController ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation DYPreviewingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.title = @"previewing";
    
}

#pragma mark - 重写预览选项
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {

    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

        NSLog(@"Action 1 triggered");
        
        
        
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Action 2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"Action 2 triggered");
        
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Action 3" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"Action 3 triggered");
        
    }];
    
    if (self.items.count == 0) {
        
        self.items = [NSMutableArray arrayWithObjects: action1,action2,action3,nil];
        
    }
    
    return self.items;
    
}

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}
    
@end

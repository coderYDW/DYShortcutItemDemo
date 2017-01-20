//
//  PreviewingViewController.m
//  DYShortcutItemDemo
//
//  Created by DovYoung on 2017/1/20.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "PreviewingViewController.h"
#import "ViewController.h"

@interface PreviewingViewController () <UIViewControllerPreviewingDelegate>

@end

@implementation PreviewingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.title = @"previewing";
    
}

#pragma mark - UIViewControllerPreviewingDelegate
    
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"%@\n%@",previewingContext,NSStringFromCGPoint(location));
    
    ViewController *preview = [[ViewController alloc] init];
    
    return preview;
    
}
    
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    NSLog(@"%s", __FUNCTION__);
    
}

#pragma mark - 重写预览选项
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {

    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

        NSLog(@"Action 1 triggered");

    }];
    
    return @[action1];
    
}
    
@end

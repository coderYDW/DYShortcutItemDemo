//
//  ViewController.m
//  DYShortcutItemDemo
//
//  Created by DovYoung on 2017/1/19.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "ViewController.h"
#import "DYPreviewingViewController.h"
#import "DYDetailViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
    
@property (nonatomic, strong) UITableView *tableView;
    
@end

@implementation ViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addTableView];
    
    [self addPreview];
    
}
    
- (void)addTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 80;
    
    [self.view addSubview:self.tableView];
    
}
    
- (void)addPreview {
    
    //判断是否支持3D-Touch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.tableView];
        
    } else {
        
        NSLog(@"3D Touch is not available on this device. Sniff!");
        
    }
    
}
    
#pragma mark - tableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shortcut"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"shortcut"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd组,第%zd行",indexPath.section,indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DYDetailViewController *detailVC = [DYDetailViewController new];
    
    [self.navigationController pushViewController:detailVC animated:YES];

}
    
#pragma mark - UIViewControllerPreviewingDelegate
    
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    NSLog(@"%s", __FUNCTION__);
    
    //location = [self.view convertPoint:location toView:self.tableView];
    
    NSLog(@"%@\n%@",previewingContext,NSStringFromCGPoint(location));
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    if (indexPath) {
        
        NSLog(@"%zd",indexPath.row);
        
        CGRect selectedFrame = [self.tableView cellForRowAtIndexPath:indexPath].frame;
        
        //selectedFrame = [self.tableView convertRect:selectedFrame toView:self.view];
        
        previewingContext.sourceRect = selectedFrame;
        
    }
    else {
    
        return nil;
        
    }
    
    DYPreviewingViewController *preview = [[DYPreviewingViewController alloc] init];
    
    preview.viewController = self;
    
    return preview;
    
}
    
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    NSLog(@"%@", viewControllerToCommit);
    
    [self showViewController:viewControllerToCommit sender:self];
    
    NSLog(@"viewControllerToCommit = %@\npreviewingContext = %@", viewControllerToCommit, previewingContext);
    
}

@end

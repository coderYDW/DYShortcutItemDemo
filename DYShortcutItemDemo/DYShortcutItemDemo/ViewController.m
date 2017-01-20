//
//  ViewController.m
//  DYShortcutItemDemo
//
//  Created by DovYoung on 2017/1/19.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "ViewController.h"
#import "PreviewingViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
    
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *soureView;
    
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
    
    [self addShortcut];
    
}
    
- (void)addTableView {
    
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 80;
    
    [self.view addSubview:self.tableView];
    
}
    
- (void)addShortcut {
    
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
        
    } else {
        
        NSLog(@"3D Touch is not available on this device. Sniff!");
        
    }
    
}
    
#pragma mark - tableViewDataSource
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shortcut"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"shortcut"];
    }
    
    cell.textLabel.text = @"title";
    
    cell.detailTextLabel.text = @"detail";
    
    
    return cell;
}
    
#pragma mark - UIViewControllerPreviewingDelegate
    
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    NSLog(@"%s", __FUNCTION__);
    
    location = [self.view convertPoint:location toView:self.tableView];
    
    NSLog(@"%@\n%@",previewingContext,NSStringFromCGPoint(location));
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    if (indexPath) {
        
        NSLog(@"%zd",indexPath.row);
        
        CGRect selectedFrame = [self.tableView cellForRowAtIndexPath:indexPath].frame;
        
        selectedFrame = [self.tableView convertRect:selectedFrame toView:self.view];
        
        previewingContext.sourceRect = selectedFrame;
        
    }
    else {
    
        return nil;
        
    }
    
    PreviewingViewController *preview = [[PreviewingViewController alloc] init];
    
    return preview;
    
}
    
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    NSLog(@"%@", viewControllerToCommit);
    
    [self showViewController:viewControllerToCommit sender:self];
    
}
    
    
- (UIView *)soureView {

    if (_soureView == nil) {
        
        _soureView = [[UIView alloc] init];
        
        _soureView.backgroundColor = [UIColor blueColor];
        
    }
    return _soureView;
    
}

@end

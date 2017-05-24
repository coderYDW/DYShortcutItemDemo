//
//  DYDetailViewController.m
//  DYShortcutItemDemo
//
//  Created by apple on 2017/5/24.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "DYDetailViewController.h"

@interface DYDetailViewController ()

@end

@implementation DYDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.title = @"Detail";
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch *touch = touches.anyObject;
    
    NSLog(@"force = %.2f, maximumPossibleForce = %.2f",touch.force, touch.maximumPossibleForce);
    
    self.view.backgroundColor = [UIColor colorWithWhite: 1 - touch.force/touch.maximumPossibleForce alpha:1];

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

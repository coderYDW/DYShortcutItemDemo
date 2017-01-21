//
//  AppDelegate.m
//  DYShortcutItemDemo
//
//  Created by DovYoung on 2017/1/19.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%@",[UIApplication sharedApplication].shortcutItems);
    
    //[self addShortcutItems];
    
    
    return YES;
}

- (void)addShortcutItems {

    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"com.test.dynamic" localizedTitle:@"item1" localizedSubtitle:@"item1sub" icon:icon1 userInfo:nil];
    
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"com.test.dynamic" localizedTitle:@"item2" localizedSubtitle:@"item2sub" icon:icon2 userInfo:nil];
    
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"com.test.dynamic" localizedTitle:@"item3" localizedSubtitle:@"item3sub" icon:icon3 userInfo:nil];
    
    NSArray *items = @[item1, item2, item3];
    
    if ([UIApplication sharedApplication].shortcutItems.count == 0) {
        
        [UIApplication sharedApplication].shortcutItems = items;
        
    }
    
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    NSLog(@"%@",shortcutItem.localizedTitle);

}

@end

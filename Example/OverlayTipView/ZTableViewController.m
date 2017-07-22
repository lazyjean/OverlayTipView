//
//  ZTableViewController.m
//  OverlayTipView_Example
//
//  Created by liuzhen on 2017/7/22.
//  Copyright © 2017年 liuzhen. All rights reserved.
//

#import "ZTableViewController.h"

@import OverlayTipView;

@interface ZTableViewController ()

@end

@implementation ZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text isEqualToString:@"showOverlayTip:"]) {
        [self.view showOverlayTip:@"showOverlayTip test"];
    }
    else if ([cell.textLabel.text isEqualToString:@"showOverlayLoading:"]) {
        [self.view showOverlayLoading:@"showOverlayLoading:"];
    }
    else if ([cell.textLabel.text isEqualToString:@"showOverlayTip:image:"]) {
        [self.view showOverlayTip:@"showOverlayTip:image:" image:[UIImage imageNamed:@"Fastlane"]];
    }else if ([cell.textLabel.text isEqualToString:@"showOverlayImageTip:"]) {
        [self.view showOverlayImageTip:[UIImage imageNamed:@"Fastlane"]];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view dismissOverylayTip];
    });
 }

@end

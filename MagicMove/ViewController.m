//
//  ViewController.m
//  MaigicMove
//
//  Created by Jason on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
#import "MagicMoveTransition.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.tag = indexPath.row;
    [cell loadSubView];
    return cell;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[DetailViewController class]]) {
        MagicMoveTransition * transition = [[MagicMoveTransition alloc]init];
        return transition;
    }else{
        return nil;
    }
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MagicMoveTransition.m
//  MagicMove
//
//  Created by Jason on 16/5/11.
//  Copyright © 2016年 MHP. All rights reserved.
//

#import "MagicMoveTransition.h"
#import "TableViewCell.h"
#import "ViewController.h"
#import "DetailViewController.h"

@implementation MagicMoveTransition


// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //fromVC
    ViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //toVC
    DetailViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //containView
    UIView * containerView = [transitionContext containerView];
    
    //对Cell上的 imageView 截图，同时将这个 imageView 本身隐藏
    TableViewCell * Cell = [fromVC.tableView cellForRowAtIndexPath:[fromVC.tableView indexPathForSelectedRow]];
    UIView * snapShotView = [Cell.subImageView snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = [containerView convertRect:Cell.subImageView.frame fromView:Cell.subImageView.superview];
    Cell.subImageView.hidden = YES;
    
    //设置第二个控制器的位置、透明度、
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.subImageView.hidden = YES;
    
    //把动画前后的两个ViewController加到容器中
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    //动起来。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新；
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:1 initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0;
        snapShotView.frame = [containerView convertRect:toVC.subImageView.frame fromView:toVC.view];
    } completion:^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        toVC.subImageView.hidden = NO;
        Cell.imageView.hidden = NO;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}


@end

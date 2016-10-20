//
//  CustomDismissAnimation.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let _duration = 1.2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return _duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let container = transitionContext.containerView
        let finalFrameOfToView = transitionContext.finalFrame(for: toViewController)
        
        toViewController.view.frame = finalFrameOfToView
        toViewController.view.alpha = 0.5
        container.addSubview(toViewController.view)
        container.sendSubview(toBack: toViewController.view)
        
        let snapshotView = fromViewController.view.snapshotView(afterScreenUpdates: false)!
        snapshotView.frame = fromViewController.view.frame
        container.addSubview(snapshotView)
        
        // if remove fromViewController at this time. 
        // the UIPanGestureRecognizer at CustomDismissInteractiveTransition will have some problem! 
        //fromViewController.view.removeFromSuperview()
        fromViewController.view.alpha = 0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
            snapshotView.frame = fromViewController.view.frame.insetBy(dx: fromViewController.view.frame.size.width / 2, dy: fromViewController.view.frame.height / 2)
            toViewController.view.alpha = 1
            }) { (complete) in
                if transitionContext.transitionWasCancelled {
                    fromViewController.view.alpha = 1
                } else {
                    fromViewController.view.removeFromSuperview()
                }
                snapshotView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

}

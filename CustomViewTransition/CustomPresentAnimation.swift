//
//  CustomPresentAnimationController.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomPresentAnimation: NSObject,UIViewControllerAnimatedTransitioning {

    private let duration = 1.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let containerView = transitionContext.containerView
        
        let finalFrameOfToViewController = transitionContext.finalFrame(for: toViewController)
        let bounds = UIScreen.main.bounds
        
        toViewController.view.frame = finalFrameOfToViewController.offsetBy(dx: 0, dy: -bounds.size.height)
        
        toViewController.view.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI))
        
        
        containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            fromViewController.view.alpha = 0.5
            toViewController.view.transform = CGAffineTransform.identity
            toViewController.view.frame = finalFrameOfToViewController
            }) { (complete) in
                transitionContext.completeTransition(true)
                fromViewController.view.alpha = 1.0
        }
    }
}

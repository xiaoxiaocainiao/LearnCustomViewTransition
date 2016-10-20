//
//  CustomNavigationAnimation.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomNavigationAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    private var _reverse = false
    private var _duration = 0.5
    
    func setReverse(_ reverse: Bool) {
        _reverse = reverse
    }
    
    //MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return _duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let container = transitionContext.containerView
        
        let toView = toViewController.view!
        let fromView = fromViewController.view!
        let direction: CGFloat = _reverse ? -1 : 1
        let const: CGFloat = -0.005
        
        toView.layer.anchorPoint = CGPoint(x: direction == 1 ? 0 : 1, y: 0.5)
        fromView.layer.anchorPoint = CGPoint(x: direction == 1 ? 1 : 0, y: 0.5)
        
        var viewFromTransform = CATransform3DMakeRotation(direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
        viewFromTransform.m34 = const
        var viewToTransform = CATransform3DMakeRotation(-direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
        viewToTransform.m34 = const
        
        container.transform = CGAffineTransform.init(translationX: direction * container.frame.size.width / 2, y: 0)
        toView.layer.transform = viewToTransform
        container.addSubview(toView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.2, animations: {
            
            container.transform = CGAffineTransform.init(translationX: -direction * container.frame.size.width / 2.0 , y: 0)
            fromView.layer.transform = viewFromTransform
            toView.layer.transform = CATransform3DIdentity
            }) { (complete) in
                container.transform = CGAffineTransform.identity
                fromView.layer.transform = CATransform3DIdentity
                toView.layer.transform = CATransform3DIdentity
                
                fromView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                
                if transitionContext.transitionWasCancelled {
                    toView.removeFromSuperview()
                } else {
                    fromView.removeFromSuperview()
                }
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
}

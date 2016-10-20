//
//  CustomPresentAnimationWithInteractiveViewController.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomPresentAnimationWithInteractiveViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private let _presentAnimation = CustomPresentAnimation()
    private var _customPresentInteractiveTransition = CustomPresentInteractiveTransition()
    private let _viewController = PresentedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.purple
        let btn = UIButton(type: UIButtonType.roundedRect)
        btn.frame = CGRect(origin: view.center, size: CGSize(width: 180, height: 60))
        btn.setTitle("Present!", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(showPresent), for: UIControlEvents.touchUpInside)
        btn.backgroundColor = UIColor.white
        view.addSubview(btn)
        
        
        _customPresentInteractiveTransition.attachToViewController(fromViewController: self, toViewController: _viewController)
        _viewController.transitioningDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - private logic
    
    func showPresent() {
        self.present(_viewController, animated: true, completion: nil)
    }
    
    //MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return _presentAnimation
    }
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return _customPresentInteractiveTransition.transitionInProgress() ? _customPresentInteractiveTransition : nil
    }
    
}

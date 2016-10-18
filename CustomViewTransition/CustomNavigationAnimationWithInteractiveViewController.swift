//
//  CustomNavigationAnimationViewController.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomNavigationAnimationWithInteractiveViewController: UIViewController, UINavigationControllerDelegate {

    private let _customNavigationAnimation = CustomNavigationAnimation()
    private let _customNavigationInteractiveTransition = CustomNavigationInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.magenta
        let btn = UIButton(type: UIButtonType.roundedRect)
        btn.frame = CGRect(origin: view.center, size: CGSize(width: 180, height: 60))
        btn.setTitle("Navigation!", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(showNavigation), for: UIControlEvents.touchUpInside)
        btn.backgroundColor = UIColor.white
        view.addSubview(btn)
        
        navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showNavigation() {
        let viewController = NavigatedViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - UIViewControllerTransitioningDelegate
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            _customNavigationInteractiveTransition.attachToViewController(toVC)
        }
        
        _customNavigationAnimation.setReverse(operation == .pop)
        return _customNavigationAnimation
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return _customNavigationInteractiveTransition.transitionInProgress() ? _customNavigationInteractiveTransition : nil
    }
}

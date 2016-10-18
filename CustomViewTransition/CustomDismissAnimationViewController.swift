//
//  ViewController3.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomDismissAnimationViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private let _dimissAnimation = CustomDismissAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.orange
        let btn = UIButton(type: UIButtonType.roundedRect)
        btn.frame = CGRect(origin: view.center, size: CGSize(width: 180, height: 60))
        btn.setTitle("Present!", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(showPresent), for: UIControlEvents.touchUpInside)
        btn.backgroundColor = UIColor.white
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARKL - UIViewControllerAnimatedTransitioning
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return _dimissAnimation
    }

    
    //MARK: - private logic
    func showPresent() {
        let viewController = PresentedViewController()
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }

}

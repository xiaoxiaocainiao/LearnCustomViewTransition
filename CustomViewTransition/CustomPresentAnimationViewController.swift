//
//  ViewController2.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomPresentAnimationViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private let _presentAnimation = CustomPresentAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.brown
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
    
    //MARK: - private logic
    
    func showPresent() {
        let viewController = PresentedViewController()
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    //MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return _presentAnimation
    }
    
}

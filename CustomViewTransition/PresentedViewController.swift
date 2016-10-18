//
//  PresentedViewController.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        let btn = UIButton(type: UIButtonType.roundedRect)
        btn.frame = CGRect(origin: view.center, size: CGSize(width: 180, height: 60))
        btn.setTitle("Dimiss!", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(dismissMe), for: UIControlEvents.touchUpInside)
        btn.backgroundColor = UIColor.white
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissMe() {
        self.dismiss(animated: true) {
            
        }
    }

}

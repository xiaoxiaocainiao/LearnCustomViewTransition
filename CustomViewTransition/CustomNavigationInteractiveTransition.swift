//
//  CustomInteractiveTransition.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class CustomNavigationInteractiveTransition: UIPercentDrivenInteractiveTransition {
    private var _navigationController: UINavigationController!
    private var _shouldCompleteTransition = false
    private var _transitionInProgress = false
    private var _completionSeed: CGFloat {
        return 1 - percentComplete
    }
    
    func transitionInProgress() -> Bool {
        return _transitionInProgress
    }
    
    func attachToViewController(_ viewController: UIViewController) {
        _navigationController = viewController.navigationController
        setupGestureRecognizer(view: _navigationController.view)
    }
    
    private func setupGestureRecognizer(view: UIView) {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gestureRecognizer:))))
    }
    
    func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        let viewTranslation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview!)
        switch gestureRecognizer.state {
        case .began:
            _transitionInProgress = true
            _navigationController.popViewController(animated: true)
        case .changed:
            let const = CGFloat(fminf(fmaxf(Float(viewTranslation.x / 200.0), 0.0), 1.0))
            _shouldCompleteTransition = const > 0.5
            update(const)
        case .cancelled, .ended:
            _transitionInProgress = false
            if !_shouldCompleteTransition || gestureRecognizer.state == .cancelled {
                cancel()
            } else {
                finish()
            }
        default:
            print("Swift switch must be exhaustive, thus the default")
        }
    }
}

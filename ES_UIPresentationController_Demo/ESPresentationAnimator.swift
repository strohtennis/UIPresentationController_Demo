//
//  ESPresentationAnimator.swift
//  ES_UIPresentationController_Demo
//
//  Created by Eric Stroh on 2/24/15.
//  Copyright (c) 2015 com.strohtennis. All rights reserved.
//

import UIKit

class ESPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey){
            
            transitionContext.containerView().addSubview(toViewController.view)
            
            toViewController.view.transform = CGAffineTransformMakeScale(0.2, 0.2)
            toViewController.view.alpha = 0.0
            toViewController.view.clipsToBounds = true
            
            UIView.animateWithDuration(transitionDuration(transitionContext) , animations: { () -> Void in
                toViewController.view.transform = CGAffineTransformIdentity
                toViewController.view.alpha = 1.0
                }, completion: { (finished) -> Void in
                    transitionContext.completeTransition(finished)
            })
        }
    }
}

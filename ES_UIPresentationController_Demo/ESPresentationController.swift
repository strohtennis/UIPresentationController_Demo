//
//  ESPresentationController.swift
//  ES_UIPresentationController_Demo
//
//  Created by Eric Stroh on 2/24/15.
//  Copyright (c) 2015 com.strohtennis. All rights reserved.
//

import UIKit

class ESPresentationController: UIPresentationController {
    
    var dimmingView: UIView!
    
    override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        dimmingView = UIView(frame: presentingViewController.view.bounds)
        dimmingView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
    }
    
    func dismissModal(){
        presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView.bounds
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, atIndex: 0)
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ [weak self](coordinatorContext) -> Void in
            if let strongSelf = self{
                strongSelf.dimmingView.alpha = 1.0
            }
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ [weak self](coordinatorContext) -> Void in
            if let strongSelf = self{
                strongSelf.dimmingView.alpha = 0.0
            }
            }, completion: nil)
    }
    
    //UIContentContainer protocol method which is implemented by UIPresentationController
    override func preferredContentSizeDidChangeForChildContentContainer(container: UIContentContainer) {
        changeSize()
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        let windowBounds = UIScreen.mainScreen().bounds;
        var requestedSize = CGSizeZero
        if let dvc = presentedViewController as? ESModalViewController{
            requestedSize = dvc.modalPresentationSize()
        }
        else if let nav = presentedViewController as? ESModalNavigationController{
            requestedSize = nav.modalPresentationSize()
        }
        
        return CGRectMake((windowBounds.size.width - requestedSize.width)/2,
            (windowBounds.size.height - requestedSize.height)/2,
            requestedSize.width,
            requestedSize.height);
        
        
    }
    func changeSize(){
        UIView.animateWithDuration(0.2, animations: {[weak self]() in
            if let strongSelf = self{
                strongSelf.presentedView().frame = strongSelf.frameOfPresentedViewInContainerView()
            }
        })
    }
    
    
}

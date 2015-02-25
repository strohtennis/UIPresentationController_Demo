//
//  ViewController.swift
//  ES_UIPresentationController_Demo
//
//  Created by Eric Stroh on 2/24/15.
//  Copyright (c) 2015 com.strohtennis. All rights reserved.
//

import UIKit


protocol ESModalViewDelegate{
    func modalPresentationSize()->CGSize
}

class ViewController: UIViewController {

    let detailTransitioningDelegate: ESPresentationManager = ESPresentationManager.sharedInstance
    
    @IBAction func prepareResizableModal( sender: AnyObject) {
        var detailViewController = ESDetailViewController()
        detailViewController.modalPresentationStyle = .Custom
        detailViewController.transitioningDelegate = detailTransitioningDelegate
        presentViewController(detailViewController, animated: true, completion: nil)
    }
    
    @IBAction func presentDetailInNavigation(sender: AnyObject) {
        var innerViewController = SampleModalViewController()
        let navCtl = ESModalNavigationController(rootViewController: innerViewController)
        navCtl.modalPresentationStyle = UIModalPresentationStyle.Custom
        navCtl.transitioningDelegate = detailTransitioningDelegate
        presentViewController(navCtl, animated: true, completion: nil)
    }
}


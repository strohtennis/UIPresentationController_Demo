//
//  ESDetailViewController.swift
//  ES_UIPresentationController_Demo
//
//  Created by Eric Stroh on 2/24/15.
//  Copyright (c) 2015 com.strohtennis. All rights reserved.
//

import UIKit

class ESDetailViewController: ESModalViewController {

    var size:CGSize = CGSizeMake(300, 400)
    
    convenience override init(){
        self.init(nibName: "ESDetailViewController", bundle:nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        preferredContentSize = size
    }
    
    @IBAction func dismissView() {
        ESPresentationManager.sharedInstance.presentationController?.dismissModal()
    }
    @IBAction func changeSize(sender: AnyObject) {
        size = CGSizeMake(100, 450)
        preferredContentSize = size
    }
    override func modalPresentationSize()->CGSize{
        return size
    }
}

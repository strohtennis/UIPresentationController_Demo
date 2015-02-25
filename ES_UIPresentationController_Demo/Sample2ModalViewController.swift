//
//  Sample2ModalViewController.swift
//  PresentationTutorial
//
//  Created by Eric Stroh on 2/22/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class Sample2ModalViewController: ESModalViewController {
    
    convenience override init(){
        self.init(nibName: "Sample2ModalViewController", bundle:nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "2nd View Controller"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //preferredContentSize = modalPresentationSize()
        ESPresentationManager.sharedInstance.presentationController?.changeSize()
    }
    
    override func modalPresentationSize()->CGSize{
        return CGSizeMake(250, 350)
    }
    
    @IBAction func closePressed(sender: AnyObject) {
        ESPresentationManager.sharedInstance.presentationController?.dismissModal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

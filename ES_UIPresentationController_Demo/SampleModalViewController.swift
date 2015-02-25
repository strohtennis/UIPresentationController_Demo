//
//  SampleModalViewController.swift
//  PresentationTutorial
//
//  Created by Eric Stroh on 2/22/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class SampleModalViewController: ESModalViewController {

    convenience override init(){
        self.init(nibName: "SampleModalViewController", bundle:nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "1st View Controller"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ESPresentationManager.sharedInstance.presentationController?.changeSize()
        //preferredContentSize = modalPresentationSize()
    }

    
    override func modalPresentationSize()->CGSize{
        return CGSizeMake( 300, 500)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goTo2ndViewPressed(sender: AnyObject) {
        var detailViewController = Sample2ModalViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    @IBAction func closePressed(sender: AnyObject) {
        ESPresentationManager.sharedInstance.presentationController?.dismissModal()
    }


}

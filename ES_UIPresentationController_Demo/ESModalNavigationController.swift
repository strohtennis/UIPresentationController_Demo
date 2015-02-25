//
//  ESModalNavigationController.swift
//  PresentationTutorial
//
//  Created by Eric Stroh on 2/22/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import Foundation
import UIKit

class ESModalNavigationController:UINavigationController,ESModalViewDelegate{
    
    func modalPresentationSize()->CGSize{
        if let topController = topViewController as? ESModalViewController{
            return topController.modalPresentationSize()
        }
        //default in case
        return CGSizeZero
    }
  

}
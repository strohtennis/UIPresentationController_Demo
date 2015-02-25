//
//  ESModalViewController.swift
//  PresentationTutorial
//
//  Created by Eric Stroh on 2/22/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import Foundation
import UIKit

class ESModalViewController:UIViewController,ESModalViewDelegate{
    
    func modalPresentationSize()->CGSize{
        //child classes must override this method
        return CGSizeZero
    }
}
//
//  ApplicationViewController.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/27/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import StrategicControllers
import UIKit

class ApplicationVC : UIViewController {
    
    var activeVC : UIViewController = UIViewController()
    var inactiveVCs = Stack<UIViewController>()
    
    @IBOutlet var containerView : UIView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func transitionToVC(controller: UIViewController) {
        animateTransition(fromVC: activeVC, toController: controller)
        inactiveVCs.push(activeVC)
        activeVC = controller
    }
    
    func transitionToPreviousController() {
        if inactiveVCs.count > 0 {
            let previousVC = inactiveVCs.pop()
            animateTransition(fromVC: activeVC, toController: previousVC)
            activeVC = previousVC
        }
    }
    
    func animateTransition(#fromVC: UIViewController, toController: UIViewController) {
        
    }
    
}

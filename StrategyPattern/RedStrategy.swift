//
//  RedStrategy.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/22/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import StrategicControllers
import UIKit

class RedStrategy : ControllerStrategy {
    
    lazy var colorController : ColorChangeController = {
        var optionalCast = self.managedController as? ColorChangeController
        assert(optionalCast != nil, "Could not cast controller \(self.managedController) to expected strategic subclass")
        return optionalCast ?? ColorChangeController()
        }()
    
    override func viewDidLoad() {
        colorController.colorView?.backgroundColor = UIColor.redColor()
        
//        colorController.actionOnButtonTap = {
//            println("Hey")
//        }
        
//        colorController.actionOnModelSelect = { model in
//            
//        }
    }
    
}

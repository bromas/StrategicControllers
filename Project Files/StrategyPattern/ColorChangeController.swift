//
//  ColorChangeController.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/22/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import StrategicControllers
import UIKit


class ColorChangeController : StrategicController {
    
    @IBOutlet var colorView : UIView?
    @IBAction func buttonTap () { actionOnButtonTap() }
    var actionOnButtonTap: (() -> Void) = { }
    
    var someModels = []
    var actionOnModelSelect: ((SomeModel) -> Void) = { model in }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init() {
        super.init()
    }
    
}

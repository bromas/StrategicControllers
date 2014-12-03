//
//  BlueStrategy.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/22/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import StrategicControllers
import UIKit

class BlueStrategy : ControllerStrategy {
    
    override func viewDidLoad() {
        managedController?.view.backgroundColor = UIColor.blueColor()
    }
    
}

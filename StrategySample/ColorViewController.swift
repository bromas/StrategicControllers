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

class SomeModel {
  
  var modelName = "Name"
  var modelDetail = "Detail"
  
}

class ColorViewController : StrategicController {
  
  @IBAction func buttonTap () { actionOnButtonTap() }
  var actionOnButtonTap: (() -> Void) = { }
  
  @IBAction func resignModal () { self.dismissViewControllerAnimated(true, completion: nil) }
  
  @IBOutlet var colorView : UIView!
  var startingColor :UIColor = UIColor.lightGrayColor()
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  required init() {
    super.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    colorView.backgroundColor = startingColor
  }
  
  func configureWithColor(color :UIColor) {
    startingColor = color
  }
  
}

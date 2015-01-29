//
//  ControllerStrategy.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/22/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class ControllerStrategy : BaseStrategy {
    
    public var managedController : StrategicController?
    
    public init () {
        
    }
    
    public func configureWithController(controller: StrategicController?) {
        managedController = controller
    }
    
    public func viewDidLoad() {
        
    }
    
    public func viewWillAppear() {
        
    }
    
    public func viewDidAppear() {
        
    }

    public func viewDidLayoutSubviews() {
        
    }
    
    public func viewWillLayoutSubviews() {
        
    }
    
    public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    public func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        return true
    }
    
}

//
//  CompositeStrategy.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/28/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class CompositeStrategy : BaseStrategy {
    
    private var strategies = [String: ControllerStrategy]()
    private var strategyKeys = [String]()
    
    var managedController : StrategicController?

    init () {
        
    }
    
    subscript(key : String) -> ControllerStrategy? {
        get {
            return strategies[key]
        }
        
        set {
            if let nonOptional = newValue {
                nonOptional.managedController = self.managedController
                strategies[key] = nonOptional
                strategyKeys.append(key)
            }
            else {
                strategies.removeValueForKey(key)
                strategyKeys.filter { $0 != key }
            }
        }
    }
    
    public func configureWithController(controller: StrategicController?) {
        managedController = controller
        for key in strategyKeys { strategies[key]?.configureWithController(self.managedController) }
    }
    
    public func viewDidLoad() {
        for key in strategyKeys { strategies[key]?.viewDidLoad() }
    }
    
    public func viewWillAppear() {
        for key in strategyKeys { strategies[key]?.viewWillAppear() }
    }
    
    public func viewDidAppear() {
        for key in strategyKeys { strategies[key]?.viewDidAppear() }
    }

    public func viewDidLayoutSubviews() {
        for key in strategyKeys { strategies[key]?.viewDidLayoutSubviews() }
    }
    
    public func viewWillLayoutSubviews() {
        for key in strategyKeys { strategies[key]?.viewWillLayoutSubviews() }
    }
    
    public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        for key in strategyKeys {
            strategies[key]?.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        }
    }

    public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        for key in strategyKeys { strategies[key]?.prepareForSegue(segue, sender: sender) }
    }

    public func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        for key in strategyKeys {
            var shouldPerform = strategies[key]?.shouldPerformSegueWithIdentifier(identifier, sender: sender)
            if let answer = shouldPerform {
                if !answer { return false }
            }
        }
        return true
    }
    
}

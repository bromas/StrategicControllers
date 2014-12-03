//
//  BaseStrategyProtocol.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/28/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public protocol BaseStrategy {
    
    func configureWithController(controller: StrategicController?)
    
    // Lifecycle
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()

    // Layout
    func viewDidLayoutSubviews()
    func viewWillLayoutSubviews()
    
    // Size Classes
    func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator)
    
//    // Segues
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool
    
}

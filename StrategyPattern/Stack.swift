//
//  Stack.swift
//  StrategyPattern
//
//  Created by Brian Thomas on 10/28/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation

class Stack<T> {
    
    var items = [T]()
    
    var count : Int {
        get {
            return items.count
        }
    }
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
    
}



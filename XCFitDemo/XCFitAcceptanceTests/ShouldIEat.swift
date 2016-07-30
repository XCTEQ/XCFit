//
//  ShouldIEat.swift
//  XCFitDemo
//
//  Created by Shashikant Jagtap on 30/07/2016.
//  Copyright © 2016 Shashikant Jagtap. All rights reserved.
//

import Foundation
@objc(ShouldIEat)

class ShouldIEat: NSObject, SlimDecisionTable {
    
    var hungry = ""
    
    func setHungry() -> String {
        
        return "no"
    }
    
    
    func execute() {
        
    }
    
    func eat() -> String {
        
        return "no"
    }
    
    
    

}

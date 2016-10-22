//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//

/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 Here is example of the Protocol Oriented Test which implement HomeProtocol. 
 
 */


import Foundation
import XCTest

extension HomeProtocol {
    
    
    
}

class ProtocolOrientedTest: XCTestCase, HomeProtocol {
    
    let app = XCUIApplication()
    
    func testPrintsAddedToBasket() {
        XCUIApplication().launch()
        launchApp()
        tapHomebutton()
        
    }
    
    func launchApp() {
        
    }
    
    func tapHomebutton() {
        
    }
    
}

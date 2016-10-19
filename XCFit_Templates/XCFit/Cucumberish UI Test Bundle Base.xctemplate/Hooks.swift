//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

import Foundation
import XCTest
class Hooks: NSObject {
    class func CustomHooks()
    {
        var application : XCUIApplication!
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
            application = XCUIApplication()
            
        }
    }
}

//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

/*

This is sample code created by XCFit Framework and can be edited/Removed as needed.

 This are preconditions or post conditions to be executed before or after each scenario
 */

import Foundation
import XCTest
import Cucumberish

class Hooks: NSObject {
    class func CustomHooks()
    {
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
            // Write your hooks here

        }
    }
}

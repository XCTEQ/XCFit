//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

import Foundation
import XCTest
class ___PACKAGENAMEASIDENTIFIER___: NSObject {
    class func CucumberishSwiftInit()
    {
        
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
                    }
        //A Given step definition
        Given("the app is running") { (args, userInfo) -> Void in
            
        }
        //Tell Cucumberish the name of your features folder and let it execute them for you...
        Cucumberish.executeFeaturesInDirectory("Features", featureTags: nil)
    }
}
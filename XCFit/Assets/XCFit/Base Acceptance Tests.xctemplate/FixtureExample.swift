//
//  Copyright © 2015 stringerstheory. All rights reserved.
//

import Foundation

@objc(FixtureExample)

class FixtureExample : NSObject, SlimDecisionTable {
    
    //MARK: Inputs
    
    var input = ""
    
    //MARK: <SlimDecisionTable>
    
    func execute() {
        // 1. Prepare a System Under Test (SUT) using the given inputs.
        // e.g. let system = System(input: foo)
        // 2. Run your SUT and prepare to return outputs.
    }
    
    //MARK: Outputs
    
    var output: NSString {
        get {
            return ""
        }
    }
    
}
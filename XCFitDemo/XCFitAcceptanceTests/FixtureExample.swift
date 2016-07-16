//
//  Copyright © 2015 stringerstheory. All rights reserved.
//

import Foundation

@objc(ShouldIBuyMilk)

class ShouldIBuyMilk : NSObject, SlimDecisionTable {
    
    //MARK: Inputs
    
    var cashInWallet = ""
    var creditCard = ""
    var pintsOfMilkRemaining = 0
    
    //MARK: <SlimDecisionTable>
    
    func execute() {
        // 1. Prepare a System Under Test (SUT) using the given inputs.
        // e.g. let system = System(input: foo)
        // 2. Run your SUT and prepare to return outputs.
    }
    
    //MARK: Outputs
    
    func goToStore() -> String {
        return "no"
    }
    
}
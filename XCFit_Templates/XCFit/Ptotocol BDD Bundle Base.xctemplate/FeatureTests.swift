//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.

 This is a actual representation of the test which extends to XCFit and confirms to Feature protocol. We can write a protocol per test implement steps with extensions and store elements in the enums.

 */

class FeatureTests: UITestBase, Feature {

    func testAppIsRunning() {
        givenILaunchAppInCleanState()
    }
}

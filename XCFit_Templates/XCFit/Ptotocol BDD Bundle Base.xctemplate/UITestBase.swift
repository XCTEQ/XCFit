//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need.
 You can also re-arrange Xcode Groups and directories as per your need.

 This is a template class which can be extended to XCFit once imported
 */

import Foundation
import XCTest
//import XCFit

// Once XCFit is imported then you can extend this class to XCFit in order to use pre-defined steps

class UITestBase: XCTestCase {

    var app: XCUIApplication!

    let defaultLaunchArguments: [[String]] = {
        let launchArguments: [[String]] = [["-StartFromCleanState", "YES"]]
        guard let version = appVersion else { return launchArguments }
        return launchArguments
    }()

    static var appVersion: String? {
        guard let appPlist = Bundle.main.url(forResource: "yourApp", withExtension: "plist"),
        let appInfo = NSDictionary(contentsOf: appPlist) else { return nil }
        return appInfo["CFBundleShortVersionString"] as? String
    }

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
        launchApp(with: defaultLaunchArguments)
    }

    override func tearDown() {
        app.terminate()
        app = nil
        super.tearDown()
    }

    func launchApp(with launchArguments: [[String]] = []) {
        (defaultLaunchArguments + launchArguments).forEach { app.launchArguments += $0 }
        app.launch()
    }
}

extension UITestBase {

    func givenILaunchAppInCleanState() {
        XCTContext.runActivity(named: "Given I Launch App in Clean State") {  _ in
            launchApp(with: defaultLaunchArguments)
        }
    }
}

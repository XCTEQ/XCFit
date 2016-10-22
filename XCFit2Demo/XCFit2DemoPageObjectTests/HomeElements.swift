//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//


/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 Sectons are defined to store locators of the screen in the form of enums. Here are some samples we can store Images, Buttons and Static Texts of the HomeScreens. We can access those enums from anywhere from the Test methods or page objects.
 
 */

import Foundation
import XCTest

public enum Images: String {
    case bannerImage = "Banner"
}

public enum Buttons: String {
    case homeButton = "Home"
}


public enum StaticTextx: String {
    case homeLink = "homelink"
}

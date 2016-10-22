//
//  Accessibility.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 22/10/2016.
//
//

import Foundation

class Accessibility {
    static func titlePrefixedToIndicateFinished(title: String) -> String {
    
        let template = NSLocalizedString("done: %@",
                                         comment: "accessibility label for finished todo item")
        let label = NSString.localizedStringWithFormat(template as NSString, title)
        return label as String
    }
    
    static var FinishedTitlePrefix: String {
        return titlePrefixedToIndicateFinished(title: "")
    }
    
    func isFinishedTodoCellLabel(label: String) -> Bool {
        return label.hasPrefix(Accessibility.FinishedTitlePrefix)
    }
    
}

# Predefined BDD Style Step for XCFit

The XCFit predefined Steps are grouped by

* Application Launcher Steps
* User Actions
* Waiter Actions
* Assertions

## Application launcher Steps

          givenILaunchedApplication()
          whenITerminatedApplication()
          givenILaunchedApplicationWithArguments(launchArguments: [[String]] = [])

## User Actions

           whenITap(on element: XCUIElement)
           whenIDoubleTapOn(XCUIElement)
           whenItypeTextIntoTextField(textField: XCUIElement, text: String)
           whenIActOnAlert(alertTitle: String, alertButton: String)
           whenIAllowSystemAlert(alertDescription: String)
           whenISlideASlider(by normalisedValue: CGFloat)
           whenISelectAItemFromPicker(item: CGFloat)
           whenIClickLinkFromWebView(linkText: String)
           whenIPressElementForDuration(_ element: XCUIElement, duration: TimeInterval)
           whenIPressOnElementAndDragToOtherElement(_ element: XCUIElement, destinationElement: XCUIElement, duration: TimeInterval)
           whenIClickElementForDuration(_ element: XCUIElement, duration: TimeInterval)
           whenIClickOnElementAndDragToOtherElement(_ element: XCUIElement, destinationElement: XCUIElement, duration: TimeInterval)

## Waiter Actions

           whenIexpectElementToAppear(XCUIElement)  
           whenIexpectElementTimeOut(XCUIElement)
           whenIexpectElementIncorrectOrder(XCUIElement)
           whenIexpectElementInvertedFulfillment(XCUIElement)         

## Assertions

           thenIShouldSee(XCUIElement)
           thenElemenShouldHavePlaceholderValue(_ element: XCUIElement, _ value : String)

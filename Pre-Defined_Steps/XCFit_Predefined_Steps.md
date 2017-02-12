# Predefined BDD Style Step for XCFit

The XCFit predefined Steps are grouped by

* Application Launcher Steps
* User Actions
* Waiter Actions
* Assertions

XCUIElement value needs to be replaced by locator from your Application.Some of the values of String also need to replaced.

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
           whenIPressElementForDuration(XCUIElement, duration: TimeInterval)
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
           thenElemenShouldHavePlaceholderValue(XCUIElement,  String)
           thenElementShouldHaveTitle(XCUIElement, String)
           thenElementShouldBeEnabled(XCUIElement)
           thenElementShouldBeVisible(XCUIElement)
           thenElementShouldBeHittable(XCUIElement)
           thenElementShouldSelected(XCUIElement)
           thenIShouldSeeAnAlert()

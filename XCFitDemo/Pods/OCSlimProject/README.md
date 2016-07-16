# OCSlimProject

[![CI Status](http://img.shields.io/travis/paulstringer/OCSlimProject.svg?style=flat)](https://travis-ci.org/paulstringer/OCSlimProject)
[![Version](https://img.shields.io/cocoapods/v/OCSlimProject.svg?style=flat)](http://cocoapods.org/pods/OCSlimProject)
[![License](https://img.shields.io/cocoapods/l/OCSlimProject.svg?style=flat)](http://cocoapods.org/pods/OCSlimProject)
[![Platform](https://img.shields.io/cocoapods/p/OCSlimProject.svg?style=flat)](http://cocoapods.org/pods/OCSlimProject)


###OCSlimProject is a lightweight Xcode project template and set of scripts for creating fast, rock solid, non UI based Acceptance Tests on iOS and OS X using [Fitnesse](http://fitnesse.org).


### Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first. 
Check out this [video from NSLondon](http://stringerstheory.net/nslondon-video/) to see it in action.

### Requirements
- Xcode 7
- [Java 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) (required for Fitnesse)

### Installation

OCSlimProject is available to your own projects through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OCSlimProject"
```

## How to Use in your own Project

* Download OCSlimProject
* Run ```$ make```. This adds the Xcode project templates for creating Acceptance Test targets within Xcode (iOS & OS X).
* Add an 'AcceptanceTests' target to your Project using the Acceptance Test templates now installed under the Test project categories
* Using CocoaPods link OCSlimProject to your 'AcceptanceTests' target with the following Podfile entry
    
	```
    target 'AcceptanceTests' do
	    pod 'OCSlimProject'
    end
	```
* Run either ```pod install``` or ```pod update``` as needed
* Build the 'AcceptanceTests' target to generate the Application (repeat this after each code change)
* Launch Fitnesse by running the script ```./LaunchFitnesse``` that's generated automatically in your project's root directory
* Follow the prompt to download [Fitnesse](http://www.fitnesse.org/FitNesseDownload) to the root of your project
* Copy the folder at OCSlimProject/Example/FitNesseRoot/OCSlimProjectExamplePage into your project's own FitNesseRoot folder
* With Fitnesse running, check out the [example](http://localhost:8080/CocoaSlimExamplePage) provided in Fitnesse.
* You're now ready to start writing [Acceptance tests and Fixtures](http://stringerstheory.net/acceptance-testing-with-ios/)  in Obj-C or Swift and excercising them with Fitnesse.


# Acknowledgements
The owner of this repository takes no credit for the following included resources (except for the ones credited to the owner). This is a convienient lightweight wrapper either inspired by or using these resources together with some project glue. The aim has been to automate the process of setting up Xcode projects so as to more easily be able to use 'ocslim' and integrate with Fitnesse. 

### Fitnesse
Created by: Fitnesse.org

<http://fitnesse.org>

### OCSlim, RunTestsTargetWithSlimPort
Created by: Erik Meyer, 8th Light 

<https://github.com/ericmeyer/ObjectiveCSlim>

<https://github.com/dougbradbury/cslim/tree/ocslim>

### ios-sim
Created by: Phonegap

<https://github.com/phonegap/ios-sim>

### exportenv.sh
Created by: Jon Reid

<https://github.com/jonreid/XcodeCoverage>

### Xcode Project Templates, LaunchFitnesse
Created by: Paul Stringer

<https://github.com/paulstringer/Slim-iOS-TestRunner>


### License
OCSlimProject is available under the MIT license. See the LICENSE file for more info.
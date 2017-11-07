#### XCFit Project Details
------------------------------------------------------
[![Version](https://img.shields.io/cocoapods/v/XCFit.svg?style=flat&label=pod)](http://cocoapods.org/pods/XCFit)
[![CocoaPods](https://img.shields.io/cocoapods/at/XCFit.svg)]()
[![CocoaPods](https://img.shields.io/cocoapods/dt/XCFit.svg?label=pod-downloads)]()
[![GitHub release](https://img.shields.io/github/release/Shashikant86/xcfit.svg?label=git-release)]()
[![RubyGem](https://img.shields.io/gem/v/xcfit.svg?label=gem-version)]()
[![Gem](https://img.shields.io/gem/dt/xcfit.svg?label=gem-downloads)]()
[![License](https://img.shields.io/cocoapods/l/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![Platform](https://img.shields.io/cocoapods/p/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)

#### XCFit Continuous Integration Status
------------------------------------------------------
[![CI Status](http://img.shields.io/travis/Shashikant86/XCFit.svg?style=flat&label=travisci)](https://travis-ci.org/Shashikant86/XCFit)
[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=59b9a96f1efa9600015eb138&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/59b9a96f1efa9600015eb138/build/latest?branch=master)
![BitRise](https://www.bitrise.io/app/c8bfbd4aa57ec9fc/status.svg?token=y5G14HOmhB_aAxVWMkHxsw&branch=master)
[![CircleCI](https://circleci.com/gh/Shashikant86/XCFit/tree/master.svg?style=shield)](https://circleci.com/gh/Shashikant86/XCFit/tree/master)

#### XCFit Author Info
------------------------------------------------------
[![Website](https://img.shields.io/website-up-down-green-red/http/shields.io.svg?label=blogs)](http://shashikantjagtap.net/)
[![Twitter Shashikant86](https://img.shields.io/badge/twitter-Shashikant86-green.svg)](http://twitter.com/Shashikant86)
[![Twitter Follow](https://img.shields.io/twitter/follow/Shashikant86.svg?style=social&label=Follow)]()


# XCFit : Full Stack iOS BDD in Xcode

**XCFit a.k.a ([XCUI](https://developer.apple.com/videos/play/wwdc2015/406/0), [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [Fitnesse](https://github.com/paulstringer/OCSlimProject) Integration Tests) is a full stack Xcode BDD framework for iOS apps written in [Swift](https://swift.org). XCFit allows us to write BDD Style API/Contract level, UI and Acceptance Tests with Swift in human readable language using tools like Given/When/Then, [Cucumber](https://cucumber.io/) and [Fitnesse](http://fitnesse.org/) in Xcode. We can still use Apple's brand new UI Testing framework (XCUI) under the hood of XCFit and Cucumberish. XCFit provides automated Xcode templates to setup skeleton of BDD which are available on [Homebrew](http://brew.sh), [RubyGem](https://rubygems.org/gems/xcfit). XCFit also packaged as Swift Framework to provide pre-defined BDD Steps written in Swift for Protocol Oriented BDD. XCFit Swift framework is available on [CocoaPods](http://cocoadocs.org/docsets/XCFit), Carthage and Swift Package Manager.**

> Important Note : XCFit does not support macOS application.

### XCFit


* [XCFit : Full Stack iOS BDD in Xcode](#xcfit--full-stack-bdd-in-xcode)
   * [XCFit Features](#xcfit-features)
   * [Tech &amp; Software Requirements](#tech--software-requirements)
   * [Installation](#installation)
   * [XCFit Swift Framework](#xcfit-swift-framework--protocol-oriented-bdd)
   * [Setting Cucumberish BDD Scenarios in Xcode](#setting-cucumberish-bdd-scenarios-in-xcode)
   * [Advide on using pre-defined BDD Steps](#advise-on-using-pre-defines-bdd-style-steps)
   * [Fitnesse for iOS: Acceptance/Contract Tests](#fitnesse-for-ios-acceptancecontract-tests)
   * [Continuous Integration with Xcode Server](#continuous-integration-with-xcode-server)
   * [XCFit: Swift Package Manager](#xcfit-swift-package-manager)
   * [Quick Demo with Example App](#quick-demo-with-example-app)
   * [Step By Step Video Demo](#step-by-step-video-demo)
   * [Acknowledgements](#acknowledgements)
   * [Author](#author)
   * [TODO](#todo)
   * [LICENSE](#license)
   * [Contributing](#contributing)

# XCFit Features
***
  -  You can now write Given When Then (Gherkin), Predefined BDD Steps and Decision Table in Xcode. In Short, you can do BDD in Xcode for your iOS app.   
  -  XCFit is purely in Swift so no need to use other languages like Ruby, Java, Python to write acceptance and UI tests for iOS.
  -  XCFit provides automated Xcode Target Templates for Protocol Oriented BDD, Page Object Pattern, Cucumberish, Fitnesse and Page Object Pattern(XCUI) targets which reduce hectic Xcode configuration steps. It also arrange code in Xcode groups.
  - XCFit will setup Xcode Templates with skeleton code and provide BDD Style Steps with Swift Framework which is available on Cocoapods, Carthage and Swift Package Manager.  


  ### XCFIT & Other Frameworks

  * **XCFit- Xcode Templates and Swift Framework for Protocol Oriented BDD and Paget Objects**

  XCFit provides templates for Protocol Oriented BDD using 'Protocol BDD Bundle' and  [Page Object Pattern](http://martinfowler.com/bliki/PageObject.html) for Apple's [XCUI Test](https://developer.apple.com/videos/play/wwdc2015/406/) using 'XCUI POM Test Bundle' Templates. We can get pre-defined BDD steps by using XCFit Swift Framework from [CocoaPods](http://cocoadocs.org/docsets/XCFit), Carthage and Swift Package Manager.

  * **Cucumberish BDD Framework and Cucucmber Style Xcode Templates(Optional Objective-C)**

  XCFit setup [Cucumber](https://cucumber.io) style BDD framework with "[Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) UI Test Bundle' Templates.
  * **Fitnesse Acceptance Tests for iOS using OCSlim Project (Optional Objective-C)**

  XCFit allows us to setup [Fitnesse](http://fitnesse.org/) style decision table test framework with [OCSlimProject](https://github.com/paulstringer/OCSlimProject) using 'Acceptance Tests  Bundle' templates.


###   Where to get XCFit Swift Framework and XCFit Xcode Templates

#### XCFit Swift Framework

* **CocoaPods** -- [XCFit-CocoaPods](http://cocoadocs.org/docsets/XCFit) : XCFit Swift Frameworks and BDD Style predefined steps for the iOS App to support Protocol Oriented BDD.
* **Carthage** -- You can install XCFit Swift Framework with Carthage as well for iOS Projects
* **Swift Package Manager** -- Swift Package Manager doesn't support iOS projects yet but XCFit is compatible with Swift Package manager as well.

#### XCFit Templates

* **Homebrew** - We can tap 'shashikant86/homebrew-taps' and Install XCFit to download Xcode Templates

* **RubyGems**  -- [xcfit-RubyGem](https://rubygems.org/gems/xcfit) to get automated Xcode Templates

The Rubygem method is preferred.


# Tech & Software Requirements

XCFit is pure Swift but other libraries like Fitnesse and Cucumberish need some additional softwares.

**Hardware**

You must have Mac Operating System with OSX/MacOS Sierra or above.

**Software**


* **[Xcode 9](https://developer.apple.com/xcode/)**
   - XCFit 4 only Supports Xcode 8.3 and above however XCFit 3 can be used with **Xcode 8.2**
* **[Swift 4](https://swift.org/download/)**
   - XCFit currenly support Swift 3.0 and Swift 3.1.   
* **[Ruby](https://www.ruby-lang.org/en/)**
   - Ruby is required to setup XCFit templates either using Homebrew or Rubygem. Use [RVM](https://rvm.io/) for GEM management. Ideally Ruby > 2.X. You can use system Ruby with sudo.   
* **[Curl on Mac](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/curl.1.html)**
   - Might be pre-installed but worth double checking.
* **[Homebrew](http://brew.sh)**  Optional   
* **Fitnesse - Optional** : You might need to have [iOS-Sim](https://www.npmjs.com/package/ios-sim), [Java](https://www.java.com/en/) if you want to use Fitnesse.


---

# Installation


XCFit installation has two steps.


* **Xcode Template Installation**


This will install Xcode Templates with skeleton code to support BDD in iOS app. The templates are XCUI based Protocol-oriented BDD templates,  Page Object Templates, Cucumberish BDD Templates and OCSlim Fitnesse Templates (optional). The templates can be installed with [xcfit-RubyGem](https://rubygems.org/gems/xcfit) or [Homebrew](http://brew.sh). You need to select only one method of installtion. The rubygem method is preferred.  

* **Framework Installation**

XCFit Swift Framework provides pre-defined BDD Style steps with XCUITest to support Protocol-oriented BDD and writing tests using Page Object pattern. The supporting Frameworks like Cucumberish and OCSlim which can be used to write BDD Steps. XCFit Swift Framework is available on [XCFit-CocoaPods](http://cocoadocs.org/docsets/XCFit), Carthage and Swift Package manager. [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [OCSlimProject](https://github.com/paulstringer/OCSlimProject) are available on Cocoapods.


## Template Installation

XCFit templates can be installed using Rubygem.

#### XCFit RubyGem Installation

If you can't use HomeBrew for some reason then XCFit can be installed using [RubyGems](https://rubygems.org/). This will set our Xcode with BDD templates for XCFit and Cucumberish

       $ gem install xcfit

You need to use with 'sudo' if you are using system (pre-installed) Ruby(2.0). XCFit gem will be used to set all the Xcode Templates for Xcode.

You can choose any of the above method. Rubygems method is prefered.


### Setup Xcode Templates

In existing app or brand new app, we have to enable the Xcode templates for targets to speed up the
##### Xcode Templates for XCFit

To setup Templates for Xcode 8 for XCUI ptotocol-oriented BDD, Cucumberish target and Gherkin File Type.


```sh

$ xcfit setup_xcode_templates


```

-  This will add couple of templates to your Xcode for iOS apps. In your app if you go to 'File--->New--->Target'

You will see new option for iOS i.e 'XCFit'. Once Clicked on it. You will see Protocol BDD, Cucumberish UI and Fitnesse Acceptance Tests. XCUI POM, Fitnesse Acceptance Unit Test bundles.



## Framework Installation

XCFit, Cucumberish or OCSlimProject Framework can be installed using Cocoapods. XCFit and Cuucmberish can be installed using Carthage as well.

### Cocoapods

#### Use XCFit Template Podfile

Cocoapods is quicker and more automated than Carthage. We can create `Podfile` and add specific dependency for the target or  we can use XCFit template `Podfile` using command.

           $ xcfit setup_xcfit_podfile

This will create a Podfile, you need to replace your XCFIT, CUCUMBERISH or FITNESSE target names as required.

#### Manual Cocoapods Installtion

We can install XCFit Cocoapods depending on Swift version we are using  
Latest version should support

```ruby
    target '$_YOUR__TARGET' do
      pod 'XCFit'
    end
```
You can use any of the method above to setup `Podfile`.

Now that, we have `Podfile` setup, we can install dependencies using command

```sh
$ pod install
```

You need to close the existing Xcode session and Xcode Workspace .xcworkspace next time.

### Carthage

XCFit and Cucumberish can be installed as Cartahge. We need to create `Cartfile` in the root of the project. Depending on which version of Swift you are using, we can use different tag
You can get latest tag to work with Swift 3.1 then `Cartfile` can have following

             github "Shashikant86/XCFit"

Now, we can fetch and build Carthage Dependencies using following command.

             $ carthage update --platform iOS

This will checkout and build XCFit frameworks then we can manually drag those frameworks in the `Build Phases` of the test targets. This will create 'Carthage' directory with built framework. We need to manually drag and drop this to our XCUIPoMTest' target build settings. On your application targets’ “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop each framework you want to use from the Carthage/Build folder on disk. On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script in which you specify your shell (ex: bin/sh), add the following contents to the script area below the shell:


        /usr/local/bin/carthage copy-frameworks

and add the paths to the frameworks you want to use under “Input Files”, e.g.:


         $(SRCROOT)/Carthage/Build/iOS/XCFit.framework                



You can choose any of the above method but Cocoapods is easy and less manual.

### Swift Package Manager

#### ==== Please Note that Swift Package Manager doesn't support iOS at the moment =====

XCFit can be installed with Swift Package Manager however Swift Package Manager isn't officially supported for iOS so we can use XCFit only for the standalone Libraries. We need to create `Package.swift` file with following content.
```
import PackageDescription

let package = Package(
    name: "XCFit",
    dependencies: [
  .Package(url: "https://github.com/Shashikant86/XCFit.git", majorVersion: 4.0.0),
]
)
```
Now we can use fetch XCFit using

            $ swift package fetch

We can build, test package using the Commands available for the Swift Package Manager.            



---
# XCFit Swift Framework : Protocol Oriented BDD
## Protocol Oriented BDD(Recommended)

You can read step by step tutorial on my blog on Protocol-Oriented BDD [here](http://shashikantjagtap.net/introducing-protocol-oriented-bdd-swift-ios-apps/)

XCFit template supports Protocol Oriented BDD. Swift is a protocol oriented language and we don't want to miss the point of Protocol, Extensions and Enums. To setup template. You can read step by step tutorial on my blog on Protocol-Oriented BDD[ here](http://shashikantjagtap.net/introducing-protocol-oriented-bdd-swift-ios-apps/)

- From Xcode, create a new app(Or use existing app) and select File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'Protocol Oriented BDD Bundle'

- Once Clicked Xcode will create UI testing target with properly structured Xcode Groups and required files. You can then make physical directories on Disk Or change the folder/group structure as per your need.

- You may want to delete autogenerated UI test from Apple's standard template.

- You don't have to so any setting to run those demo XCUI tests. Just CMD+U and You are good to go !

### What's in the Protocol Oriented BDD Template ?

* **Feature.swift**

It's your feature will all the requirements which can be written as Acceptance tests

* **FeatureSteps.swift**

It's extension on the Feature where you need to implement step definition in Given When Then format

* **FeatureElements.swift**

All the XCUIElements for that Feature.

* **YOUR_TARGET_Test.swift**

This is test where you call Given When Then from Extensions. You can import `XCFit` framework and extend this class 'XCFit' and also confirms to 'Feature' protocol

* **UITestBase.swift**
This is a base class for all the Test. Once XCFit imported then we can extend this class with XCFit to get the pre-defined steps.

## Getting XCFit Framework for pre-defined BDD Style steps

You can get XCFit Framework easily with methods mentioned above. If you choose decided to use Cocoapods then create `Podfile` and add specific dependency for the target
Cocoapods is more automated than Carthage. We can create `Podfile` and add specific dependency for the target or  we can use XCFit template `Podfile` using command.

           $ xcfit setup_xcfit_podfile

This will create a Podfile, you need to replace your target names as required and then follow the instructions above. 



## Import XCFit & Use Predefined Steps

There are some predefined XCFit steps we can use by importing `XCFit` and extending out test class to `XCFit`. There are plenty of Pre-Defined BDD Style Steps available [here](https://github.com/Shashikant86/XCFit/blob/master/Pre-Defined_Steps/XCFit_Predefined_Steps.md). You can use predefined steps wherever they make sense however it's fairly easy to write your own.

#### Using Steps inside Protocol Oriented BDD pattern

You can simply import `XCFit` inside the `UITestBase` class and extend it to XCFit. You can also use `FeatureSteps.swift` to implement or override some steps. You can read step by step tutorial on my blog on Protocol-Oriented BDD [here](http://shashikantjagtap.net/introducing-protocol-oriented-bdd-swift-ios-apps/)

# Practical Demo: Watch Youtube Video

[![Alt text](https://img.youtube.com/vi/m2u0CGiwV_8/0.jpg)](https://www.youtube.com/watch?v=m2u0CGiwV_8)


### I would strongly recommend to use Protocol Oriented Approach for BDD and you can ignore the below mentioned patterns 


---
## Page Object Pattern

XCFit templates gives an option to use very polular [Page Object Pattern](http://martinfowler.com/bliki/PageObject.html) with Apple's Xcode UI Testing framework. You can install templates and start using the code straight way, no need to use framework unless you want to use pre-defined BDD style tests.


## Setup 'Page Object Test bundle' Target

- From Xcode, create a new app(Or use existing app) and selct File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'Page Object Test Bundle'

- Once Clicked on the target e.g 'XCUI POM Test Bundle' Xcode will create UI testing target with properly structured Xcode Groups and required files. You can then make physical directories on Disk Or change the folder/group structure as per your need.

- You may want to delete autogenerated UI test from Apple's standard template.

- You don't have to so any setting to run those demo XCUI tests. Just CMD+U and You are good to go !


### What's in the XCUI POM Template ?

* **YOUR_APP_TARGETPageObjectTests.swift**

This file is at the base of the target. It's exactly same file that Apple's XCUI Test generate at first. You may use it for recording the tests or simply delete it if not needed.

* **Screens**

This is groups where we can abstract logic of every screen in the app. Example file are 'HomeScreen.swift' and 'BaseScreen.swift' This assumes that your apps is made up of multiple screens. You can write individual screen class which extend BaseScreen. All the functionality related to screen can be included in this class.


* **Tests**

This group has all the test for our app. Currently demo template has two tests 'HomeScreenTest.swift' and 'ProtocolOrientedTest.swift'. This examples shows how XCUI test can be implemented in the Object Orinted way and Protocol oriented way.

* **TestBase**

Testbase is group where we can abstract all setup, teardown and common stuff in the base class. Every Screen then use this class as base. You can add more stuff as needed e.g Fixtures, Launch Arguments



#### Using Steps in Page Object Pattern

You can simply import `XCFit` inside the test class and extend it to XCFit

You will get access to lots of predefined BDD style human readable steps. It's not mandatory to use those steps unless you wish.

**Don't like Pre-defined steps, you can easily override the steps, covered in the later section [here](#advise-on-using-pre-defines-bdd-style-steps)**



## Setting Fastlane for XCFit

[Fastlane](https://fastlane.tools/) is a awesome tool for iOS Continuous Delivery which automates most of the iOS development tasks. We can use it to run tests written using XCFit, We can setup sample `Fastfile` using XCFit command


           $ xcfit setup_xcfit_fastfile

This will create template Fastfile with all the required lanes. You can replace the YOUR_SCHEME, WORKSPACE and other variables as required. We can then run

           $ fastlane xcfit

This will run all our tests using Fastlane that will be easy to plug it with any CI server.  



---


# Setting Cucumberish BDD Scenarios in Xcode

## Setup 'iOS UI Cucumberish Test Bundle' Target

- From Xcode, create a new app(Or use existing app) and selct File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'Cucumberish UI Test Bundle'

- Once Clicked on the target e.g 'Cucumberish UI Test Bundle' Xcode will create UI testing target with all the required files with Bridging header for Cucumberish UI Testing. It create Page Object Pattern with all required files with screens, steps definitions and Cucumberish initialiser swift file.

Let's see what is inside the Cucumberish templates.

### What's in the Cucumberish Template ?

* **YOUR_CUCUMBERISH_TARGET.swift**

This file is at the base of the target. This initiate Cucumberish for project. We need to register all step definitions in this file.
* **Screens**

This is groups where we can abstract logic of every screen in the app. Example file are 'HomeScreen.swift'.

* **Step_Definitions**

This groups has all the step definitions related to screen. Example file 'HomeScreenSteps.swift'. Once implemented we need to register it in the initialiser file mentioned above.

* **Common**

This group has common code like extensions and common steps. The example file 'CommonStepDefinitions.swift' has some steps that can be used in the feature file.

* **Supporting Files**

This groups all the Objective-C headers and Bridging headers needed to get Cucumberish working with Swift.

### What's not in the Cucumberish Template

* **Features Directory**

We don't have 'Features' directory in the template because it needs to have directory on the disk and should be added to Xcode as 'Folder Reference' not Group.

 - Create a Direcory called "Feature"

 - Now Add sample Gherkin Feature File to 'Features' directory either by File->New->Gherkin Or Just add it using your favourite text editor e.g demo.feature with content

```
Feature: Demo App Feature

Scenario: Demo Scenario

Given the app is running

```

- Now Drag and Drop 'Features' directory to Xcode Cucumberish target

- Select only '**Create folder references**' Option. ** Do Not Select 'Create groups' Or 'Copy items if needed**'

Now, We have to get cucumberish framework either using Carthage or Cocoapods.  

## Get Cucumberish Framework

Cucumberish is one of the dependency of XCFit so you will get Cucumberish with XCFit while using it with Cocoapods however Carthage need more setup.

### Getting Cucumberish CocoaPod into our Target

In order to get [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish/tree/master/Cucumberish) source content. There are few ways we can do that

- **Cocoapods**

Create a 'Podfile' if you don't have already. In your Podfile, add following Pod entry and update/install pod

* **Swift 3.1**

You can doenload latest version 4.0.0 to work with Swift 3.1

```ruby
    target '$_YOUR__TARGET' do
      pod 'XCFit'
    end
```

Now, we can install dependencies

```sh
$ pod install
```


Now close the existing Xcode session and Xcode Workspace `.xcworkspace` next time.

We now have everything we needed to run demo Cucumber demo test. Update Scheme if don't want to run unit test or other type of tests.
and press 'CMD+U'

Congratulations !! You have just ran your first Cucumber BDD Scenario in the Xcode.

#### Create Separate Scheme if needed

XCFit adds 'Cucumberish' target to existing Scheme. You can remove that target and run separate scheme to keep it independent from Unit tests. Make sure you make the new scheme executable for Running.

### Getting Cucumberish using Carthage

Once you have setup XCFit Cucumberish templates, we need to get Cucumberish framework. In order to get [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish/tree/master/Cucumberish) using Carthage, we need to create `Cartfile` with following content

* **Swift 3.1**

You can get Cucumberish

             github "Ahmed-Ali/Cucumberish"


Now install, Carthage frameworks using commamnd

                 $ carthage update --platform iOS

This will chekcout and build XCFit and Cucumberish frameworks inside the `Carthage` directory. Now we need to manually drag and drop frameworks in the `build phases` of the Cucumberish target.

* From the build phases of the cucumberish target select ` Link Binary with Libraries` and drag `Cucumberish.framework` from `Carthage/Build/iOS` directory
* Add `New Copy Files Phase` and select destination as 'Frameworks' and Add Cucumberish Frameworks from `Carthage/Build/iOS` directory. Select 'Create Group' and 'Copy if needed' when prompted.  

Once drag and drop is don and we have "Features" directory then we are ready to launch our BDD Style tests using 'CMD+U'. The entire Carthage Setup looks like this

## Cucumberish Pre-Defined Steps

There are some pre-defined Cucumberish Steps available to use directly without any need to implement in the step definition. You can see list of steps [here](https://github.com/Shashikant86/XCFit/blob/master/Pre-Defined_Steps/Cucumberish_Predefined_Steps.md). You already have those steps in the 'CommonStepDefinitions.swift' file. You can modify the steps as per your project need or add your own.
**Don't like Pre-defined steps, you can easily override the steps, covered in the later section [here](#advise-on-using-pre-defines-bdd-style-steps)**

# Advise on using Pre-Defines BDD Style Steps

XCFit has pre-defined steps for both XCFit Swift framework as well as Cucumberish framework.

* **[XCFit Pre-Defined BDD Style Steps](https://github.com/Shashikant86/XCFit/blob/master/Pre-Defined_Steps/XCFit_Predefined_Steps.md)**
* **[Cucumberish Pre-Defined BDD Style Steps](https://github.com/Shashikant86/XCFit/blob/master/Pre-Defined_Steps/Cucumberish_Predefined_Steps.md)**

It's recommended to use your own steps as predefined steps might not read well for your project needs. Pre-defined steps gives you guidance on how to implement your own step, however you can use pre-defined steps wherever they make sense to avoid duplication.

## Extending Predefined Steps.

You can easily override pre-defined BDD Style Steps by writing Swift Extensions and Changing Common step definitions in the Cucumberish 'CommonStepDefinitions.swift' file.

### Extending BDD Step from XCFit Framework

XCFit has a step **`givenILaunchedApplication()`** and you are not happy about the wordings. You can easily write and Extension and your steps like this :

```

extension XCFit {

    func givenMyiOSApplicationHasBeenLaunched() {
         XCUIApplication().launch()
    }

}
```

Now you can use your own **`givenMyiOSApplicationHasBeenLaunched()`** step anywhere inside the Test target.

### Extending/Changing Cucumberish BDD Steps

XCFit template for setting Cucumberish has the Swift code for the all [pre-defined Cucumberish BDD Steps](https://github.com/Shashikant86/XCFit/blob/master/Pre-Defined_Steps/Cucumberish_Predefined_Steps.md) inside the **'CommonStepDefinitions.swift'** file. You just need to add your own steps accordingly or change the exiasting one.  


---


# Fitnesse for iOS: Acceptance/Contract Tests

If you really wanted to get more information about Fitnnese for iOS, please follow documentation on [OCSlim](http://paulstringer.github.io/OCSlimProject/) project. XCFit adopted the framework as dependeny to make it full stack BDD and might not be able to keep up with that for long. It's worth navigate to [OCSlim Project](http://paulstringer.github.io/OCSlimProject/) from this point but I will cover basic setup here.
[Fitnesse](http://fitnesse.org/) is fully integrated standalone wiki and acceptance testing framework for BDD Style testing. As of now we have seen Cucumber and Page Object pattern test frameworks.  We will cover basic setup as part of this document.
Before get started make sure, you have Fitnesse Xcode templates installed

## Setup 'Acceptance Test' Target template

- From Xcode, create a new app(Or use existing app) and select File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'iOS Acceptance Tests '

- Once Clicked on the target e.g 'OS Acceptance Tests' Xcode will create new target with all required files and groups for Acceptance testing

- Select 'Acceptance Test' Scheme from Xcode and try to build by pressing CMD+B

- The build might fail as we need fix some **Swift3** related issue as well as we need to add **XCFit/OCSlimProject** Pod to the to the podfile.



1. To Fix Swift Issue : Just Click on ‘Edit-> Convert-> To Current Swift Syntax
2. To Fix Pod issue : Add 'OCSlimProject' for AcceptanceTests target

```ruby
    target 'AcceptanceTests' do
      pod 'OCSlimProject'
    end
```



```sh
$ pod install
```

Now, You should be able to build 'Acceptance Tests" target.

You should also note that, the script 'Launch Fitnesse' has been created in the base of the project. Launch the fitness by exucuting that script from command line

       $ sh Launch Fitnesse

 The browser will popup with example test. You should be able to excute that suite and see then running and passing

 ![image](https://github.com/Shashikant86/xcfitgif/blob/master/FitnesseAcceptance.gif)

 If you get any errors at this stage, please confirm that you have Java as well as ios-sim node package installed.

 So, Congratulations again.. You have just executed Fitnesse test fro browser which is talking to your app.


## Setting up Fitnesse Acceptance Target with XCTest

You can also setup Fitnesse Acceptance Tests but you need to use Cocoapods for this target.

You can find detailed blog post on [Dzone](https://dzone.com/articles/integrate-fitnesse-with-xctest-using-xcode8)

#### Add Acceptance and Acceptance Unit Test Target to Project

We have all the predefined targets for FitNesse. Just add “Acceptance Tests” target from the template and “AcceptanceUnitTests” target from the bundle. You will need “FitNesse Suite page name” to create this target but just put “OCSlimProjectExamplePage” there for now . Add your ‘AcceptanceTests’ target as a ‘Target Dependancy’ of this new target in Build Phases. This ensures that it the latest code has been built prior to the tests being run.


#### Add Pod Dependencies
We need to create a “Podfile” at the root of the project with the following content.

```ruby
target 'AcceptanceUnitTests' do     
   pod 'OCSlimProjectTestBundleSupport'
end
```

Now, we can run ‘pod install’ at this stage and close the current Xcode session and open project workspace.

#### Build Acceptance Tests Target
At this stage, we should be able to build the “Acceptance Tests” target. If you are using Xcode8, you might see some warning related to the Swift3 Syntax. Just Click on ‘Edit-> Convert-> To Current Swift Syntax

Now you should be able to build an “Acceptance Tests” target. Once, build is successful, you should see “LaunchFitnesse” script is generated in the root of the project. We can launch and execute the fitness test as shown below.


#### Test AcceptanceUnitTests Target

Now if you select “AcceptanceUnitTarget” and press CMD+U.


Now we can see that FitNesse tests are running as shown above.  We can add this to main scheme to make sure we are running it after the unit tests to follow proper development workflow. We can build and run it as our normal unit tests.


# Continuous Integration with Xcode Server

You can read my detailed blog on how to setup Xcode Server for XCFit package on Dzone  [Xcode Continuous Integration with Xcode Server](https://dzone.com/articles/xcode-continuous-integration-with-macos-server)

# XCFit: Swift Package Manager

Swift Package Manager doesn't officially support iOS projects (Xcode Templates) but We can use it for building packages. XCFit will be having full on support for XCUI Test helpers so that we can use Apple's XCUI Test Framework painless to use. There is [sample swift package](https://github.com/Shashikant86/XCFitDemoSwiftPackage) on Github to test XCFit
Full Documetation and API implementation still in progress. You can grab it like this  

```
import PackageDescription

let package = Package(
    name: "XCFit",
    dependencies: [
  .Package(url: "https://github.com/Shashikant86/XCFit.git", majorVersion: 4.0.0),
]
)
```



# Quick Demo with Example App

You can clone the existing repo which has a demo app we can run Unit, Fitnesse and Cucumbertish Tests as XCTest


       $ git clone https://github.com/Shashikant86/XCFit4Demo
       $ cd XCFit4Demo
       $ open XCFit4Demo.xcworkspace/

 Run XCUI and Cucumberish test with Xcode using **'XCFit4Demo'** Scheme, press "cmd + U". You can also use "**AcceptanceUnitTests"** target/scheme and press "CMD+U" to run fitnesse tests. You can script it with `xcodebuild` or Fastlane Tools.



# Step by Step Video Demo: OLD Version

You can watch step by step video demo on Youtube. Click the link below

 [![Alt text](https://img.youtube.com/vi/7gqPxy6UVRw/0.jpg)](https://www.youtube.com/watch?v=7gqPxy6UVRw)

# Acknowledgements

Big Thanks to
  - [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) : Provide native [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) parser for iOS Apps to enable BDD in Xcode using Given When Then. Yay!
  - [OCSlimProject](https://github.com/paulstringer/OCSlimProject) : Provide Xcode Templates to enable BDD with Decision Tables using Fitnesse


# Author

Shashikant86, shashikant.jagtap@icloud.com


# LICENSE

Copyright © 2014 Shashikant Jagtap, http://shashikantjagtap.net

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Contributing

1. Fork it ( https://github.com/Shashikant86/XCFit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

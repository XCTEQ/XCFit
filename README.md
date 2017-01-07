[![CI Status](http://img.shields.io/travis/Shashikant86/XCFit.svg?style=flat)](https://travis-ci.org/Shashikant86/XCFit)
[![Version](https://img.shields.io/cocoapods/v/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![License](https://img.shields.io/cocoapods/l/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![Platform](https://img.shields.io/cocoapods/p/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)

# XCFit : Full Stack BDD in Xcode

**XCFit a.k.a ([XCUI](https://developer.apple.com/videos/play/wwdc2015/406/0), [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [Fitnesse](https://github.com/paulstringer/OCSlimProject) Integrations Tests) is a full stack Xcode BDD framework for [Swift](https://swift.org) iOS and macOS apps. XCFit allows us to write API level, UI and Acceptance Tests with Swift in human readable language using tools like [Cucumber](https://cucumber.io/) and [Fitnesse](http://fitnesse.org/) in Xcode. We can still use Apple's brand new UI Testing framework (XCUI) under the hood of Cucumberish. XCFit is fully automated solution for Cucumberish and Fitnesse. You can use 80(Fitnesse):20(Cucumberish) formula to automate Acceptance and UI Testing for better coverage and faster feedback. XCFit is available on [Homebrew](http://brew.sh), [RubyGem](https://rubygems.org/gems/xcfit),  [CocoaPods](http://cocoadocs.org/docsets/XCFit) and Swift Package Manager.**

### XCFit 2.0 has just released !

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/XCFit2Release.png)

* [XCFit : Full Stack BDD in Xcode](#xcfit--full-stack-bdd-in-xcode)
   * [XCFit Features](#xcfit-features)
   * [Tech &amp; Software Requirements](#tech--software-requirements)
   * [Installation](#installation)
   * [Setup Xcode Templates](#setup-xcode-templates)
   * [Setting Cucumberish BDD Scenarios in Xcode](#setting-cucumberish-bdd-scenarios-in-xcode)
   * [XCUI Page Object Pattern](#xcui-page-object-pattern)
   * [Fitnesse for iOS: Acceptance/Contract Tests](#fitnesse-for-ios-acceptancecontract-tests)
   * [Continuous Integration   Fastlane](#continuous-integration--fastlane)
   * [XCFit: Swift Package Manager](#xcfit-swift-package-manager)
   * [Quick Demo with Example App](#quick-demo-with-example-app)
   * [Acknowledgements](#acknowledgements)
   * [Author](#author)
   * [TODO](#todo)
   * [LICENSE](#license)
   * [Contributing](#contributing)

# XCFit Features
***
  -  You can now write Given When Then (Gherkin) and Decision Table in Xcode. In Short, you can do BDD in Xcode for your iOS app.   
  -  You can now write/Execute all your Acceptance Tests and UI Tests using Apple's brand new programming language "Swift" in Xcode. Goodbye Appium, Calabash, Frank, KIF and Goodbye Ruby,Java, Python. It's pure Swift !!
  -  XCFit provides automated Xcode Target Templates for Cucumberish, Fitnesse and Page Object Pattern(XCUI) targets which reduce hectic Xcode configuration steps. It also arrange code in Xcode groups. All happens in one command
  - XCFit will setup test frameworks within a minute and works for Xcode 8 and Xcode 7.  


  ### XCFIT allows follwing frameworks
  * **Cucumberish BDD Framework**

  XCFit setup [Cucumber](https://cucumber.io) style BDD framework with "[Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) UI Test Bundle' Templates
  * **Page Object Pattern for XCUI Test framework from Apple**

  XCFit setup [Page Object Pattern](http://martinfowler.com/bliki/PageObject.html) for Apple's [XCUI Test](https://developer.apple.com/videos/play/wwdc2015/406/) using 'XCUI POM Test Bundle' Templates
  * **Fitnesse Acceptance Tests for iOS using OCSlim Project**

  XCFit allows us to setup [Fitnesse](http://fitnesse.org/) style decision table test framework with [OCSlimProject](https://github.com/paulstringer/OCSlimProject) using 'Acceptance Tests  Bundle' templates.


### XCFit Available on

* **CocoaPods** -- [XCFit-CocoaPods](http://cocoadocs.org/docsets/XCFit) : BDD Style scenarios for iOS App

* **Homebrew** - Just do `brew tap shashikant86/homebrew-taps` and `brew install xcfit`

* **RubyGems**  -- [xcfit-RubyGem](https://rubygems.org/gems/xcfit) : Automated Xcode Templates

* **Swift Package Manager** : 2.0.0 : XCUI Test Framework Helpers


# Tech & Software Requirements

XCFit uses a number of open source projects to work properly. You need to have following

**Hardware**

You must have Mac Operating System with OSX/MacOS version > 10.9

**Software**

* **[Ruby](https://www.ruby-lang.org/en/)**
   - Use [RVM](https://rvm.io/) for GEM management. Ideally Ruby > 2.X. You can use system Ruby with sudo
* **[Xcode8](https://developer.apple.com/xcode/)**
   - Ideally Xcode 8 but works on Xcode 7 as well.
* **[RubyGems](https://rubygems.org/)**
   - RubyGem with [Cocoapods](https://cocoapods.org/) installed
* **[Curl on Mac](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/curl.1.html)**
   - Might be pre-installed but worth double checking.
* **[Homebrew](http://brew.sh)**   
* **[iOS-Sim](https://www.npmjs.com/package/ios-sim)**
  - Node Package required to launch iOS app for Fitnesse Acceptance tests.
* [**Java**](https://www.java.com/en/)
  - Java should be installed on Mac, it is required for Fitnesse Acceptance Test
* **Ruby Packages(optional)**
  - Xcpretty, Fastlane(Optional), Rake, Bundler etc

---

# Installation

XCFit can be installed using [Homebrew](http://brew.sh) or using [RubyGems](https://rubygems.org/) but it's strongly recommended to install it using Homebrew. 

## Install with HomeBrew

Assuming you have already installed [Homebrew](http://brew.sh). Let's tap the formula

`brew tap shashikant86/homebrew-taps`
Now, we can install XCFit brew package using 
`brew install xcfit`

This is recommended method to install `XCFit` over the Rubygem mentioned below.

## Install XCFit Gem
If you can't use HomeBrew for some reason then XCFit can be installed using [RubyGems](https://rubygems.org/). This will set our Xcode for BDD

       $ gem install xcfit

You need to use with 'sudo' if you are using system (pre-installed) Ruby(2.0). XCFit gem will be used to set all the Xcode Templated for Xcode 8 as well Xcode 7

# XCFit Commands

Once you installed XCFit with HomeBrew/Rubygem then you can execute 'xcfit' command from your terminal/iTerm etc etc. Example Output Looks like this :

```
$xcfit                                                                  
setup_xcode_templates:
    generate a Xcode 8 Templates for the Cucumberish and Fitnesse
  setup_xcode7_templates:
      generate a Xcode 7.x Templates. Please upgrade to Xcode 8
  setup_gherkin:
    generate Xcode Templates for the Gherkin Feature Files
  get_cucumberish:
      Downloads Cucumberish version
  version:
    prints the XCFit version
  help:
    prints more detailed help information.
```


## Install XCFit Cocoapod and Swift Package (Covered later)

Later, we need to install [XCFit](http://cocoadocs.org/docsets/XCFit) from CocoaPods to enable Cucumberish and Fitnesse test. We can also get XCFit from Swift Package Manager if we need to have additional helpers for the XCUI test framework.

---

# Setup Xcode Templates

In existing app or brand new app, we have to enable the Xcode templates for targets to speed up the things.
##### Xcode 8
To setup Templates for Xcode 8.


```sh
$ xcfit set_xcode_templates

```

##### Xcode 7

To setup Templates for Xcode 7.x.


```sh
$ xcfit set_xcode7_templates

```

-  This will add couple of templates to your Xcode for iOS and macOS apps. In your app if you go to 'File--->New--->Target'

You will see new option for iOS i.e 'XCFit'. Once Clicked on it. You will see Cucumberish UI and Fitnesse Acceptance Tests. XCUI POM, Fitnesse Acceptance Unit Test bundles. As shown

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/Xcode8-Templates.png)

---

# Setting Cucumberish BDD Scenarios in Xcode

## Setup 'iOS UI Cucumberish Test Bundle' Target

- From Xcode, create a new app(Or use existing app) and selct File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'Cucumberish UI Test Bundle'

- Once Clicked on the target e.g 'Cucumberish UI Test Bundle' Xcode will create UI testing target with all the required files with Bridging header for Cucumberish UI Testing. It create Page Object Pattern with all required files with screens, steps definitions and Cucumberish initialiser swift file.


![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/XCFit_CucumberishTemplates.gif)

### What's in the Cucumberish Template ?

* **YOUR_CUCUMBERISH_TARGET.swift**

This file is at the base of the target. This initiate Cucumberish for project. We need to register all step definitions in this file.
* **Screens**

This is groups where we can abstract logic of every screen in the app. Example file are 'HomeScreen.swift' and 'BaseScreen.swift'

* **Step_Definitions**

This groups has all the step definitions related to screen. Example file 'HomeScreenSteps.swift'. Once implemented we need to register it in the initialiser file mentioned above.

* **Common**

This group has common code like extensions and common steps. The example file 'CommonStepDefinitions.swift' has some steps that can be used in the feature file. It also has 'Hooks.swift' to ad cucumber hooks.

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

Here is how to do it.
![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AddFeaturesDirectory.gif)

* **Cucumberish Header Files**

We still don't have content of [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish/tree/master/Cucumberish) to be included in our project.

### Getting Cucumberish into our Target

In order to get [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish/tree/master/Cucumberish) source content. There are few ways we can do that

- **Cocoapods**

Create a 'Podfile' if you don't have already. In your Podfile, add following Pod entry and update/install pod

```ruby
    target '$_YOUR_CUCUMBERISH_TARGET' do
      pod 'XCFit'
    end
```



```sh
$ pod install
```

 You can do that easily.
![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AddPod.gif)

Now close the existing Xcode session and Xcode Workspace next time.

> **Note** There is issue with Cocoapods when you have ``'use_frameworks!'``, it will not import header files and build will fail. If you are not using Frameworks in th Podfile then this approach is OK.

- **Manual Installtion**

We can manually copy content of [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish/tree/master/Cucumberish) directory and drag to target as with option "**Create groups" and "Copy items if needed**".

Here is How to setup everything in a minute

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/XCFitStartUp.gif)

- **Carthage**

Create a `Cartfile ` with following Content

```
         github "Ahmed-Ali/Cucumberish"
```
Now run Carthage wihtout build option.

          $ carthage update --platform iOS --no-build

Now in the `Carthage/Checkout` directory has `Cucumberish/Cucumberish`. drag to target as with option "**Create groups" and "Copy items if needed**".

Here is how to do that !

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/Carthage.gif)


Please choose one of the suitable option for you.

We now have everything we needed to run demo Cucumber demo test. Update Scheme if don't want to run unit test or other type of tests.
and press 'CMD+U'

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/CucumberTest.gif)

Congratulations !! You have just ran your first Cucumber BDD Scenario in the Xcode. Now add your own :)

#### Create Separate Scheme if needed

XCFit adds 'Cucumberish' target to existing Scheme. You can remove that target and run separate scheme to keep it independent from Unit tests. Make sure you make the new scheme executable for Running.

---

# XCUI Page Object Pattern

Now, we have seen that it's failrly easy to setup BDD Style tests with Cucumberish but some people don't want that overhead of adding extra layer of Gherkin. XCFit gives an option to use very polular [Page Object Pattern](http://martinfowler.com/bliki/PageObject.html) with Apple's Xcode UI Testing framework.

## Setup 'XCUI POM Test bundle' Target

- From Xcode, create a new app(Or use existing app) and selct File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'XCUI POM Test Bundle'

- Once Clicked on the target e.g 'XCUI POM Test Bundle' Xcode will create UI testing target with properly structured Xcode Groups and required files. You can then make physical directories on Disk Or change the folder/group structure as per your need.

- You don't have to so any setting to run those demo XCUI tests. Just CMD+U and You are good to go !


![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/XCUIPOM.gif)

### What's in the XCUI POM Template ?

* **YOUR_CUCUMBERISH_TARGETPageObjectTests.swift**

This file is at the base of the target. It's exactly same file that Apple's XCUI Test generate at first. You may use it for recording the tests or simply delete it if not needed.

* **Screens**

This is groups where we can abstract logic of every screen in the app. Example file are 'HomeScreen.swift' and 'BaseScreen.swift' This assumes that your apps is made up of multiple screens. You can write individual screen class which extend BaseScreen. All the functionality related to screen can be included in this class.

* **Sections**

This group has 'HomeElements.swift' class which stores all the locators of HomeScreen in enums. Sections are defined to store locators of the screen in the form of enums. Here are some samples we can store Images, Buttons and Static Texts of the HomeScreens. We can access those enums from anywhere from the Test methods or page objects.

* **Protocols**

Swift is protocol oriented language so feel to start with Protocol per screen. This group has 'HomeProtocol.swift' file where there is way to implement protocol oriented testing. Here is example of sample protocol for the homescreen. We can implement this protocol in the XCTest method as needed or we can write some extensions to support Testing.

* **Tests**

This group has all the test for our app. Currently demo template has two tests 'HomeScreenTest.swift' and 'ProtocolOrientedTest.swift'. This examples shows how XCUI test can be implemented in the Object Orinted way and Protocol oriented way.

* **TestBase**

Testbase is group where we can abstract all setup, teardown and common stuff in the base class. Every Screen then use this class as base. You can add more stuff as needed e.g Fixtures, Launch Arguments


---

# Fitnesse for iOS: Acceptance/Contract Tests

[Fitnesse](http://fitnesse.org/) is fully integrated standalone wiki and acceptance testing framework for BDD Style testing. As of now we have seen Cucumber and Page Object pattern test frameworks. If you really wanted to get more information about Fitnnese for iOS, please follow documentation on [OCSlim](http://paulstringer.github.io/OCSlimProject/) project. XCFit adopted the framework as dependeny to make it full stack BDD. We will cover basic setup as part of this document.

## Setup 'Acceptance Test' Target template

- From Xcode, create a new app(Or use existing app) and selct File ---> New ----> Target

- Now Select 'XCFit' for iOS app and Click on 'iOS Acceptance Tests '

- Once Clicked on the target e.g 'OS Acceptance Tests' Xcode will create new target with all required files and groups for Acceptance testing

- Select 'Acceptance Test' Scheme from Xcode and try to build

- The build will fail as we need fix some **Swift3** related issue as well as we need to add **XCFit/OCSlimProject** Pod to the to the podfile.

** Watch it so far**

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AcceptanceTestsTarget.gif)

1. To Fix Swift Issue : Just Click on ‘Edit-> Convert-> To Current Swift Syntax
2. To Fix Pod issue : Add 'XCFit' for AcceptanceTests target

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

 ![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AcceptanceTestsTargetPod.gif)

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

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/FitnesseXCTest.gif)


Now we can see that FitNesse tests are running as shown above.  We can add this to main scheme to make sure we are running it after the unit tests to follow proper development workflow. We can build and run it as our normal unit tests.


# Continuous Integration + Fastlane

Now that , we have seen how to run Cucumberish, XCUIPOM, FitNesse acceptance tests from Xcode but it’s a good idea to run it with Fastlane.  We can also take control of version of Cocoapods and Fastlane by using Bundler. Let’s create a Gemfile at the root of the project with the following gem

```ruby
source "https://rubygems.org"   
gem 'cocoapods'
gem 'fastlane'   plugins_path = File.join(File.dirname(__FILE__), '.', 'Pluginfile') eval(File.read(plugins_path), binding) if File.exist?(plugins_path
```

Let’s also create directory “fastlane” and make “Fastfile” with following content

```ruby

fastlane_version "1.104.0"  
default_platform :ios   
platform :ios do   
before_all do     
   system "rm -rf ../test_reports/"     
   system "bundle install"     
   system "pod install"     
    system "bundle exec fastlane add_plugin trainer"   
end     
desc "Runs all the XCUI POM, Cucumberish tests"
  lane :xcfit_ui_test do
   scan(
   scheme: "XCFit2Demo",
   destination: 'platform=iOS Simulator,name=iPhone 7 Plus,OS=10.0',
   output_directory: "test_reports/",
   output_types: "html",
   fail_build: false
   )
  end

  desc "Runs Fitnesse Tests"
  lane :fitnesse do
   scan(
   scheme: "AcceptanceUnitTests",
   destination: 'platform=iOS Simulator,name=iPhone 7 Plus,OS=10.0',
   output_directory: "test_reports/",
   output_types: "html",
   fail_build: false
   )
  end
end
```

After running “bundle install” we should be able to run those test from command line like this :

        $ bundle exec fastlane xcfit_ui_test


![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/FastlaneXCFit.gif)

Once that done. We can have clear HTML reports genearted


# XCFit: Swift Package Manager

XCFit will be having full on support for XCUI Test helpers so that we can use Apple's XCUI Test Framework painless to use. There is [sample swift package](https://github.com/Shashikant86/XCFitDemoSwiftPackage) on Github to test XCFit
Full Documetation and API implementation still in progress. You can grab it like this  

```
import PackageDescription

let package = Package(
    name: "XCFit",
    dependencies: [
  .Package(url: "https://github.com/Shashikant86/XCFit.git", majorVersion: 2),
]
)
```



# Quick Demo with Example App

You can clone the existing repo which has a demo app we can run Unit, Fitnesse and Cucumbertish Tests as XCTest
 ```
  $ git clone https://github.com/Shashikant86/XCFit
  $ cd XCFit/XCFit2Demo
  $ open XCFit2Demo.xcworkspace
  ```
 Run Unit, Fitnesse and Cucumberish test with Xcode. "cmd + U". We can execute it using Fastlane


  ```
  $ bundle install
  $ bundle exec fastlane xcfit_ui_test
```


# Acknowledgements

Big Thanks to
  - [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) : Provide native [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) parser for iOS Apps to enable BDD in Xcode using Given When Then. Yay!
  - [OCSlimProject](https://github.com/paulstringer/OCSlimProject) : Provide Xcode Templates to enable BDD with Decision Tables using Fitnesse


# Author

Shashikant86, shashikant.jagtap@icloud.com

# TODO

 * Add More Step Definitions for Cucumberish Projects
 * Improve Swift Package with additional XCUI test helpers
 * Setting up XCFit on Apple's own CI Xcode Server

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

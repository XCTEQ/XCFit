[![CI Status](http://img.shields.io/travis/Shashikant86/XCFit.svg?style=flat)](https://travis-ci.org/Shashikant86/XCFit)
[![Version](https://img.shields.io/cocoapods/v/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![License](https://img.shields.io/cocoapods/l/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![Platform](https://img.shields.io/cocoapods/p/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)

# XCFit : Full Stack BDD in Xcode

#### XCFit a.k.a ([XCUI](https://developer.apple.com/videos/play/wwdc2015/406/0), [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [Fitnesse](https://github.com/paulstringer/OCSlimProject) Integrations Tests) is a full stack Xcode BDD framework for [Swift](https://swift.org) iOS and macOS apps. XCFit allows us to write API level, UI and Acceptance Tests with Swift in human readable language using tools like [Cucumber](https://cucumber.io/) and [Fitnesse](http://fitnesse.org/) in Xcode. We can still use Apple's brand new UI Testing framework (XCUI) under the hood of Cucumberish. XCFit is fully automated solution for Cucumberish and Fitnesse. You can use 80(Fitnesse):20(Cucumberish) formula to automate Acceptance and UI Testing for better coverage and faster feedback. XCFit is available on [RubyGem](https://rubygems.org/gems/xcfit),  [CocoaPods](http://cocoadocs.org/docsets/XCFit) and Swift Package Manager.

### XCFit Features
***
  -  You can now write Given When Then (Gherkin) and Decision Table in Xcode. In Short, you can do BDD in Xcode for your iOS app.   
  -  You can now write/Execute all your Acdeptance Tests and UI Tests using Apple's brand new programming language "Swift" in Xcode. Goodbye Appium, Calabash, Frank, KIF and Goodbye Ruby,Java, Python. It's pure Swift !!
  -  XCFit provides automated Xcode Target Templates for Cucumberish, Fitnesse and Page Object Pattern(XCUI) targets which reduce hectic Xcode configuration steps. It also arrange code in Xcode groups. All happens in one command
  - XCFit will setup test frameworks within a minute and works for Xcode 8 and Xcode 7.  

  ***

### Xcode 7 Users

If you are still XCode 7 users then please follow [this](https://github.com/Shashikant86/XCFit/blob/master/Docs/xcdoe7swift2.md) link for documentation


### XCFit Available on
CocoaPods -- [XCFit-CocoaPods](http://cocoadocs.org/docsets/XCFit)

RubyGems  -- [xcfit-RubyGem](https://rubygems.org/gems/xcfit)  

Swift Package Manager : 2.0.0

### Tech & Software Requirements

XCFit uses a number of open source projects to work properly. You need to have following

Hardware : You must have Mac Operating System with OSX/MacOS version > 10.9

Software:
* Ruby
[Ruby](https://www.ruby-lang.org/en/) - Use [RVM](https://rvm.io/) for GEM management. Ideally Ruby > 2.X. You can use system Ruby with sudo
* [Xcode8](https://developer.apple.com/xcode/) - Ideally Xcode 8 but works on Xcode 7 as well.
* [RubyGems](https://rubygems.org/) - RubyGem with [Cocoapods](https://cocoapods.org/) installed
* [Curl on Mac](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/curl.1.html) - Might be pre-installed but worth double checking.
* NodeJS and [iOS-Sim](https://www.npmjs.com/package/ios-sim)
* Ruby Packages : Xcpretty, Fastlane(Optional), Rake, Bundler.. Install with 'gem install <package_name>'


### Installation

XCFit requires [RubyGems](https://rubygems.org/) to run.

      $ gem install xcfit

You need to use with 'sudo' if you are using system (pre-installed) Ruby(2.0). XCFit gem will be used to set all the Xcode Templated for Xcode 8 as well Xcode 7

# Usage
Now that you can execute 'xcfit' command from your terminal/iTerm etc etc. Example Output Looks like this :

```
$xcfit                                                                  
Tasks:
  xcfit get_cucumberish VERSION  
  xcfit get_fitnesse             
  xcfit help [TASK]             
  xcfit set_xcode7_templates     
  xcfit set_xcode_templates      
```

## Setup Xcode Templates

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

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/Xcode8-Templates.gif)

# Cucumberish BDD Scenario

### Using XCFit Xcode Templates

#### iOS UI Cucumberish Test Bundle

- Once Clicked on the target e.g 'Cucumberish UI Test Bundle' Xcode will create UI testing target with all the required files with Bridging header for Cucumberish UI Testing. It create Page Object Pattern with all required files with screens, steps definitions and Cucumberish initialiser swift file. This has following files.  
* YOUR_CUCUMBERISH_TARGET.swift : This file is at the base of the target. This initiate Cucumberish for project. We need to register all step definitions in this file.
* Screens
This is groups where we can abstract logic of every screen in the app. Example file are 'HomeScreen.swift' and 'BaseScreen.swift'
* Step_Definitions
This groups has all the step definitions related to screen. Example file 'HomeScreenSteps.swift'. Once implemented we need to register it in the initialiser file mentioned above.
* Common
This group has common code like extensions and common steps. The example file 'CommonStepDefinitions.swift' has some steps that can be used in the feature file. It also has 'Hooks.swift' to ad cucumber hooks.
* Supporting Files
This groups all the Objective-C headers and Bridging headers needed to get Cucumberish working with Swift.

###### What's not in the Cucumberish Template
We don't have 'Features' directory in the template because it needs to have directory on the disk and should be added to Xcode as 'Folder Reference' not Group. Now Add sample Feature File to 'Features' directory either by File->New->Gherkin Or Just add it using your favourite text editor e.g demo.feature with content

```
Feature: Demo App Feature

Scenario: Demo Scenario

Given the app is running

```

Here is how to do it.
![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AddFeaturesDirectory.gif)
Thats's it for the setup. Now we need to add 'XCFit' Pod in our project to get our demo test working.

### Adding XCFit CocoaPod to Project
- Create a 'Podfile' if you don't have already.
- In your Podfile, add following Pod entry and update/install pod

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

Now close the Xcode Project and Xcode Workspace. We now have everything we needed to run demo Cucumber demo test. Update Scheme if don't want to run unit test or other type of tests.
and press 'CMD+U'

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/CucumberTest.gif)

Congratulations !! You have just ran your first Cucumber BDD Scenario in the Xcode. Now add your own :)


# Fitnesse: Acceptance Tests



Once Clicked on the target e.g 'Fitnesse Acceptance Test Bundle' Xcode will create UI tAcceptance test with all the required files with Bridging headers for the Fitnesse Acceptance Test. We will see that in details soon.

- This script also set new file type in Xcode to create new Gherking feature file

## Setting up Cucumberish UI Target

Few Steps to setup BDD Styles in Xcode8

##### Add New Target for Cucumberish

- Add new target iOS/macOS project and Select "File -> New -> Target -> XCFit -> Cucumberish UI Test Bundle". Give it a name you like e.g CucumberishUITests

Now that Xcode has created brand new target with all required Swift and Objective-C files to run Cucumberish. All Xcode setting has been done by the Xcode Template.
####### Link Target Application
The most important thing is link your target to application to test. Cucumberish target 'General' setting select 'Testing -> Target To Test' and configure scheme to add Cucumeerish UI target to Test

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/LinkTargetTestApp.png)

#### Cucumberish Page Object Pattern Directory Structure

Now that, you can observe that new target has nice directory structure following [Page Object Pattern](http://martinfowler.com/bliki/PageObject.html)

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/DirectoryStructure.png)

#####  Download Cucumberish in the target

This can be done in two ways. By directly downloading contents of "Cucumberish" directory into the target directory or using Cocoapods.
######  Using Direct Download with XCFit
- Now that you have to CD into the Cucumberish target directory .eg CucumberishUITests

```sh
$ cd $_YOUR_CUCUMBERISH_TARGET_DIR
$ xcfit get_cucumberish 1.0.0
```
This will download Cucumberish directory from version 1.0.0 and also create 'Features' directory. You can then reference those directory in Xcode. For "Cucumberish" directory select 'Copy if needed and Create Group' and for the "Features" directory select don't create group or Copy if needed. Just " create folder reference"

######  Using Cocoapods

- In your Podfile, add following Pod entry and update/install pod

```ruby
    target '$_YOUR_CUCUMBERISH_TARGET' do
      pod 'Cucumberish', :git => 'https://github.com/Ahmed-Ali/Cucumberish'
    end
```



```sh
$ pod update
```


#####  Create Cucumber Features - Gherkin
Now Add sample Feature File to 'Features' directory either by File->New->Gherkin Or Just add it using your favourite text editor e.g demo.feature with content

```
Feature: Demo App Feature

Scenario: Demo Scenario

Given the app is running

```

##### Add Target To Test

- Finally, Run Your Test from Cucumberish Target by Pressing 'CMD+U'

You are done !!

Look how easy it is !

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/POM_Cucumberish.gif)


You can add more feature/Scenarios and implement steps definitions inside your Swift File. [Ahmed-Ali](https://github.com/Ahmed-Ali) creator of Cucumberish already implemented useful pre-defined steps have a look at this [Swift file](https://github.com/Ahmed-Ali/Cucumberish/blob/master/CucumberishExample/CucumberishExampleUITests/CCIStepDefinitions.swift). You are free to try Page Object Pattern and all other crazy stuff to abstract and refactor your Swift code.


## Setting up Fitnesse Acceptance Target with XCTest

You can also setup Fitnesse Acceptance Tests but you need to use Cocoapods for this target.

You can find detailed blog post on [Dzone](https://dzone.com/articles/integrate-fitnesse-with-xctest-using-xcode8)

#### Add Acceptance and Acceptance Unit Test Target to Project

We have all the predefined targets for FitNesse. Just add “Acceptance Tests” target from the template and “AcceptanceUnitTests” target from the bundle. You will need “FitNesse Suite page name” to create this target but just put “OCSlimProjectExamplePage” there for now . Add your ‘AcceptanceTests’ target as a ‘Target Dependancy’ of this new target in Build Phases. This ensures that it the latest code has been built prior to the tests being run.

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/targets.gif)

#### Add Pod Dependencies
We need to create a “Podfile” at the root of the project with the following content.

```ruby
target 'AcceptanceTests' do     
   pod 'OCSlimProject'
end   
target 'AcceptanceUnitTests' do     
   pod 'OCSlimProjectTestBundleSupport'
end
```

Now, we can run ‘pod install’ at this stage and close the current Xcode session and open project workspace.

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/pod_install.gif)

#### Build Acceptance Tests Target
At this stage, we should be able to build the “Acceptance Tests” target. If you are using Xcode8, you might see some warning related to the Swift3 Syntax. Just Click on ‘Edit-> Convert-> To Current Swift Syntax

Now you should be able to build an “Acceptance Tests” target. Once, build is successful, you should see “LaunchFitnesse” script is generated in the root of the project. We can launch and execute the fitness test as shown below.

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/build_acceptace.gif)

#### Test AcceptanceUnitTests Target

Now if you select “AcceptanceUnitTarget” and press CMD+U.

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/RunXCUITest.gif)


Now we can see that FitNesse tests are running as shown above.  We can add this to main scheme to make sure we are running it after the unit tests to follow proper development workflow. We can build and run it as our normal unit tests.


### Taking Control with Bundler, Fastlane, and Trainer

Now that , we have seen how to run FitNesse acceptance tests from Xcode but it’s a good idea to run it with Fastlane.  We can also take control of version of Cocoapods and Fastlane by using Bundler. Let’s create a Gemfile at the root of the project with the following gem

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
desc "Runs all the Unit tests and Fitnesse Aceptance Tests"   
lane :xctest_fitnesse do    
  scan(scheme: "FitnesseXCTestDemo",
   destination: 'platform=iOS Simulator,name=iPhone 7 Plus,OS=10.0',  
   output_directory: "test_reports/",    
    output_types: "html",    
    fail_build: false    )
   trainer(output_directory: "test_reports/trainer_report/")   
end
end
```

Now we will create a “fastlane/PluginFile” to add “trainer” plugin.

```ruby
 gem 'fastlane-plugin-trainer'

```

After running “bundle install” we should be able to run those test from command line like this :

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/xcfitnesse.gif)


You can watch YouTube video of XCFTest-Fitnesse [here](https://www.youtube.com/watch?v=xqvy1vN87e8)


# Video Demo

### XCTest Fitnesse Demo

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/xqvy1vN87e8/0.jpg)](http://www.youtube.com/watch?v=xxqvy1vN87e8)

### Quick Demo with Example App

You can clone the existing repo which has a demo app we can run Unit, Fitnesse and Cucumbertish Tests as XCTest
 ```
  $ git clone https://github.com/Shashikant86/XCFit
  $ cd XCFit/XCFitnesse
  $ open XCFitnesse.xcworkspace
  ```
 Run Unit, Fitnesse and Cucumberish test with Xcode. "cmd + U". We can execute it using Fastlane


  ```
  $ bundle install
  $ bundle exec fastlane xctest_fitnesse
```


Watch this animated GIF for the steps below.

  ![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/XCFitDemo.gif)


Big Thanks to
  - [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) : Provide native [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) parser for iOS Apps to enable BDD in Xcode using Given When Then. Yay!
  - [OCSlimProject](https://github.com/paulstringer/OCSlimProject) : Provide Xcode Templates to enable BDD with Decision Tables using Fitnesse

XCFit automated configuration of these two guys.

## Author

Shashikant86, shashikant.jagtap@icloud.com

# TODO

 * Swift Implementation of Gherkin Parser
 * Cocoapods free installation. Carthage or Swift Package Manager once ready
 * Setting up XCFit on Apple's own CI Xcode Server

## LICENSE

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

## Contributing

1. Fork it ( https://github.com/Shashikant86/XCFit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

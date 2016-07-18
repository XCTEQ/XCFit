[![CI Status](http://img.shields.io/travis/Shashikant86/XCFit.svg?style=flat)](https://travis-ci.org/Shashikant86/XCFit)
[![Version](https://img.shields.io/cocoapods/v/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![License](https://img.shields.io/cocoapods/l/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![Platform](https://img.shields.io/cocoapods/p/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)

# XCFit

####XCFit a.k.a ([XCUI](https://developer.apple.com/videos/play/wwdc2015/406/0), [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [Fitnesse](https://github.com/paulstringer/OCSlimProject) Integrations Tests) is a full stack Xcode BDD framework for [Swift](https://swift.org) iOS and macOS apps. XCFit allows us to write API, UI and Acceptance Tests in human readable language using tools like [Cucumber](https://cucumber.io/) and [Fitnesse](http://fitnesse.org/) in Xcode. XCFit is fully automated solution for Cucumberish and Fitness. XCFit is available on [RubyGem](https://rubygems.org/gems/xcfit) and [CocoaPods](http://cocoadocs.org/docsets/XCFit).

### XCFit Features
There are few reason you should go for XCFit
***
  -  You can now write Given When Then and Decision Table in Xcode !! YAY.. Thanks to Cucumberish and OCSlimProject ! And XCFit automated them !!

  -  XCfit provides Xcode Templates to create new Cucumberish and Fitnesse targets which reduce hectic Xcode configuration steps. It's all automated in XCfit
  -  One command to set all fully automated Xcode template for Cucumberish and Fitnesse targets
  - New Template to create Gherkin Feature file in Xcode
  - Automated almost all [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) Setup in one command
  - Enhanced OCSlimProject (https://github.com/paulstringer/OCSlimProject) templates and automated Fitnesse download process.
  - XCFit target templates are independent of native Xcode Test targets.
  - Its native Xcode implementation, No Appium, Calabash etc etc
  - Setup Cucumberish and Fitnesse in Xcode within few minutes !!

  ***

Big Thanks to
  - [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) : Provide native [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) parser for iOS Apps to enable BDD in Xcode using Given When Then. Yay!
  - [OCSlimProject](https://github.com/paulstringer/OCSlimProject) : Provide Xcode Templates to enable BDD with Decision Tables using Fitnesse

XCFit automated configuration of these two guys.

### Version
CocoaPods -- [XCFit-CocoaPods](http://cocoadocs.org/docsets/XCFit) : TBD

RubyGems  -- [xcfit-RubyGem](https://rubygems.org/gems/xcfit)  : TBD

### Tech & Software Requirements

XCFit uses a number of open source projects to work properly. You need to have following

Hardware : You must have Mac Operating System with OSX/MacOS version > 10.9

Software:
* [Ruby](https://www.ruby-lang.org/en/) - Use [RVM](https://rvm.io/) for GEM management. Ideally Ruby > 2.X
* [Xcode](https://developer.apple.com/xcode/) - Ideally Xcode 7.X
* [RubyGems](https://rubygems.org/) - RubyGem with [Cocoapods](https://cocoapods.org/) installed
* [Curl on Mac](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/curl.1.html) - Might be pre-installed but worth double checking.


### Installation

XCFit requires [RubyGems](https://rubygems.org/) to run.

You need Gulp installed globally:


      $ gem install xcfit

Now you are good to get started with XCFit for now. Later we also need to install XCFit Pod.

# Usage
Now that you can execute 'xcfit' command from your terminal/iTerm etc etc. Example Output Looks like this :

```
$ xcfit
Tasks:
  xcfit get_cucumberish VERSION  # Downloads Cucumberish version and Create Features directory. You must execute this from Cucumberish Xcode Target directory
  xcfit get_fitnesse             # Download Fitnesse JAR file from Internet. You must execute this from Xcode Fitnesse Acceptance Test Xcode Target directory
  xcfit help [TASK]              # Describe available tasks or one specific task
  xcfit set_xcode_templates      # Generate All Xcode Templates for the Gherkin Feature Files & targets for Cucumberish and Fitnesse
  xcfit version                  # Get the current version number

```

## Setup Xcode Templates

In existing app or brand new app, we have to enable the Xcode templates for files and targets to speed up the things. Run following command from your termonal


```sh
$ xcfit set_xcode_templates

```

-  This will add couple of templates to your Xcode for iOS and macOS apps. In your app if you go to 'File--->New--->Target'

You will see new option for iOS and OSX i.e 'XCFit'. Once Clicked on it. You will see Cucumberish API, Cucumberish UI and Fitnesse Acceptance Tests targets. As shown



- Once Clicked on the target e.g 'Cucumberish UI Test Bundle' Xcode will create UI testing target with all the required files with Bridging hrader for Cucumberish UI Testing.
Once Clicked on the target e.g 'Fitnesse Acceptance Test Bundle' Xcode will create UI tAcceptance test with all the required files with Bridging headers for the Fitnesse Acceptance Test. We will see that in details soon. 

- This script also set new file type in Xcode to create new Gherking feature file 

## Setting up Cucumberish UI Target

3 Steps to setup Cucumberish. You don't need to use Cocoapods to setup this target. 


- Add new target iOS/macOS project and Select "File -> New -> Target -> XCFit -> Cucumberish UI Test Bundle". Give it a name you like e.g CucumberishUITests

Now that Xcode has created brand new target with all required Swift and Objective-C files to run Cucumberish. All Xcode setting has been done by the Xcode Template. Don't worry about configuting anything. 


- Now that you have to CD into the Cucumberish target directory .eg CucumberishUITests

```sh 
$ cd $CUCUMBERISH_TARGET_DIR
$ xcfit get_cucumberish 0.0.7
```
This will download Cucumberish directory from version 0.0.7 and also creats 'Features' directory with demo feature. You can then reference those directory in Xcode. For "Cucumberish" directory select 'Copy if needed and Create Group' and for the "Features" directory select don't create group or Copy if needed. Just " create folder reference"

- Finally from the Cucumberish target 'General' setting select 'Testing -> Target To Test' and configure scheme to add Cucumeerish UI target to Test 

You are done !!

## Setting up Fitnesse Acceptance Target

You can also setup Fitnesse Acceptance Tests but you need to use Cocoapod for this target. 

Basically Steps are pretty much same mentioned in the [OCSlimProject](http://paulstringer.github.io/OCSlimProject/) but most of them are automated for simplicity. Here is simple way to set Fitnesse Acceptance tests for iOS/MacOS Apps



- Create new target, "File --> New --> Target --> XCFit --> Fitnesse Acceptance Test". Give it a suitable name e.g 'AcceptanceTests'

- Create/Update Podfile with 


```ruby

use_frameworks!

target 'AcceptanceTests' do
  pod 'XCFit'
end
```

Run 'Pod install' and build newly created Acceptance target from Xcode. You should see 'LaunchFitnesse' Script geerated and Your app should be talking to fitnesse now. 

- Now CD into FITNESSE_TARGET directory and Get Fitnesse JAR file by running 

```sh
$ cd $FITNESSE_TARGET
$ xcfit get_fitnesse
```

You should have fitnesse-standalone file downloaded in the target directory. You can now execute 'LaunchFitnesse'

```sh
$ ./LaunchFitnesse
```

Now you should have Fitnesse up and runnig. Follow Paul's article for the details on how to write acceptance tests [here](http://stringerstheory.net/acceptance-testing-with-ios/)

## Continous Integration & Test Reporting 

As of now, you might be running tests within Xcode, but there are some awsome tools which allows us to run our tests from command line. The 'xcodebuild' is being used to build and test Xcode Schemes. [Fastlane](https://github.com/fastlane/fastlane) seems much easier option to automate everything but it's upto you. These are long commands but you k ow better how to Script it Or Fastlane it, right ? :) 

### Cucumberish
 
You can execute Cucumberish tests with like this for XCFitDemo App. 

[XCPretty](https://github.com/supermarin/xcpretty) can be used to generate JUnit Or HTML report as below 


```sh
xcodebuild -workspace XCFitDemo.xcworkspace -scheme XCFitDemo -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' test | xcpretty --test --color
```

You can now analyse the reports generated in the 'build/reports' directory. 

### Fitnesse 

You can first build the Acceptance target

```sh 
$ xcodebuild -workspace XCFitDemo.xcworkspace -scheme XCFitAcceptanceTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' clean build | xcpretty
```

Now run the Fitnesse tests using 

```sh

$ java -jar fitnesse-standalone.jar -v -o -c "FrontPage?suite"
```
You can also set reports directory and generate Junit style reports inside the "XCFitDemo/FitNesseRoot/files/testResults/" directory. 


# Video Demo 

Coming Soon !




## Author

Shashikant86, shashikant.jagtap@icloud.com

## License

XCFit is available under the MIT license. See the LICENSE file for more info.

[![CI Status](http://img.shields.io/travis/Shashikant86/XCFit.svg?style=flat)](https://travis-ci.org/Shashikant86/XCFit)
[![Version](https://img.shields.io/cocoapods/v/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![License](https://img.shields.io/cocoapods/l/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)
[![Platform](https://img.shields.io/cocoapods/p/XCFit.svg?style=flat)](http://cocoapods.org/pods/XCFit)

#XCFit
## XCFit - 'Swift'ing iOS/macOS apps towards BDD

####XCFit a.k.a ([XCUI](https://developer.apple.com/videos/play/wwdc2015/406/0), [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [Fitnesse](https://github.com/paulstringer/OCSlimProject) Integrations Tests) is a full stack Xcode BDD framework for [Swift](https://swift.org) iOS and macOS apps. XCFit allows us to write API, UI and Acceptance Tests with Swift in human readable language using tools like [Cucumber](https://cucumber.io/) and [Fitnesse](http://fitnesse.org/) in Xcode. We can still use Apple's brand new UI Testing framework (XCUI) under the hood of Cucumberish. XCFit is fully automated solution for Cucumberish and Fitness. You can use 80(Fitnesse):20(Cucumberish) formula to automate Acceptance and UI Testing for better coverage and faster feedback. XCFit is available on [RubyGem](https://rubygems.org/gems/xcfit) and [CocoaPods](http://cocoadocs.org/docsets/XCFit).


### XCFit Features
There are few reason you should go for XCFit
***
  -  You can now write Given When Then and Decision Table in Xcode !! YAY.. Thanks to Cucumberish and OCSlimProject ! And XCFit automated them !!
  -  You can now write/Execute all your Acdeptance Tests and UI Tests using Apple's brand new programming language "Swift" in Xcode. Goodbye Appium, Calabash, Frank, KIF and Goodbye Ruby,Java, Python. It's pure Swift !!

  -  XCFit provides Xcode Templates to create new Cucumberish and Fitnesse targets which reduce hectic Xcode configuration steps. It's all automated in XCFit
  -  One command to set all fully automated Xcode template for Cucumberish and Fitnesse targets
  - New Template to create Gherkin Feature file in Xcode
  - Automated almost all [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) Setup in one command
  - Enhanced [OCSlimProject](https://github.com/paulstringer/OCSlimProject) templates and automated Fitnesse download process.
  - XCFit target templates are independent of native Xcode Test targets.
  - We can stiil use Apple's brand new XCUI Testing framework. Its native Xcode implementation, No Appium, Calabash etc etc
  - Setup Cucumberish and Fitnesse in Xcode within few minutes !!

  ***

#### What XCFit can solve in iOS/macOS team?
XCFit can bring lot of improvement the way you work. The most common problems in iOS development is explained by Paul Stringer in this [article](http://stringerstheory.net/acceptance-testing-with-ios/). XCFit can solve few of them

  - Better Developer/QA collabration, Early QA Involvement.

Usually,in the iOS development world, Developer build an app using Swift and Objective-C and army of manual and automated QA uses tools like Apppium, Calabash using languages like Ruby, Java, Python WTF !!. QA and Developers world is totally different. With XCFit you will be speaking same language that is "Swift". QA can write test script as we build. No need to wait until build is handed over. Just work with developer ! Little bit of learning curve for QA but you will save developers time as they don't to learn Java, Pyth or Ruby to help QA team

   - Quick Acceptance & UI testing setup

You will be surprised by how easily/quickly you can setup Fitnesse(Acceptance Test) and Cucumberish(UI Testing) environmant in Xcode and running your first test.

   -  Getting Business people involved

As we can now able to write scenarios with Given/When/Then and decision tables. We can get business people involved to contribute to acceptance criteria. In short we got all benefits of BDD in iOS/macOS project.

   - Developers don't need to learn Ruby or similar ! Just stick to Swift

You must be happy as you won't need to learn other language just in case QA ask something to solve. With XCFit it's everything Swift.

  - Fix failed attempt to automate testing by QA team

As of now your QA team might have tried all wrappers on [UIAutomation](https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/UIAutomation.html) e.g Appium, Calabash, Frank, KIF etc etc and keeping themselve busy writing some Ruby, Python, Java code to automate testing and all that attempts results in Slow, Brittle, Untrusted, Non-valuable UI tests causing harm to mobile development rather than good. With XCFit, everyone will be speaking same language and you can cover businness logic with lighting fast Fitnesse Tests and major journeys with UI tests. Keep it 80:20 means 80% Fitness and 20% Cucumberish or XCUI.


### Quick Demo with Example App

You can clone the existing repo which has a demo app. To get started..Watch this animated GIF for the steps below

  ![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/Quick_Demo.gif)

  ```
  $ git clone https://github.com/Shashikant86/XCFit
  $ cd XCFit/XCFitDemo
  $ open XCFitDemo.xcworkspace
  ```
  Run Unit, UI and Cucumberish test with Xcode. "cmd + U". Edit Scheme if nessesary to avoid running Unit Tests for this demo. Or Run nit from command line. Update Simulator device/OS version as installed in your Xcode if nessessary

  ```
  $ xcodebuild -workspace XCFitDemo.xcworkspace -scheme XCFitDemo -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.3' test | xcpretty -r html -r junit --test --color
```
  Watch out HTML and JUnit reports generated in the 'Build/reports/' directory with XCPretty. Install XCpretty if you havent got already.

  Running Fitnesse Tests: Clean, Build and Execute

  ```
  $ xcodebuild -workspace XCFitDemo.xcworkspace -scheme XCFitAcceptanceTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.3' clean build | xcpretty

  $java -jar fitnesse-standalone.jar -v -o -c "FrontPage?suite&format=junit"

  ```



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
* Ruby Packages : Xcpretty, Fastlane(Optional), Rake, Bundler.. Install with 'gem install <package_name>'


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

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/new_targets.png)



- Once Clicked on the target e.g 'Cucumberish UI Test Bundle' Xcode will create UI testing target with all the required files with Bridging hrader for Cucumberish UI Testing.
Once Clicked on the target e.g 'Fitnesse Acceptance Test Bundle' Xcode will create UI tAcceptance test with all the required files with Bridging headers for the Fitnesse Acceptance Test. We will see that in details soon.

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/XCFit_Setup.gif)

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
This will download Cucumberish directory from version 0.0.7 and also creats 'Features' directory. You can then reference those directory in Xcode. For "Cucumberish" directory select 'Copy if needed and Create Group' and for the "Features" directory select don't create group or Copy if needed. Just " create folder reference"

- Finally from the Cucumberish target 'General' setting select 'Testing -> Target To Test' and configure scheme to add Cucumeerish UI target to Test

You are done !!

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/CucumberishDemo.gif)

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

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AcceptanceTests.gif)

## Continous Integration & Test Reporting

As of now, you might be running tests within Xcode, but there are some awsome tools which allows us to run our tests from command line. The 'xcodebuild' is being used to build and test Xcode Schemes. [Fastlane](https://github.com/fastlane/fastlane) seems much easier option to automate everything but it's upto you. These are long commands but you k ow better how to Script it Or Fastlane it, right ? :)

### Cucumberish

You can execute Cucumberish tests with like this for XCFitDemo App.

[XCPretty](https://github.com/supermarin/xcpretty) can be used to generate JUnit Or HTML report as below


```sh
xcodebuild -workspace XCFitDemo.xcworkspace -scheme XCFitDemo -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' test | xcpretty -r html -r junit --test --color
```

You can now analyse the reports generated in the 'build/reports' directory.

```
$ open build/reports/tests.html
```


![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/html_reports.png)

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



#XCFit : Xcode 7 V
## XCFit - 'Swift' Your iOS/macOS apps towards BDD

####XCFit a.k.a ([XCUI](https://developer.apple.com/videos/play/wwdc2015/406/0), [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) and [Fitnesse](https://github.com/paulstringer/OCSlimProject) Integrations Tests) is a full stack Xcode BDD framework for [Swift](https://swift.org) iOS and macOS apps. XCFit allows us to write API, UI and Acceptance Tests with Swift in human readable language using tools like [Cucumber](https://cucumber.io/) and [Fitnesse](http://fitnesse.org/) in Xcode. We can still use Apple's brand new UI Testing framework (XCUI) under the hood of Cucumberish. XCFit is fully automated solution for Cucumberish and Fitnesse. You can use 80(Fitnesse):20(Cucumberish) formula to automate Acceptance and UI Testing for better coverage and faster feedback. XCFit is available on [RubyGem](https://rubygems.org/gems/xcfit) and [CocoaPods](http://cocoadocs.org/docsets/XCFit).


### Quick Demo with Example App

You can clone the existing repo which has a demo app. To get started..Watch this animated GIF for the steps below.

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

###### Using Fastlane

Assuming you have Bundler  rubygem installed if not install it by "gem install bundler"

```
$ bundle install
$ bundle exec fastlane cucumberish
$ bundle exec fastlane fitnesse
```


Curently XCFitDemo App is configured on TravisCI which runs both Cucumberish and Fitnesse Tests. The sample .travis.yml is in the Github repo and sample logs from TravisCI [here](https://travis-ci.org/Shashikant86/XCFit/builds/145963673).


Big Thanks to
  - [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) : Provide native [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) parser for iOS Apps to enable BDD in Xcode using Given When Then. Yay!
  - [OCSlimProject](https://github.com/paulstringer/OCSlimProject) : Provide Xcode Templates to enable BDD with Decision Tables using Fitnesse

XCFit automated configuration of these two guys.

### Version
CocoaPods -- [XCFit-CocoaPods](http://cocoadocs.org/docsets/XCFit) : 0.1.0

RubyGems  -- [xcfit-RubyGem](https://rubygems.org/gems/xcfit)  : 0.8.0

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
You can watch YouTube video of XCFit setup [here](https://www.youtube.com/watch?v=Q3cKinwYwhE)

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
Now Add sample Feature File to 'Features' directory either by File->New->Gherkin Or Just add it using your favourite text editor e.g demo.feature with content

```
Feature: Demo App Feature

Scenario: Demo Scenario

Given the app is running

```

- Finally from the Cucumberish target 'General' setting select 'Testing -> Target To Test' and configure scheme to add Cucumeerish UI target to Test

You are done !!

You can watch YouTube video of Cucumberish Setup [here](https://www.youtube.com/watch?v=Wd9myhNkpx4)

You can add more feature/Scenarios and implement steps definitions inside your Swift File. [Ahmed-Ali](https://github.com/Ahmed-Ali) creator of Cucumberish already implemented useful pre-defined steps have a look at this [Swift file](https://github.com/Ahmed-Ali/Cucumberish/blob/master/CucumberishExample/CucumberishExampleUITests/CCIStepDefinitions.swift). You are free to try Page Object Pattern and all other crazy stuff to abstract and refactor your Swift code.



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

You can watch YouTube video of XCFit Fitnesse [here](https://www.youtube.com/watch?v=Wd9myhNkpx4)

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/AcceptanceTests.gif)

## Continous Integration & Test Reporting

Continous Integration is very important and you simply can't avoid that. XCFit will be easily configured on any CI server including Apple's own [Xcode Server](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/xcode_guide-continuous_integration/) or very polular one [Jenkins](https://jenkins.io/) as we can generate reports in both HTML and JUnit format.
As of now, you might be running tests within Xcode, but there are some awsome tools which allows us to run our tests from command line. The 'xcodebuild' is being used to build and test Xcode Schemes. [Fastlane](https://github.com/fastlane/fastlane) seems much easier option to automate everything but it's upto you. These are long commands but you k ow better how to Script it Or Fastlane it, right ? :)

Curently XCFitDemo App is configured on TravisCI which runs both Cucumberish and Fitnesse Tests. The sample .travis.yml is in the Github repo and sample logs from TravisCI [here](https://travis-ci.org/Shashikant86/XCFit/builds/145963673). Watch out Live Execution :

![image](https://github.com/Shashikant86/XCFit-GIFS/blob/master/Travis_XCFit.gif)

### Cucumberish

You can execute Cucumberish tests with like this for XCFitDemo App.

[XCPretty](https://github.com/supermarin/xcpretty) can be used to generate JUnit Or HTML report as below


```sh
xcodebuild -workspace XCFitDemo.xcworkspace -scheme XCFitDemo -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' test | xcpretty -r html -r junit --test --color
```

You can now analyse the reports generated in the 'build/reports' directory. You will find both HTML and JUnit reports. You can configure these reports with Xcode-Server, Jenkins, TeamCity easily in the post build setting.

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
You can also set reports directory and generate Junit style reports inside the "XCFitDemo/FitNesseRoot/files/testResults/" directory. You can configure these reports with Xcode-Server, Jenkins, TeamCity easily in the post build setting.






# Video Demo

### XCFit Xcode Setup

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/Q3cKinwYwhE/0.jpg)](http://www.youtube.com/watch?v=Q3cKinwYwhE)


### XCFit Cucumberish Demo

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/Wd9myhNkpx4/0.jpg)](http://www.youtube.com/watch?v=Wd9myhNkpx4)


### XCFit Fitnesse Demo

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/xFRSIugJ-FA/0.jpg)](http://www.youtube.com/watch?v=xFRSIugJ-FA)

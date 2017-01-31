Pod::Spec.new do |s|
  s.name             = 'XCFit'
  s.version          = '3.0.3'
  s.summary          = 'Full Stack BDD for iOS and macOS Apps with Swift, Xcode using XCUITest, Cucumberish, FitNesse and friends.'

  s.description      = <<-DESC
XCFit is a full stack BDD framework for iOS and macOS apps with Swift using Cucumberish and Fitnesse. Native Xcode implementation, No Appium, No Calabash, No Ruby or any other non iOS language.
                       DESC

  s.homepage         = 'https://github.com/Shashikant86/XCFit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Shashikant86' => 'shashikant.jagtap@icloud.com' }
  s.source           = { :git => 'https://github.com/Shashikant86/XCFit.git', :tag => "#{s.version}"}

  s.social_media_url = 'https://twitter.com/Shashikant86'

  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/*.swift'
  s.framework = "XCTest"
  s.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "SRC_ROOT=@\\\"$(SRCROOT)\\\"" }
end

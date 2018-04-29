Pod::Spec.new do |s|
  s.name             = 'XCFit'
  s.version          = '8.0.0'
  s.summary          = 'Full Stack BDD for iOS and macOS Apps with Swift, Xcode using XCUITest, Cucumberish, FitNesse and friends.'

  s.description      = <<-DESC
XCFit is a full stack BDD framework for iOS apps with Swift supports Protocol Oriented BDD and Page Object Pattern.
                       DESC

  s.homepage         = 'https://github.com/Shashikant86/XCFit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Shashikant86' => 'shashikant.jagtap@icloud.com' }
  s.source           = { :git => 'https://github.com/Shashikant86/XCFit.git', :tag => "#{s.version}"}

  s.social_media_url = 'https://twitter.com/Shashikant86'

  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/*.swift'
  s.framework = "XCTest"
  s.xcconfig = { "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES" => "NO" }
end

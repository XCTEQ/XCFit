# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'XCFit/version'

Gem::Specification.new do |spec|
  spec.name          = "XCFit"
  spec.version       = XCFit::VERSION
  spec.authors       = ["Shashikant86"]
  spec.email         = ["shashikant.jagtap@icloud.com"]

  spec.summary       = %q{Full Stack BDD in Xcode Templates for iOS and macOS Apps with Swift, Xcode using XCUITest, Cucumberish, FitNesse. Checkout XCFit Pod as well}
  spec.description   = %q{XCFit is a full stack BDD framework in Xcode for iOS and macOS apps with Swift using Cucumberish and Fitnesse. Native Xcode implementation, No Appium, No Calabash, No Ruby or any other non iOS language. Checkout XCFIT POD}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|_Pods.xcodeproj)/}) }
  spec.files.reject! { |fn| fn.include? "_Pods.xcodeproj" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", '~> 0.17.0'
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end

# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'XCFitnesse' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  #use_frameworks!

  # Pods for XCFitnesse

  target 'XCFitnesseTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AcceptanceTest' do
    pod 'OCSlimProject'
end

target 'AcceptanceUnitTests' do
    pod 'OCSlimProjectTestBundleSupport'
end

target 'XCFitnesseCucumber' do
    pod 'Cucumberish', :git => 'https://github.com/Ahmed-Ali/Cucumberish'
end

end

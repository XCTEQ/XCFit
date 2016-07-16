require 'thor'
require 'fileutils'
require 'XCFit/version'

module XCFit
	class Main < Thor 
	  include Thor::Actions
    $source_dir = File.expand_path '../../..', __FILE__
    $source_template_dir = File.join($source_dir, 'XCFit_Templates')
	  $source_xcfit_dir = File.join($source_template_dir, 'XCFit')
    $source_gherkin_dir = File.join($source_template_dir, 'Gherkin')
    $root_dir = File.expand_path('~')
    $root_lib_dir = File.join($root_dir, 'Library')
    $root_developer_dir = File.join($root_lib_dir, 'Developer')
    $root_xcode_dir = File.join($root_developer_dir, 'Xcode')
    $root_template_dir = File.join($root_xcode_dir, 'Templates')
    $root_xcfit_dir = File.join($root_template_dir, 'XCfit')
    $root_gherkin_dir = File.join($root_template_dir, 'Gherkin')
	

	  map %w(-v -V --version) => :version
      

	  desc 'version', 'Get the current version number'
      def version
        say XCFit::VERSION
      end

      desc 'create_xctargets', 'Generate a Xcode Templates for the Cucumberish and Fitnesse'
      def create_xctargets
        if File.exist?($root_xcfit_dir)
        puts "==================XXXXXXXX===========================" 
         puts 'There is already XCFit directory in Xcode Templates. Have you tried XCFit Before? '
         puts 'Please remove/move existing ~/Library/Developer/Xcode/Templates/XCFit directory to carry on'
         puts "==================XXXXXXXX===========================" 
        exit 1
       end
         puts "==================XXXXXXXX===========================" 
         puts 'Creating XCode Template for XCFit'
         puts 'This Template will allow you create Cucumberish and Fitnesse targets'
         puts "==================XXXXXXXX===========================" 
         FileUtils.cp_r($source_xcfit_dir, $root_template_dir)
         puts 'Now Your Xcode will have XCFIT iOS and macOS tagets for Cucumberish and Fitnesse'
         puts "==================XXXXXXXX===========================" 
         puts 'File -> New -->Target-->XCFit'
         puts 'You wont need to restart Xcode but do so if nesessary!'
         puts " ***************** Enjoy XCFit *****************"
      end 

      desc 'create_xcgherkin', 'Generate Xcode Templates for the Gherkin Feature Files'
      def create_xcgherkin
        if File.exist?($source_dir)
         puts "==================XXXXXXXX===========================" 
         puts 'There is already Gherkin directory in Xcode Templates. Have you tried XCFit Before? '
         puts 'Please remove/move existing ~/Library/Developer/Xcode/Templates/Gherkin directory to carry on'
         puts "==================XXXXXXXX===========================" 
         exit 1
         end
         puts "==================XXXXXXXX===========================" 
         puts 'Creating XCode Template for Gherkin'
         puts 'This Template will allow you create new Gherkin Feature file '
         puts "==================XXXXXXXX===========================" 
         FileUtils.cp_r($source_gherkin_dir, $root_template_dir)
         puts 'Now Your Xcode will have ability to creat new Gherkin Feature File'
         puts "==================XXXXXXXX===========================" 
         puts 'File -> New -->File-->Gherkin'
         puts 'You wont need to restart Xcode but do so if nesessary!'
         puts " ***************** Enjoy XCFit *****************"
      end
  end 
end 
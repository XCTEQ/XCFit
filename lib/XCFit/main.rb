require 'thor'
require 'fileutils'
require 'XCFit/version'

module XCFit
	class Main < Thor 
	  include Thor::Actions
    $source_dir = File.expand_path '../../..', __FILE__
	  $source_xcfit_dir = File.join($source_dir, 'XCFit')
    $source_gherkin_dir = File.join($source_dir, 'Gherkin')
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

      desc 'setup_xcfit', 'Generate a Xcode Templates for the Cucumberish and Fitnesse'
      def setup_xcfit
        if File.exist?($root_xcfit_dir)
        puts 'There is already XCFit directory. Please move existing XCFit directory to carry on '
        exit 1
       end

       FileUtils.cp_r($source_xcfit_dir, $root_template_dir)
      end 

      desc 'setup_gherkin', 'Generate Xcode Templates for the Gherkin Feature Files'
      def setup_gherkin
        p File.directory?($source_dir)
        p File.directory?($root_gherkin_dir)
        if File.exist?($source_dir)
         puts 'There is already Gherkin directory. Please move existing Gherkin directory to carry on '
         exit 1
         end
      FileUtils.cp_r($source_gherkin_dir, $root_template_dir)
      end 
  end 
end 
require 'thor'
require 'fileutils'
require 'XCFit/version'

module XCFit
	class Main < Thor
	  include Thor::Actions
    $source_dir = File.expand_path '../../..', __FILE__
    $source_template_dir = File.join($source_dir, 'XCFit_Templates')
		$source_template_xcode7_dir = File.join($source_dir, 'Xcode7-Templates')
	  $source_xcfit_dir = File.join($source_template_dir, 'XCFit')
		$source_xcfit_xcode7_dir = File.join($source_template_xcode7_dir, 'XCFit')
    $source_cucumberish_template_dir = File.join($source_xcfit_dir, 'Cucumberish\ UI\ Test\ Bundle\ Base.xctemplate')
    $source_gherkin_dir = File.join($source_template_dir, 'Gherkin')
    $root_dir = File.expand_path('~')
    $root_lib_dir = File.join($root_dir, 'Library')
    $root_developer_dir = File.join($root_lib_dir, 'Developer')
    $root_xcode_dir = File.join($root_developer_dir, 'Xcode')
    $root_template_dir = File.join($root_xcode_dir, 'Templates')
    $root_xcfit_dir = File.join($root_template_dir, 'XCfit')
    $root_gherkin_dir = File.join($root_template_dir, 'Gherkin')


	  map %w(-v -V --version) => :version


	  desc 'version', 'Get the current version number', :hide => true
      def version
        say XCFit::VERSION
      end

			desc 'setup_xcfit_templates', 'Generate All Xcode Templates for the Gherkin Feature Files & targets for Cucumberish and Fitnesse'
      def setup_xcfit_templates
        if File.exist?($root_xcfit_dir)
        puts "==================XXXXXXXX==========================="
				puts 'There is already XCFit directory in Xcode Templates. Looks like you are trying Fitnesse Templates '
				puts 'Templates are being installed at ~/Library/Developer/Xcode/Templates/XCFit directory'
        puts "==================XXXXXXXX==========================="
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

			desc 'setup_fitnesse_templates', 'Downloads Fitnesse Xcode Templates from OCSlim'
      def setup_fitnesse_templates
         puts "==================XXXXXXXX==========================="
         puts 'Downloading Fitnesse Templates'
         puts "==================XXXXXXXX==========================="
         system("cd /tmp && curl -sL https://github.com/Shashikant86/OCSlimProjectXcodeTemplates/archive/2.0.0.tar.gz| tar xz")
				 system("cd /tmp/OCSlimProjectXcodeTemplates-2.0.0/ && make")
         puts "==================XXXXXXXX==========================="
         puts "=======Created Xcode Templates for the Fitnesse ===="
         puts "==================XXXXXXXX==========================="
      end
  end
end

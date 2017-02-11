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

			desc 'set_xcode_templates', 'Generate All Xcode Templates for the Gherkin Feature Files & targets for Cucumberish and Fitnesse'
      def set_xcode_templates
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

			desc 'set_xcode7_templates', 'Generate a Xcode7 Templates for the Cucumberish and Fitnesse'
      def set_xcode7_templates
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
         FileUtils.cp_r($source_xcfit_xcode7_dir, $root_template_dir)
         puts 'Now Your Xcode will have XCFIT iOS and macOS tagets for Cucumberish and Fitnesse'
         puts "==================XXXXXXXX==========================="
         puts 'File -> New -->Target-->XCFit'
         puts 'You wont need to restart Xcode but do so if nesessary!'
         puts " ***************** Enjoy XCFit *****************"
      end

      desc 'create_xcgherkin', 'Generate Xcode Templates for the Gherkin Feature Files', :hide => true
      def create_xcgherkin
        if File.exist?($root_gherkin_dir)
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


      desc 'get_cucumberish VERSION', 'Downloads Cucumberish version and Create Features directory. You must execute this from Cucumberish Xcode Target directory'
      def get_cucumberish(version="1.0.0")
         puts "==================XXXXXXXX==========================="
         puts 'Downloading Cucumberish in the current working directory'
         puts 'You Should execute this command from Cucumberish Xcode target directory'
         puts "==================XXXXXXXX==========================="
         system("curl -sL https://github.com/Ahmed-Ali/Cucumberish/archive/v#{version}.tar.gz | tar xz")
         cucumberish_dir = "Cucumberish-#{version}" + "/Cucumberish/"
         system("mv #{cucumberish_dir}  .")
         system("rm -rf Cucumberish-#{version}")
         puts "==================XXXXXXXX==========================="
         puts "=======Now creating Feature Directory with Demo Feature ===="
         puts "==================XXXXXXXX==========================="
         system("mkdir -p Features")
         demo_feature_file = $source_template_dir + "/demo.feature"
         # system("cp #{demo_feature_file} Features/")
         # puts $source_cucumberish_template_dir
         puts "==================XXXXXXXX==========================="
         puts "=======Created Feature Directory. Add New Gherkin Feature ===="
         puts "==================XXXXXXXX==========================="
      end

     desc 'get_fitnesse', "Download Fitnesse JAR file from Internet. You must execute this from Xcode Fitnesse Acceptance Test Xcode Target directory"
     def get_fitnesse
         puts "==================XXXXXXXX==========================="
         puts 'Downloading Fitnesse JAR file in the current working directory'
         puts 'You Should execute this command from Fitnesse Acceptance Test  Xcode target directory'
         puts "==================XXXXXXXX==========================="
         system('curl -H "Accept: application/zip" http://fitnesse.org/fitnesse-standalone.jar\?responder\=releaseDownload\&release\=20160618 -o fitnesse-standalone.jar')
         if File.exist?("fitnesse-standalone.jar")
         puts "==================XXXXXXXX==========================="
         puts "=======SUccessfuly Downloaded Fitnesse JAR===="
         puts "==================XXXXXXXX==========================="
         else
         puts "=======Error downloading Fitnesse JAR===="
         end
     end
  end
end

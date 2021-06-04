#
# Be sure to run `pod lib lint BDHotfix.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDHotfix'
  s.version          = '1.0.0'
  s.summary          = 'A short description of BDHotfix.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '朱元清' => 'zhuyuanqing@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/BDHotfix/#{s.version}/BDHotfix.zip" }
  # https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/BDHotfix/1.0.0/BDHotfix.zip
  s.ios.deployment_target = '9.0'

  s.static_framework = true
  s.default_subspecs = 'Core', 'OneKit'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'BITCODE_GENERATION_MODE' => 'bitcode',
  }
  
  s.subspec 'Core' do |ss|
    ss.dependency 'SSZipArchive'
    ss.dependency 'OneKit/MARS/Auth'
    ss.vendored_libraries = ['BDHotfix/Classes/Core/**/*.a']
    ss.source_files = 'BDHotfix/Classes/Core/**/*.{h,m,c}'
    ss.public_header_files = ['BDHotfix/Classes/Core/*.h', 'BDHotfix/Classes/Core/Model/*.h']
  end
  
  s.subspec 'OneKit' do |onekit|
    onekit.dependency 'BDHotfix/Core'
    onekit.dependency 'OneKit/StartUp'
    onekit.dependency 'OneKit/Service'
    onekit.vendored_libraries = ['BDHotfix/Classes/OneKit/**/*.a']
    onekit.source_files = 'BDHotfix/Classes/OneKit/**/*.{h,m,c,mm}'
    onekit.public_header_files = 'BDHotfix/Classes/OneKit/Tasks/*.h'
  end
end

#
# Be sure to run `pod lib lint ByteWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VEH5Kit'
  s.version          = '1.0.7'
  s.summary          = 'A short description of VEH5Kit.'

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
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.author           = { 'lixiaopeng' => 'lixiaopeng.dev@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
    s.static_framework = true
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.subspec 'Core' do |c|
    c.vendored_libraries = 'VEH5Kit/Classes/Core/**/*.a'
    c.source_files = 'VEH5Kit/Classes/Core/**/*.h'
    c.public_header_files = 'VEH5Kit/Classes/Core/*.h'
    s.dependency 'OneKit/StartUp'
    s.dependency 'mars_gecko_ios/Core'
    s.dependency 'mars_gecko_ios/Core'
  end
  
  s.subspec 'WebView' do |w|
    w.vendored_libraries = 'VEH5Kit/Classes/WebView/**/*.a'
    w.source_files = 'VEH5Kit/Classes/WebView/**/*.h'
    w.public_header_files = 'VEH5Kit/Classes/WebView/*.h'
    w.dependency 'BDH5WebView/Core'
    w.dependency 'BDWebKitToB/Offline', '>=0.0.1'
    w.dependency 'OneKit/Service'
    w.dependency 'OneKit/StartUp'
  end
  
  s.subspec 'JSBridge' do |j|
    j.vendored_libraries = 'VEH5Kit/Classes/JSBridge/**/*.a'
    j.source_files = 'VEH5Kit/Classes/JSBridge/**/*.h'
    j.public_header_files = 'VEH5Kit/Classes/JSBridge/*.h'
    j.dependency 'BDXBridgeKitToB', '>=1.0.6'
  end

  s.default_subspecs =  'Core', 'JSBridge', 'WebView'
end

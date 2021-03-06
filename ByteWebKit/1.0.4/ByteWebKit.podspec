#
# Be sure to run `pod lib lint ByteWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ByteWebKit'
  s.version          = '1.0.4'
  s.summary          = 'A short description of ByteWebKit.'

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
    c.vendored_libraries = 'ByteWebKit/Classes/Core/*.a'
    c.public_header_files = 'ByteWebKit/Classes/Core/*.h'
    c.source_files = 'ByteWebKit/Classes/Core/*.h'
    c.dependency 'OneKit/StartUp'
    c.dependency 'mars_gecko_ios/Core'
  end
  
  s.subspec 'WebView' do |w|
    w.vendored_libraries = 'ByteWebKit/Classes/WebView/*.a'
    w.public_header_files = 'ByteWebKit/Classes/WebView/*.h'
    w.source_files = 'ByteWebKit/Classes/WebView/*.h'
    w.dependency 'BDH5WebView/Core'
    w.dependency 'BDWebKitToB/Offline'
    w.dependency 'OneKit/Service'
    w.dependency 'OneKit/StartUp'
  end
  
  s.subspec 'JSBridge' do |j|
    j.vendored_libraries = 'ByteWebKit/Classes/JSBridge/*.a'
    j.public_header_files = 'ByteWebKit/Classes/JSBridge/*.h'
    j.source_files = 'ByteWebKit/Classes/JSBridge/*.h'
    j.dependency 'BDXBridgeKitToB', '>=1.0.6'
  end

#  s.subspec 'WebView' do |w|
#    w.vendored_libraries = 'ByteWebKit/Classes/WebView/*.a'
#    w.private_header_files = 'ByteWebKit/Classes/WebView/*.h'
#    w.dependency 'ByteWebView'
#  end
  
  # s.resource_bundles = {
  #   'ByteWebKit' => ['ByteWebKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.source_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.default_subspecs =  'Core', 'JSBridge', 'WebView'
end

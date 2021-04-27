#
# Be sure to run `pod lib lint ByteWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ByteWebKit'
  s.version          = '1.0.5'
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
    c.vendored_libraries = 'ByteWebKit/Core/*.a'
    c.public_header_files = 'ByteWebKit/Core/*.h'
    c.source_files = 'ByteWebKit/Core/*.h'
    c.dependency 'OneKit/StartUp', '1.1.4'
    c.dependency 'mars_gecko_ios/Core', '2.0.4'
  end
  
  s.subspec 'WebView' do |w|
    w.vendored_libraries = 'ByteWebKit/WebView/*.a'
    w.public_header_files = 'ByteWebKit/WebView/*.h'
    w.source_files = 'ByteWebKit/WebView/*.h'
    w.dependency 'BDH5WebView/Core', '0.1.1'
    w.dependency 'BDWebKitToB/Offline', '0.1.4'
    w.dependency 'OneKit/Service', '1.1.4'
    w.dependency 'OneKit/StartUp', '1.1.4'
  end
  
  s.subspec 'JSBridge' do |j|
    j.vendored_libraries = 'ByteWebKit/JSBridge/*.a'
    j.public_header_files = 'ByteWebKit/JSBridge/*.h'
    j.source_files = 'ByteWebKit/JSBridge/*.h'
    j.dependency 'BDXBridgeKitToB', '>=1.0.6'
  end

#  s.subspec 'WebView' do |w|
#    w.vendored_libraries = 'ByteWebKit/WebView/*.a'
#    w.private_header_files = 'ByteWebKit/WebView/*.h'
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

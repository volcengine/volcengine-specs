#
# Be sure to run `pod lib lint OKJSBridgeToB.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OKJSBridgeToB'
  s.version          = '1.0.7'
  s.summary          = 'A short description of OKJSBridgeToB.'

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
      
  s.subspec 'JSBridge' do |d|
    d.frameworks =  'Foundation'
    d.dependency 'OneKit/BaseKit'
    d.dependency 'BDWebCoreToB'
    d.dependency 'TTNetworkManager'
    d.vendored_libraries = 'OKJSBridgeToB/Classes/JSBridge/*.a'
    d.public_header_files = 'OKJSBridgeToB/Classes/JSBridge/**/*.h'
    d.source_files = 'OKJSBridgeToB/Classes/JSBridge/**/*.h'
  end
  s.default_subspecs = 'JSBridge'
end

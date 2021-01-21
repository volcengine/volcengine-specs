#
# Be sure to run `pod lib lint MSSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VolMetaSecML'
  s.version          = '4.0.0'
  s.summary          = 'metasec sdk for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS platform security SDK for all apps by pod
                       DESC
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = { :type => 'MIT', :file => 'VolMetaSecML/LICENSE' }
  s.author           = { 'huoxk'        => 'huoxinkai@bytedance.com',
                         'wangwenchong' => 'wangwenchong@bytedance.com' }
  s.source           = { :http => 'https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/VolMetaSecML/4.0.0/VolMetaSecML.zip'}
  s.ios.deployment_target = '8.0'

  s.library = 'resolv.9', 'c++', 'z'
  s.frameworks = 'MessageUI', 'CoreTelephony', 'SystemConfiguration', 'CoreMotion','UIKit','JavaScriptCore'

  s.frameworks = 'CoreLocation'
  s.public_header_files = 'VolMetaSecML/*.h'
  s.source_files = 'VolMetaSecML/*'
  s.vendored_libraries = 'VolMetaSecML/libmetasec_ml.a'
  # a.dependency 'Heimdallr/HMDDomestic'
  
  
  # s.dependency 'Heimdallr/TTMonitor'
  # s.dependency 'Heimdallr/HMDSDKMonitor'
  # s.dependency 'Heimdallr/HMDURLProtocolTracker'
  
end

#
# Be sure to run `pod lib lint MSSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VolCPSDK'
  s.version          = '0.0.5'
  s.summary          = 'content protect sdk for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS platform security SDK for all apps by pod
                       DESC
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = { :type => 'MIT', :file => 'VolContentProtectML/LICENSE' }
  s.author           = { 'wangwenchong' => 'wangwenchong@bytedance.com' }
  s.source           = { :http => 'https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/VolCPSDK/0.0.5/VolCPSDK.zip'}
  s.ios.deployment_target = '9.0'

  s.subspec 'CPSDK' do |subspec|
    subspec.public_header_files = 'VolCPSDK/CPSDK/Classes/*.h'
    subspec.source_files = 'VolCPSDK/CPSDK/Classes/*'
    subspec.vendored_libraries = 'VolCPSDK/CPSDK/libCPSDK.a'
  end

  s.subspec 'GCELite' do |a|
      a.vendored_libraries = 'VolCPSDK/GCELite/libgce_task.a'
      a.dependency 'VolCPSDK/CPSDK'
      a.library = 'c++'
      a.dependency 'VolGCELite'
  end

  s.ios.frameworks = ['Accelerate', 'CoreMedia', 'AVFoundation']
  s.libraries = 'stdc++'
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

end

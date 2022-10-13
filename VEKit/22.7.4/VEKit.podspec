#
# Be sure to run `pod lib lint ByteWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VEKit'
  s.version          = '22.7.4'
  s.summary          = 'A short description of VEKit.'

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
  s.author           = { 'shangguanchengyang' => 'shangguanchengyang.1@bytedance.com' }
  s.source           = { :git => 'https://gitee.com/volcengine/VEKit.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.static_framework = true
  s.source_files = '**/*.{h,m,mm}'
  s.public_header_files = '**/*.h'
  s.default_subspecs = ['OneKit']
  s.subspec 'OneKit' do |d|
    d.dependency 'OneKit','1.3.8'
  end

  s.subspec 'VEH5Kit' do |d|
    d.dependency 'VEH5Kit','1.1.6'
  end

  s.subspec 'VEAppUpdateHelper' do |d|
    d.dependency 'VEAppUpdateHelper','1.0.19'
  end

  s.subspec 'VEInstall' do |d|
    d.dependency 'VEInstall','1.0.3'
  end

  s.subspec 'VERemoteConfig' do |d|
    d.dependency 'VERemoteConfig','1.0.4'
  end

  s.subspec 'RangersAppLog' do |d|
    d.dependency 'RangersAppLog','6.9.0'
  end

  s.subspec 'RangersAPM' do |d|
    d.dependency 'RangersAPM/Crash','2.9.0'
  end

  s.subspec 'RARegisterKit' do |d|
    d.dependency 'RARegisterKit','0.0.4'
  end

  s.subspec 'BDHotfix' do |d|
    d.dependency 'BDHotfix','1.0.14'
  end

  s.subspec 'TTNetworkManager' do |d|
    d.dependency 'TTNetworkManager','5.0.29.26'
  end

  s.subspec 'SwiftOneKit' do |d|
    d.dependency 'SwiftOneKit','1.0.1'
  end

  s.subspec 'Timor' do |d|
    d.dependency 'Timor','2.3.0.1'
    d.dependency 'TimorHostPlugins','2.3.0.1'
  end

  s.subspec 'VESMStorage' do |d|
    d.dependency 'VESMStorage','0.0.4'
  end

  s.subspec 'VESafeKeyboard' do |d|
    d.dependency 'VESafeKeyboard','1.0.1'
  end
  s.subspec 'VECampaign' do |d|
    d.dependency 'VECampaign', '0.0.1'
  end

  s.subspec 'VESDKMonitorWrapper' do |d|
    d.dependency 'VESDKMonitorWrapper', '0.0.2'
  end

  s.subspec 'VEShare' do |d|
    d.dependency 'VEShare', '0.0.9'
  end
end

#
# Be sure to run `pod lib lint ByteWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VEKit'
  s.version          = '0.0.5-rc0'
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
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shangguanchengyang' => 'shangguanchengyang.1@bytedance.com' }
  s.source           = { :git => 'https://github.com/volcengine/VEKit.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.static_framework = true
  s.source_files = '**/*.{h,m,mm}'
  s.public_header_files = '**/*.h'
  s.default_subspecs = ['OneKit']
  s.subspec 'OneKit' do |d|
    d.dependency 'OneKit','1.3.5-rc0'
  end

  s.subspec 'OneKitDemo' do |d|
    d.dependency 'OneKit/BaseKit'
    d.dependency 'OneKit/Defaults'
    d.dependency 'OneKit/Database'
    d.dependency 'OneKit/MARS'
    d.dependency 'OneKit/Reachability'
    d.dependency 'OneKit/Service'
    d.dependency 'OneKit/StartUp'
    d.dependency 'OneKit/Screenshot'
  end

  s.subspec 'VEH5Kit' do |d|
    d.dependency 'VEH5Kit','1.1.6-rc.0'
  end

  s.subspec 'VEAppUpdateHelper' do |d|
    d.dependency 'VEAppUpdateHelper','1.0.19'
  end

  s.subspec 'VEAppUpdateHelperDemo' do |d|
    d.dependency 'VEAppUpdateHelper/VEUpdateHelper'
    d.dependency 'VEAppUpdateHelper/VEUpdateView'
  end

  s.subspec 'VEInstall' do |d|
    d.dependency 'VEInstall','1.0.3'
  end

  s.subspec 'VEInstallDemo' do |d|
    d.dependency 'VEInstall/Core'
    d.dependency 'VEInstall/URL/CN'
    d.dependency 'VEInstall/IDFA'
    d.dependency 'VEInstall/CAID'
    d.dependency 'VEInstall/OneKit'
  end

  s.subspec 'VERemoteConfig' do |d|
    d.dependency 'VERemoteConfig','1.0.3'
  end

  s.subspec 'VERemoteConfigDemo' do |d|
    d.dependency 'VERemoteConfig/Core'
    d.dependency 'VERemoteConfig/OneKit'
    d.dependency 'VERemoteConfig/TestPage'
  end

  s.subspec 'RangersAppLog' do |d|
    d.dependency 'RangersAppLog','6.9.0'
  end

  s.subspec 'RangersAppLogDemo' do |d|
    d.dependency 'RangersAppLog/Core'
    d.dependency 'RangersAppLog/Host'
    d.dependency 'RangersAppLog/OneKit'
    d.dependency 'RangersAppLog/UITracker'
    d.dependency 'RangersAppLog/Picker'
    d.dependency 'RangersAppLog/Log'
    d.dependency 'RangersAppLog/Unique'
  end

  s.subspec 'RangersAPM' do |d|
    d.dependency 'RangersAPM','2.7.4-rc.0'
  end

  s.subspec 'RangersAPMDemo' do |d|
    d.dependency 'RangersAPM/Crash'
    d.dependency 'RangersAPM/WatchDog'
    d.dependency 'RangersAPM/OOM'
    d.dependency 'RangersAPM/LAG'
    d.dependency 'RangersAPM/UserException'
    d.dependency 'RangersAPM/Monitors'
    d.dependency 'RangersAPM/UITrackers'
    d.dependency 'RangersAPM/Hybrid'
    d.dependency 'RangersAPM/MemoryGraph'
    d.dependency 'RangersAPM/Network'
    d.dependency 'RangersAPM/EventMonitor'
    d.dependency 'RangersAPM/CN'
  end

  s.subspec 'RARegisterKit' do |d|
    d.dependency 'RARegisterKit','0.0.4'
  end

  s.subspec 'BDHotfix' do |d|
    d.dependency 'BDHotfix','1.0.13'
  end

  s.subspec 'TTNetworkManager' do |d|
    d.dependency 'TTNetworkManager','5.0.29.26'
  end

  s.subspec 'SwiftOneKit' do |d|
    d.dependency 'SwiftOneKit','1.0.1'
  end

  s.subspec 'Timor' do |d|
    d.dependency 'Timor','2.2.0.1'
    d.dependency 'TimorHostPlugins','2.2.0.1'
  end

end

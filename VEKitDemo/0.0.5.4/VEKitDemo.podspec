#
# Be sure to run `pod lib lint ByteWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VEKitDemo'
  s.version          = '0.0.5.4'
  s.summary          = 'Demo of VEKit'

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
  s.source           = { :git => 'https://github.com/volcengine/VEKitDemo.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.static_framework = true
  # s.default_subspecs = ['Public']

  s.subspec 'Public' do |d|
    d.source_files = 'VEKitDemo/Public/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/Public/**/*.h'
    d.resource_bundles = {
      'Public' => ['VEKitDemo/Assets/*.xcassets','VEKitDemo/Assets/*.js']
    }
    d.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Headers/Public/WCDB"' }
    d.dependency 'VEKit/OneKit'
  end

  s.subspec 'OneKit' do |d|
    d.source_files = 'VEKitDemo/OneKit/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/OneKit/**/*.h'
    d.dependency 'VEKit/OneKit'
    d.dependency 'VEKitDemo/Public'
    d.dependency 'OneKit/Defaults'
    d.dependency 'OneKit/Screenshot'
    d.dependency 'OneKit/Defaults'
    d.dependency 'OneKit/StartUp'
    d.dependency 'OneKit/Core'
    d.dependency 'OneKit/Service'
    d.dependency 'OneKit/Database'
    d.dependency 'OneKit/MARS/Auth'

  end

  s.subspec 'VEH5Kit' do |d|
    d.source_files = 'VEKitDemo/VEH5Kit/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/VEH5Kit/**/*.h'
    d.dependency 'VEKit/VEH5Kit'
    d.dependency 'VEKitDemo/Public'
  end
 
  s.subspec 'VEAppUpdateHelper' do |d|
    d.source_files = 'VEKitDemo/VEAppUpdateHelper/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/VEAppUpdateHelper/**/*.h'
    d.dependency 'VEKit/VEAppUpdateHelper'
    d.dependency 'VEKitDemo/Public'
  end

  s.subspec 'VEInstall' do |d|
    d.source_files = 'VEKitDemo/VEInstall/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/VEInstall/**/*.h'
    d.dependency 'VEKit/VEInstall'
    d.dependency 'VEKitDemo/Public'
    d.dependency 'VEInstall/Core'
    d.dependency 'VEInstall/URL/CN'
    d.dependency 'VEInstall/IDFA'
    d.dependency 'VEInstall/CAID'
    d.dependency 'VEInstall/OneKit'
  end
 
  s.subspec 'VERemoteConfig' do |d|
    d.source_files = 'VEKitDemo/VERemoteConfig/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/VERemoteConfig/**/*.h'
    d.dependency 'VEKit/VERemoteConfig'
    d.dependency 'VERemoteConfig/TestPage'
    d.dependency 'VERemoteConfig/Core'
    d.dependency 'VERemoteConfig/OneKit'
    d.dependency 'VEKitDemo/Public'
  end

  s.subspec 'RangersAppLog' do |d|
    d.source_files = 'VEKitDemo/RangersAppLog/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/RangersAppLog/**/*.h'
    d.dependency 'VEKit/RangersAppLog'
    d.dependency 'VEKitDemo/Public'
    d.dependency 'RangersAppLog/Core'
    d.dependency 'RangersAppLog/Host/CN'
    d.dependency 'RangersAppLog/OneKit'
    d.dependency 'RangersAppLog/UITracker'
    d.dependency 'RangersAppLog/Picker'
    d.dependency 'RangersAppLog/Log'
    d.dependency 'RangersAppLog/Unique'
  end

  s.subspec 'RangersAPM' do |d|
    d.source_files = 'VEKitDemo/RangersAPM/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/RangersAPM/**/*.h'
    d.dependency 'VEKit/RangersAPM'
    d.dependency 'VEKitDemo/Public'
    d.dependency 'RangersAPM/Crash'
    d.dependency 'RangersAPM/OOM'
    d.dependency 'RangersAPM/UserException'
    d.dependency 'RangersAPM/Monitors'
    d.dependency 'RangersAPM/CN'
    d.dependency 'RangersAPM/UITrackers'
    d.dependency 'RangersAPM/EventMonitor'
    d.dependency 'RangersAPM/MemoryGraph'
    d.dependency 'RangersAPM/Network'
  end

  s.subspec 'BDHotfix' do |d|
    d.source_files = 'VEKitDemo/BDHotfix/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/BDHotfix/**/*.h'
    d.dependency 'VEKit/BDHotfix'
    d.dependency 'VEKitDemo/Public'
  end

  s.subspec 'TTNetworkManager' do |d|
    d.source_files = 'VEKitDemo/TTNetworkManager/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/TTNetworkManager/**/*.h'
    d.dependency 'VEKit/TTNetworkManager'
    d.dependency 'VEKitDemo/Public'
  end

  s.subspec 'Timor' do |d|
    d.source_files = 'VEKitDemo/Timor/**/*.{h,m,mm}'
    d.public_header_files = 'VEKitDemo/Timor/**/*.h'
    d.dependency 'VEKit/Timor'
    d.dependency 'VEKitDemo/Public'
  end

end

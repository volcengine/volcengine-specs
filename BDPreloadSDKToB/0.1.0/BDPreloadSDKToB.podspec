#
# Be sure to run `pod lib lint BDPreloadSDKToB.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDPreloadSDKToB'
  s.version          = '0.1.0'
  s.summary          = '预加载库，提供统一的预加载队列管理能力'

  s.description      = <<-DESC
  预加载库，提供统一的预加载队列管理能力.
                       DESC

  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.author           = { 'caiweilong' => 'caiweilong@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/BDPreloadSDKToB/#{s.version}/BDPreloadSDKToB.zip" }

  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.default_subspecs = 'Core'
  s.static_framework = true
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.subspec 'Core' do |core|
      core.vendored_libraries = 'BDPreloadSDKToB/Classes/Core/*.a'
      core.frameworks = 'Foundation','UIKit'
      core.dependency 'OneKit/Reachability'
  end

  s.subspec 'WebView' do |webview|
      webview.vendored_libraries = 'BDPreloadSDKToB/Classes/WebView/*.a'
      webview.dependency 'BDPreloadSDKToB/Core'
      webview.dependency 'YYCache'
  end

# Note: 以下subspec暂时不用

#  s.subspec 'Image' do |image|
#      image.source_files = 'BDPreloadSDK/Classes/Image/**/*.{h,m,mm}'
#      image.dependency 'BDPreloadSDKToB/Core'
#      image.dependency 'TTImage'
#  end

#  s.subspec 'TTNet' do |ttnet|
#      ttnet.source_files = 'BDPreloadSDK/Classes/TTNet/**/*.{h,m,mm}'
#      ttnet.dependency 'BDPreloadSDKToB/Core'
#      ttnet.dependency 'TTNetworkManager'
#  end

end

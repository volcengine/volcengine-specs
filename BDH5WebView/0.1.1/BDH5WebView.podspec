#
# Be sure to run `pod lib lint BDH5WebView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDH5WebView'
  s.version          = '0.1.1'
  s.summary          = 'ByteDance WebView.'
  s.description      = 'ByteDance WebView'
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.author           = { 'linyong' => 'linyong.ly@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target = '9.0'
  s.default_subspecs = 'Core', 'Offline'
  # s.default_subspecs = 'Core', 'BridgeUnify', 'Offline', 'Template', 'PreDownloader', 'Native', 'WebMonitor', 'Prefetch'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.subspec 'Core' do |core|
      core.requires_arc = true
      core.vendored_libraries = 'BDH5WebView/Classes/Core/*.a'
      core.public_header_files = 'BDH5WebView/Classes/Core/*.h','BDH5WebView/Classes/Core/extension/BDWebViewExtension.h','BDH5WebView/Classes/Core/util/*.h','BDH5WebView/Classes/Core/monitor/BDWebViewMonitorExtension.h','BDH5WebView/Classes/Core/network/BDWebView+BDServerTrust.h','BDH5WebView/Classes/Core/Private/*.h'
      core.source_files = 'BDH5WebView/Classes/Core/*.h','BDH5WebView/Classes/Core/extension/BDWebViewExtension.h','BDH5WebView/Classes/Core/util/*.h','BDH5WebView/Classes/Core/monitor/BDWebViewMonitorExtension.h','BDH5WebView/Classes/Core/network/BDWebView+BDServerTrust.h','BDH5WebView/Classes/Core/Private/*.h'
      core.frameworks = 'Foundation','UIKit'
      # core.dependency 'TTKitchen'
      # core.dependency 'BDTrackerProtocol'
      core.dependency 'TTNetworkManager'
      core.dependency 'RSSwizzle'
      core.dependency 'OneKit/ByteDanceKit/Foundation'
      core.dependency 'BDWebCoreToB'
      core.dependency 'BDWebKitToB/Precreator'
      core.dependency 'BDWebKitToB/Core'
      core.dependency 'BDWebKitToB/TTNet'
      core.dependency 'BDWebKitToB/Cookie'
      core.dependency 'BDWebKitToB/SSL'
      core.dependency 'BDWebKitToB/BlankDetect'
      core.dependency 'BDWebKitToB/CrashFix'
      core.dependency 'BDWebKitToB/Interceptor'
      core.resource_bundles = {
          'BDH5WebView' => [
            'BDH5WebView/Assets/*.xcassets',
            'BDH5WebView/Assets/wk_hookajax.js'
          ]
      }
  end

  s.subspec 'Offline' do |offline|
      offline.requires_arc = true
      offline.vendored_libraries = 'BDH5WebView/Classes/Offline/*.a'
      offline.public_header_files = 'BDH5WebView/Classes/Offline/*.h'
      offline.source_files = 'BDH5WebView/Classes/Offline/*.h'
      offline.dependency 'BDH5WebView/Core'
      offline.dependency 'BDWebKitToB/Offline'
  end
  
  # s.subspec 'Native' do |native|
  #     native.requires_arc = true
  #     native.source_files = 'BDH5WebView/Classes/Native/*.{h,m,mm}'
  #     native.public_header_files = 'BDH5WebView/Classes/Native/*.{h}'
  #     native.dependency 'BDNativeWebComponent/Core', '>=0.0.9'
  # end

  # s.subspec 'PreDownloader' do |download|
  #   download.requires_arc = true
  #   download.source_files = 'BDH5WebView/Classes/Downloader/**/*.{h,m,mm}'
  #   download.public_header_files = 'BDH5WebView/Classes/Downloader/Header/*.h'
  #   download.dependency 'YYCache'
  #   download.dependency 'TTNetworkManager'
  #   download.dependency 'FMDB', '>= 2.6.2'
  #   download.dependency 'TTReachability', '>= 0.6'
  #   download.dependency 'BDAlogProtocol'
  #   download.dependency 'BDPreloadSDK/TTNet'
  #   download.dependency 'OneKit/ByteDanceKit/Foundation'    
  # end

  # s.subspec 'Template' do |template|
  #     template.requires_arc = true
  #     template.source_files = 'BDH5WebView/Classes/Template/**/*.{h,m,mm}'
  #     template.public_header_files = 'BDH5WebView/Classes/Template/Header/*.h'
  #     template.dependency 'TTBridgeUnify/TTBridge', '>=3.1'
  #     template.dependency 'TTBridgeUnify/UnifiedWebView', '>=3.1'
  #     template.dependency 'BDH5WebView/Core'
  #     template.dependency 'BDH5WebView/BridgeUnify'
  #     template.dependency 'BDH5WebView/PreDownloader'
  # end

  # s.subspec 'TemplateTestResources' do |template|
  #   template.dependency 'BDH5WebView/Template'
  #   template.resource_bundles = {
  #     'TemplateBundle' => ['BDH5WebView/TestsAssets/*']
  #   }
  # end
  
  # s.subspec 'IESAdapter' do |ies|
  #     ies.requires_arc = true
  #     ies.source_files = 'BDH5WebView/Classes/IESAdapter/**/*.{h,m,mm}'
  #     ies.public_header_files = 'BDH5WebView/Classes/IESAdapter/*.h'
  #     ies.dependency 'BDH5WebView/Core'
  #     ies.dependency 'IESWebKit/Hybrid'
  # end

  # s.subspec 'Prefetch' do |prefetch|
  #   prefetch.requires_arc = true
  #   prefetch.source_files = 'BDH5WebView/Classes/Prefetch/**/*.{h,m,mm}'
  #   prefetch.dependency 'BDH5WebView/Core'
  #   prefetch.dependency 'IESPrefetch'
  #   prefetch.dependency 'TTBridgeUnify/TTBridge'
  # end
  
  # s.subspec 'WebMonitor' do |monitor|
  #   monitor.requires_arc = true
  #   monitor.source_files = 'BDH5WebView/Classes/WebMonitor/**/*.{h,m,mm}'
  #   monitor.dependency 'BDH5WebView/Core'
  #   monitor.dependency 'BDWebCore/Core'
  #   monitor.dependency 'IESWebViewMonitor/Core', '>= 1.1.4'
  #   monitor.dependency 'IESWebViewMonitor/WKWebView', '>= 1.1.4'
  #   monitor.dependency 'IESWebViewMonitor/SettingModel', '>= 1.1.4'
  #   monitor.dependency 'IESWebViewMonitor/CustomInterface/WebInterface', '>= 1.1.4'
  # end
  
  # s.subspec 'SecureLink' do |ss|
  #   ss.requires_arc = true
  #   ss.source_files = 'BDH5WebView/Classes/SecureLink/**/*.{h,m,mm}'
  #   ss.dependency 'BDH5WebView/Core'
  #   ss.dependency 'BDWebKitToB/SecureLink'
  # end

  # s.subspec 'Debug' do |debug|
  #   debug.requires_arc = true
  #   debug.source_files = 'BDH5WebView/Classes/Debug/**/*.{h,m,mm}'
  #   debug.dependency 'BDH5WebView/Core'
  #   debug.dependency 'TTBridgeUnify/TTBridge', '>=3.1'
  #   debug.dependency 'BDWebDebugger/Log'
  # end
  
  # s.test_spec 'Tests' do |test|
  #     test.source_files = 'BDH5WebView/Classes/Tests/**/*.{h,m,mm}'
  #     test.dependency 'BDALog'
  #     test.dependency 'BDH5WebView/JSBridge'
  #     test.dependency 'BDH5WebView/TemplateTestResources'
  #     test.dependency 'BDH5WebView/Native'
  #     test.dependency 'CodeCoverageForXcode','~> 1.1.1'
  # end
  
  # s.subspec 'BridgeUnify' do |jsbridge|
  #     jsbridge.requires_arc = true
  #     jsbridge.source_files = 'BDH5WebView/Classes/BridgeUnify/**/*.{h,m,mm}'
  #     jsbridge.dependency 'BDH5WebView/Core'
  #     jsbridge.dependency 'TTBridgeUnify/TTBridge', '>=3.1'
  #     jsbridge.dependency 'TTBridgeUnify/WebView', '>=3.1'
  # end
  
#s.resources = "BDH5WebView/Assets/*.xcassets"
  s.public_header_files = 'Pod/Classes/Core/**/*.h'

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

#
# Be sure to run `pod lib lint BDWebKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDWebKitToB'
  s.version          = '0.1.5'
  s.summary          = 'A short description of BDWebKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.author           = 'Bytedance, Inc.'
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target = '9.0'
  s.frameworks = 'Foundation', 'UIKit', 'WebKit'
  s.dependency 'BDWebCoreToB'
  s.default_subspec = 'Core'
  s.static_framework = true
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.subspec 'Core' do |ss|  
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/Core/*.h'
    ss.source_files = 'BDWebKitToB/Core/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Core/*.a'
    ss.dependency 'OneKit/ByteDanceKit/Foundation'
    ss.dependency 'OneKit/BaseKit'
  end
  
  s.subspec 'Falcon' do |ss|
    ss.public_header_files = 'BDWebKitToB/Falcon/*.h'
    ss.source_files = 'BDWebKitToB/Falcon/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Falcon/*.a'
    ss.dependency 'BDWebKitToB/Core'
    ss.dependency 'BDWebKitToB/Interceptor'
    ss.dependency 'mars_gecko_ios/Core'
    ss.subspec 'WebP' do |wp|
        wp.vendored_libraries = 'BDWebKitToB/Falcon/WebP/*.a'
        wp.dependency 'libwebp'
        wp.frameworks = 'MobileCoreServices'
    end
  end

  s.subspec 'Offline' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/Offline/*.h'
    ss.source_files = 'BDWebKitToB/Offline/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Offline/*.a'
    ss.dependency 'BDWebKitToB/Falcon'
    ss.dependency 'BDWebKitToB/Resource'
    ss.dependency 'BDWebKitToB/Core'
    ss.dependency 'BDPreloadSDKToB/WebView'
  end

  s.subspec 'Resource' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/Resource/*.h'
    ss.source_files = 'BDWebKitToB/Resource/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Resource/*.a'
    ss.dependency 'mars_gecko_ios/Core'
  end

  s.subspec 'Interceptor' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/Interceptor/*.h'
    ss.source_files = 'BDWebKitToB/Interceptor/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Interceptor/*.a'

    ss.frameworks = 'Foundation','UIKit'
  end
  
  s.subspec 'Precreator' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/Precreator/*.h'
    ss.source_files = 'BDWebKitToB/Precreator/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Precreator/*.a'
    ss.frameworks = 'Foundation','UIKit'
  end

  s.subspec 'Cookie' do |ss|
    ss.public_header_files = 'BDWebKitToB/Cookie/*.h'
    ss.source_files = 'BDWebKitToB/Cookie/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Cookie/*.a'
    ss.dependency 'BDWebKitToB/Core'
  end
  
  s.subspec 'Keyboard' do |ss|
    ss.public_header_files = 'BDWebKitToB/Keyboard/*.h'
    ss.source_files = 'BDWebKitToB/Keyboard/*.h'
    ss.vendored_libraries = 'BDWebKitToB/Keyboard/*.a'
    ss.frameworks = 'Foundation','UIKit'
  end

  s.subspec 'BlankDetect' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/BlankDetect/*.h'
    ss.source_files = 'BDWebKitToB/BlankDetect/*.h'
    ss.vendored_libraries = 'BDWebKitToB/BlankDetect/*.a'
    ss.dependency 'BDWebKitToB/Core'
  end

  s.subspec 'CrashFix' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/CrashFix/*.h'
    ss.source_files = 'BDWebKitToB/CrashFix/*.h'
    ss.vendored_libraries = 'BDWebKitToB/CrashFix/*.a'
    ss.dependency 'BDWebKitToB/Core'
  end

  s.subspec 'SSL' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/SSL/*.h'
    ss.source_files = 'BDWebKitToB/SSL/*.h'
    ss.vendored_libraries = 'BDWebKitToB/SSL/*.a'
    ss.dependency 'BDWebKitToB/Core'
    ss.dependency 'BDWebKitToB/CrashFix'
    ss.dependency 'OneKit/ByteDanceKit/UIKit'
    ss.frameworks = 'Foundation','UIKit'
  end

  s.subspec 'TTNet' do |ss|
    ss.requires_arc = true
    ss.public_header_files = 'BDWebKitToB/TTNet/*.h'
    ss.source_files = 'BDWebKitToB/TTNet/*.h'
    ss.vendored_libraries = 'BDWebKitToB/TTNet/*.a'
    ss.dependency 'BDWebKitToB/Core'
    ss.dependency 'BDWebKitToB/Precreator'
    ss.dependency 'TTNetworkManager'
    ss.dependency 'BDWebKitToB/SSL'
    ss.dependency 'BDWebKitToB/Interceptor'
    ss.frameworks = 'Foundation','UIKit'
  end
  
 s.subspec 'Preload' do |ss|
  ss.vendored_libraries = 'BDWebKitToB/Preload/*.a'
  ss.dependency 'BDWebKitToB/Core'
  ss.dependency 'BDWebKitToB/Precreator'
  ss.frameworks = 'Foundation','UIKit'
end

#  s.subspec 'SecureLink' do |ss|
#    ss.public_header_files = 'BDWebKitToB/SecureLink/*.h'
#    ss.source_files = 'BDWebKitToB/SecureLink/*.{h,m}'
#    ss.dependency 'BDWebKitToB/Core'
#    ss.dependency 'TTReachability', '>= 1.8'
#    ss.dependency 'BDTrackerProtocol'
#    ss.dependency 'TTReachability'
#  end
  
#  s.subspec 'BDWKPrecreator' do |ss|
#    ss.dependency 'BDWebKitToB/Precreator'
#  end

#  s.subspec 'Prefetch' do |ss|
#    ss.requires_arc = true
#    ss.dependency 'IESPrefetch', '>= 1.0.0'
#    ss.dependency 'mars_gecko_ios/Core'
#    ss.dependency 'IESJSBridgeCore/Core'
#    ss.source_files = 'BDWebKitToB/Prefetch/**/*.{h,m}'
#  end

#  s.subspec 'CSRF' do |ss|
#    ss.requires_arc = true
#    ss.source_files = 'BDWebKitToB/CSRF/**/*.{h,m}'
#    ss.dependency 'BDWebKitToB/Core'
#    ss.dependency 'BDTrackerProtocol'
#  end
  
end

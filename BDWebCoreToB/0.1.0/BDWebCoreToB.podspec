#
# Be sure to run `pod lib lint BDWebCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDWebCoreToB'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BDWebCore.'

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
  s.author           = { 'li keliang' => 'likeliang@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target = '8.0'
  s.frameworks = 'UIKit', 'WebKit'
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
    ss.public_header_files = 'BDWebCoreToB/Classes/Core/*.h'
    ss.source_files = 'BDWebCoreToB/Classes/Core/*.h'
    ss.vendored_libraries = 'BDWebCoreToB/Classes/Core/*.a'
#    ss.dependency 'BDMonitorProtocol'
  end

#  s.subspec 'JSBridge' do |bridge|
#    bridge.source_files = 'BDWebCore/JSBridge/*.{h,m}'
#    bridge.dependency 'BDWebCore/Core'
#    bridge.dependency 'ByteDanceKit'
#    bridge.dependency 'Gaia'
#  end
  
#  s.subspec 'Legacy' do |legacy|
#    legacy.source_files = 'BDWebCore/Legacy/*.{h,m}'
#    legacy.public_header_files = 'BDWebCore/Legacy/*.h'
#    legacy.dependency 'BDWebCore/Core'
#  end

end

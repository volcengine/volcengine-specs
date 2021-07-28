#
# Be sure to run `pod lib lint VEAppUpdateHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VEAppUpdateHelper'
  s.version          = '1.0.12'
  s.summary          = "TF包引导升级"
  s.homepage         = 'https://code.byted.org/mars/VEAppUpdateHelper'
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
    }
  s.author           = { 'dengjinan' => 'dengjinan@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }
  s.ios.deployment_target = '9.0'
  s.frameworks            = 'Foundation'
  s.static_framework = true
  s.default_subspec       = 'VEUpdateHelper'
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'VEUpdateHelper' do |d|
    d.source_files        = "VEAppUpdateHelper/VEUpdateHelper/*.h"
    d.vendored_library    = 'VEAppUpdateHelper/VEUpdateHelper/*.a'
    d.dependency 'JSONModel'
    d.dependency 'OneKit/ByteDanceKit'
    d.dependency 'OneKit/StartUp'
    d.dependency 'OneKit/MARS/Auth'
    d.dependency 'OneKit/Reachability'
  end

  
  s.subspec 'VEUpdateView' do |v|
    v.source_files        = "VEAppUpdateHelper/VEUpdateView/*.h"
    v.vendored_library    = 'VEAppUpdateHelper/VEUpdateView/*.a'
    v.resource_bundles    = {
      'TTUpdateView' => ["VEAppUpdateHelper/VEUpdateView/Assets/*"],
    }
    v.dependency 'VEAppUpdateHelper/VEUpdateHelper'
    v.dependency 'OneKit/ByteDanceKit/Foundation'
    v.dependency 'OneKit/ByteDanceKit/UIKit'
    v.dependency 'lottie-ios', "2.5.3"
    v.dependency 'SSZipArchive'
  end


end

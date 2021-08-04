#
# Be sure to run `pod lib lint SpeechEngine.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                    = "SpeechEngineTts"
  s.version                 = "1.0.11"
  s.homepage                = "https://github.com/volcengine/volcengine-specs"
  s.license                 = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.author                  = 'Bytedance, Inc.'
  s.source                  = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/SpeechEngineTts/#{s.version}/SpeechEngineTts.zip" }
  s.summary                 = "Speech Engine SDK iOS version."
  s.description             = <<-DESC
                                Speech SDK
                                * Markdown format.
                                * Don't worry about the indent, we strip it!
                              DESC
  s.platform                = :ios, '9.0'
  s.requires_arc            = true
  s.xcconfig                = { 'OTHER_LDFLAGS' => '-force_load ${PODS_ROOT}/SpeechEngineTts/SpeechEngineTts/SpeechEngineTts.framework/SpeechEngineTts' }
  s.pod_target_xcconfig     = { 'VALID_ARCHS' => 'arm64 armv7 x86_64', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig    = { 'VALID_ARCHS' => 'arm64 armv7 x86_64', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.vendored_framework      = 'SpeechEngineTts/SpeechEngineTts.framework'
  s.frameworks              = "AudioToolbox", "AVFoundation"
  s.libraries               = "c++"
  s.dependency 'TTNetworkManager', '5.0.29.22'
end

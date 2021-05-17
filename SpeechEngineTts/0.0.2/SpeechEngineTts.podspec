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
  s.version                 = "0.0.2"
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
  s.static_framework        = true
  s.requires_arc            = true
  s.pod_target_xcconfig = {
    'VALID_ARCHS' => 'arm64 armv7 x86_64',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'VALID_ARCHS' => 'arm64 armv7 x86_64',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.source_files            = 'SpeechEngineTts/classes/SpeechEngine/**/*.{h,m,mm}', 'SpeechEngineTts/classes/EffectPlatformSDK/**/*.{h,m,mm}'
  s.public_header_files     = 'SpeechEngineTts/classes/SpeechEngine/SpeechEngineDefines.h', 'SpeechEngineTts/classes/SpeechEngine/SpeechEngine.h', 'SpeechEngineTts/classes/SpeechEngine/SpeechEngineMonitor.h', 'SpeechEngineTts/classes/SpeechEngine/SpeechResourceManager.h'
  s.ios.frameworks          = 'AudioToolbox', 'AVFoundation'
  s.ios.vendored_libraries  = "SpeechEngineTts/libs/libEffectPlatformSDK_Core_awesome_ios.a", "SpeechEngineTts/libs/libspeechsdk.dylib", "SpeechEngineTts/libs/libpetrel_tts.dylib"
  s.libraries               = "c++", "speechsdk", "petrel_tts"
  s.frameworks              = "AudioToolbox", "AVFoundation"
  s.dependency 'TTNetworkManager'
  s.dependency 'FileMD5Hash'
  s.dependency 'Mantle'
  s.dependency 'FMDB'
  s.dependency 'SSZipArchive'
end

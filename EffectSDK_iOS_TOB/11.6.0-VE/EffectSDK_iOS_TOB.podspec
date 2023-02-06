
# EffectSDK_iOS is the binary repo for effect_sdk.
# Source repo effect_sdk commit id is : 73938c8a2
# Do not modify this file, auto generate by script in repo effect_sdk!!!

Pod::Spec.new do |s|
s.name         = "EffectSDK_iOS_TOB"
s.version      = "11.6.0-VE"
s.summary      = "EffectSDK_iOS_TOB"
s.description      = <<-DESC
A cross platform render effect library for livestream and short vedio.
DESC

s.author       = { "zhouyi.ysj" => "zhouyi.ysj@bytedance.com" }
s.license      = "MIT"
s.homepage     = "https://EffectSDK_iOS"
s.source = { :http => "https://common.voleai.com/api/v1/veVos/repository?business=CV&key=#{$VEVOS_SPEC_KEY}&secret=#{$VEVOS_SPEC_SECRET}&repository=thrall_cv&version=#{s.version}", :type => "zip" }
s.ios.deployment_target = '8.0'
s.osx.deployment_target = '10.12'

s.default_subspecs = 'Core'
s.module_map = 'libEffectSDK/inc/EffectSdk.modulemap'

s.subspec 'Core' do |core|
    core.requires_arc = true
    core.public_header_files  = 'libEffectSDK/inc/**/*.h'
    core.header_mappings_dir = 'libEffectSDK/inc'
    core.source_files = 'libEffectSDK/inc/**/*.{h,m}', 'libEffectSDK/inc/EffectSdk-umbrella.h', 'libEffectSDK/inc/EffectSdk.modulemap'
    core.vendored_libraries = 'libEffectSDK/lib/Release/libeffect-sdk.a'
    core.frameworks = 'AVFoundation', 'CoreMedia', 'VideoToolbox', 'Accelerate', 'AudioToolbox', 'Foundation', 'GLKit', 'imageIO', 'IOKit', 'JavaScriptCore','AssetsLibrary','CoreGraphics','CoreImage','CoreVideo','QuartzCore','UIKit','CoreMotion'
    core.weak_frameworks = 'CoreHaptics','Metal','MetalPerformanceShaders', 'Photos', 'CoreML'
    core.libraries = 'z','c++','stdc++'
end

s.subspec 'FullModel' do |full|
    full.resource = 'libEffectSDK/Resources/EffectSDKResources.bundle'
    full.dependency 'EffectSDK_iOS/Core'
end

s.subspec 'PartModel' do |part|
    part.resource = 'libEffectSDK/Resources/part/EffectSDKResources.bundle'
    part.dependency 'EffectSDK_iOS/Core'
end

# s.subspec 'OCInterface' do |interface|
#     interface.source_files = 'libEffectSDK/ocInterface/ios/*.{h,mm,m}'
#     interface.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) BEF_FEATURE_CONFIG_GAME=1 '}
#     interface.frameworks = "AVFoundation", "CoreMedia", 'Foundation','GLKit','IOKit'
#     interface.dependency 'EffectSDK_iOS/Core'
# end



end

Pod::Spec.new do |s|
  s.name             = 'CSJIESSaasSDK'
  s.version          = '2.2.0.29'
  s.summary          = '聚合支付与直播SDK集合[通用版本]'
  s.license          = { :type => 'Commercial' }
  s.homepage         = 'https://internal.bytedance.com/your_repo'
  s.author           = { 'Bytedance' => 'yujie.10@bytedance.net' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/saas/#{s.version}/Frameworks.zip" }
  s.frameworks = 'CoreFoundation', 'UIKit'
  s.weak_frameworks  = 'PhotosUI', 'DeviceCheck', 'LocalAuthentication'
  s.libraries = 'c++', 'resolv.9', 'bz2', 'c++abi'

  s.ios.deployment_target = '12.0'
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC'
  }
  
  s.default_subspec = 'Normal'

  s.subspec 'Normal' do |ss|
    ss.dependency "CSJIESSaasSDK/Saas"
    ss.dependency "CSJIESSaasSDK/Douyin"
    ss.dependency "CSJIESSaasSDK/PaySDK"
  end

  # 主聚合模块
  s.subspec 'Saas' do |ss|
    ss.dependency "CSJIESSaasSDK/ByteDanceKit"
    ss.dependency "CSJIESSaasSDK/DYLiveSDK"
    ss.dependency "CSJIESSaasSDK/tfccsmsdk"
    ss.dependency "CSJIESSaasSDK/YataEventChain"
    ss.dependency "CSJIESSaasSDK/BDSword"
    ss.dependency "CSJIESSaasSDK/Gaia"
    ss.dependency 'CSJIESSaasSDK/isecgm'
    ss.dependency 'CSJIESSaasSDK/boringssl'
  end

  # 字节基础工具包
  s.subspec 'ByteDanceKit' do |ss|
    ss.vendored_frameworks = "Frameworks/ByteDanceKit.framework"
    ss.preserve_paths = "Frameworks/ByteDanceKit.framework"
  end

  # 直播核心SDK
  s.subspec 'DYLiveSDK' do |ss|
    ss.vendored_frameworks = "Frameworks/DYLiveSDK.framework"
    ss.preserve_paths = "Frameworks/DYLiveSDK.framework"
    ss.resources = [
      "Frameworks/DYLiveSDK.framework/*.bundle",
      "Frameworks/DYLiveSDK.framework/Headers/PrivacyInfo.xcprivacy"
    ]
  end


  # 短信验证码SDK
  s.subspec 'tfccsmsdk' do |ss|
    ss.vendored_frameworks = "Frameworks/tfccsmsdk.framework"
    ss.preserve_paths = "Frameworks/tfccsmsdk.framework"
  end

  # Yata 事件链 SDK
  s.subspec 'YataEventChain' do |ss|
    ss.vendored_frameworks = "Frameworks/YataEventChain.framework"
    ss.preserve_paths = "Frameworks/YataEventChain.framework"
  end

  # BDSword 加解密库
  s.subspec 'BDSword' do |ss|
    ss.source_files = "Frameworks/BDSword/Headers/Public/**/*.h"
    ss.public_header_files = "Frameworks/BDSword/Headers/Public/**/*.h"
    ss.header_mappings_dir = "Frameworks/BDSword/Headers/Public"
    ss.vendored_libraries = "Frameworks/BDSword/Libs/*.a"
    ss.preserve_paths = [
      "Frameworks/BDSword/Libs/*.a",
      "Frameworks/BDSword/Headers/Public/**/*.h"
    ]
    ss.requires_arc = false
    ss.pod_target_xcconfig = {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end
  
  s.subspec 'PaySDK' do |ss|
    ss.dependency 'AlipaySDK-iOS'
    ss.dependency 'WechatOpenSDK-XCFramework'
  end

  s.subspec 'Douyin' do |ss|
    ss.dependency 'DouyinSDK/Services/Auth','2.2.0.6-saas'
    ss.dependency 'DouyinSDK/Services/Security','2.2.0.6-saas'
    ss.dependency 'DouyinSDK/Services/CommonParams', '2.2.0.6-saas'
    ss.dependency 'TTSDKFramework/LivePull', '1.46.2.7-premium'
    ss.dependency 'DouyinOpenSDK','4.1.6'
    ss.dependency 'RangersAppLog/Log', '6.16.9'
    ss.dependency 'RangersAppLog/Unique', '6.16.9'
  end

  s.subspec 'Gaia' do |ss|
    ss.vendored_frameworks = 'Frameworks/Gaia.framework'
    ss.preserve_paths = ['Frameworks/Gaia.framework']
  end

  s.subspec 'isecgm'  do |ss|
    ss.vendored_frameworks = 'Frameworks/isecgm.xcframework'
  end

  s.subspec 'boringssl' do |ss|
    ss.preserve_paths = [
      'Frameworks/boringssl/include/*',
      'Frameworks/boringssl/include/**/*',
      'Frameworks/boringssl/libboringssl.a',
      'Frameworks/boringssl/libboringssl_asm.a'
    ]
    ss.ios.vendored_libraries = [
      'Frameworks/boringssl/libboringssl.a',
      'Frameworks/boringssl/libboringssl_asm.a'
    ]
    ss.libraries = 'boringssl', 'boringssl_asm'
    ss.user_target_xcconfig = {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'GCC_PREPROCESSOR_DEFINITIONS' => 'boringssl_POD_VERSION=@"13_0.3.0-alpha.0-SM"'
    }
    ss.pod_target_xcconfig = {
      'USE_HEADERMAP' => 'NO',
      'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/Frameworks/boringssl/include"',
      'ALWAYS_SEARCH_USER_PATHS' => 'NO',
      'GCC_PREPROCESSOR_DEFINITIONS' => 'boringssl_POD_VERSION=@"13_0.3.0-alpha.0-SM" TTNET_IMPLEMENT',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
    ss.source_files = 'Frameworks/boringssl/include/openssl/*.h'
    ss.public_header_files = 'Frameworks/boringssl/include/openssl/*.h'
    ss.header_mappings_dir = 'Frameworks/boringssl/include'
  end

end

Pod::Spec.new do |s|
  s.name             = 'CSJIESSaasSDK'
  s.version          = '2.2.0.21'
  s.summary          = '聚合支付与直播SDK集合'
  s.license          = { :type => 'Commercial' }
  s.homepage         = 'https://internal.bytedance.com/your_repo'
  s.author           = { 'YourTeam' => 'yujie.10@bytedance.net' }
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
    ss.dependency "CSJIESSaasSDK/Public"
  end

  # 主聚合模块
  s.subspec 'Saas' do |ss|
    ss.dependency "CSJIESSaasSDK/ByteDanceKit"
    ss.dependency "CSJIESSaasSDK/DYLiveSDK"
    ss.dependency "CSJIESSaasSDK/UTDID"
    ss.dependency "CSJIESSaasSDK/tfccsmsdk"
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

  # 设备标识SDK
  s.subspec 'UTDID' do |ss|
    ss.vendored_frameworks = "Frameworks/UTDID.framework"
    ss.preserve_paths = "Frameworks/UTDID.framework"
  end

  # 短信验证码SDK
  s.subspec 'tfccsmsdk' do |ss|
    ss.vendored_frameworks = "Frameworks/tfccsmsdk.framework"
    ss.preserve_paths = "Frameworks/tfccsmsdk.framework"
  end
  
  s.subspec 'PaySDK' do |ss|
    ss.dependency 'AlipaySDK-iOS'
    ss.dependency 'WechatOpenSDK-XCFramework'
  end

  s.subspec 'Douyin' do |ss|
    ss.dependency 'DouyinSDK/Services/Auth','2.2.0.5-saas'
    ss.dependency 'DouyinSDK/Services/Security','2.2.0.5-saas'
    ss.dependency 'DouyinSDK/Services/CommonParams', '2.2.0.5-saas'
    ss.dependency 'TTSDKFramework/LivePull', '1.46.2.7-premium'
    # ss.dependency 'DouyinOpenSDK','4.1.6'
    ss.dependency 'RangersAppLog/Log', '6.16.9'
  end


  s.subspec 'Public' do |ss|
    ss.dependency 'Protobuf','3.8.0'
    ss.dependency 'libwebp', '1.3.2'
    ss.dependency 'FMDB',  '2.7.12'
    ss.dependency 'ReactiveObjC', '3.1.0'
    ss.dependency 'MMKV', '1.3.4'
    ss.dependency 'Masonry', '1.1.0'
    ss.dependency 'JSONModel', '1.8.0'
    ss.dependency 'MJRefresh', '3.1.12'
    ss.dependency 'lottie-saas', '2.5.4'
    ss.dependency 'Godzippa', '2.1.1'
    ss.dependency 'pop', '1.0.10'
    ss.dependency 'libextobjc','0.6'
    ss.dependency 'YYCache', '1.0.4'
    ss.dependency 'YYText', '1.0.7'
    ss.dependency 'IGListKit', '3.4.0'
    ss.dependency 'KVOController', '1.2.0'
    ss.dependency 'SSZipArchive', '2.1.5'
  end
end

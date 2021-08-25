Pod::Spec.new do |s|
  s.name             = 'Pangrowth'
  s.version          = '1.2.0.0'
  s.summary          = 'Pangrowth is an SDK that integrates novels, media, and live broadcasts.'
  s.description      = <<-DESC
Pangrowth is an SDK that integrates novels, media, and live broadcasts.
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/#{s.version.to_s}/Pangrowth-#{s.version.to_s}.zip" }

  s.ios.deployment_target = '9.0'

#  s.source_files = 'Pangrowth/Classes/**/*'
  
  # s.dependency 'Ads-CN','>= 3.7.0.8'

  s.dependency 'RangersAppLog/Core', '5.6.6'
  s.dependency 'RangersAppLog/Host/CN', '5.6.6'
  s.dependency 'RangersAppLog/Log', '5.6.6'
  s.dependency 'RangersAppLog/Picker', '5.6.6'
  s.dependency 'RangersAppLog/UITracker', '5.6.6'

  s.dependency 'RangersAPM/Core', '2.0.5'
  s.dependency 'RangersAPM/Crash', '2.0.5'
  s.dependency 'RangersAPM/EventMonitor', '2.0.5'
  s.dependency 'RangersAPM/HMD', '2.0.5'
  s.dependency 'RangersAPM/Public', '2.0.5'
  
  # 小说
  s.subspec 'novel' do |ss|
    ss.dependency 'BDNovelOpenSDK', '3.3.0'
  end
  
  # 流媒体，包含了TTVideoEngine
  s.subspec 'media' do |ss|
    ss.dependency 'PangrowthMedia', '2.9.0.0'
  end
  
  # 流媒体，TTVideoEngine动态库全架构大包
  s.subspec 'media-dynamic' do |ss|
    ss.dependency 'PangrowthMedia-dynamic', '2.9.2.0'
  end
  
  # 流媒体+直播
  s.subspec 'media-live' do |ss|
    ss.dependency 'PangrowthMedia-live', '2.9.3.0'
    ss.dependency 'DouyinOpenSDK', '~> 4.0.0'
    ss.dependency 'PangrowthLiveSDK', '1.8.7.25'
    ss.dependency 'Pangrowth/live-3rd-dep'
  end

  s.subspec 'sec' do |ss|
    ss.dependency 'VolMetaSecML', '4.3.0.5-bugfix'
  end

  s.subspec 'live-3rd-dep' do |ss|
    ss.dependency 'OneKit/ByteDanceKit'

    ss.dependency 'TTSDK/Core', '1.16.1.5-premium'
    ss.dependency 'TTSDK/TTFFmpeg', '1.16.1.5-premium'
    ss.dependency 'TTSDK/PlayerCore', '1.16.1.5-premium'
    ss.dependency 'TTSDK/LivePull', '1.16.1.5-premium'
    ss.dependency 'TTSDK/Player', '1.16.1.5-premium'
    # TTNet引用
    ss.dependency 'AFgzipRequestSerializer'#, '0.0.2'
    ss.dependency 'AFNetworking'#,'2.5.4'
    
    ss.dependency 'FMDB'#, '2.6.2'
    # 礼物kit引用
    ss.dependency 'FileMD5Hash'#, '2.0.0'
    
    # gecko引用
    ss.dependency 'SSZipArchive'#, '2.1.4'
    
    # BDWebImage
    ss.dependency 'YYCache'#, '1.0.4'
    ss.dependency 'libwebp'#, '1.0.2'
    
    # SaaSKit 直接引用
    ss.dependency 'Mantle'#, '2.1.2'
    ss.dependency 'Masonry'#, '1.1.0'
    ss.dependency 'ReactiveObjC'#, '3.1.0'
    ss.dependency 'MBProgressHUD'#, '0.9.2'
    ss.dependency 'MJRefresh'#, '3.1.12'
    ss.dependency 'Protobuf'#, '3.6.1'
    ss.dependency 'MMKV'#, '1.0.23'
    ss.dependency 'lottie-ios', '2.5.3' # ObjC
    ss.dependency 'IGListKit'#, '3.4.0'
    ss.dependency 'FLAnimatedImage'#, '1.0.12'
    ss.dependency 'Aspects'#, '1.4.1'
    ss.dependency 'pop'#, '1.0.10'
    ss.dependency 'Godzippa'#, '1.1.0'
  end
  
  s.default_subspecs = []
end

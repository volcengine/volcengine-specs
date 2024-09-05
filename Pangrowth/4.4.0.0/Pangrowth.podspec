Pod::Spec.new do |s|
  s.name             = 'Pangrowth'
  s.version          = '4.4.0.0'
  s.summary          = 'Pangrowth is an SDK that integrates novels, media, and live broadcasts.'
  s.description      = <<-DESC
Pangrowth is an SDK that integrates novels, media, and live broadcasts.
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/Pangrowth.zip" }

  s.ios.deployment_target = '11.0'

  s.dependency 'RangersAPM/Core', '>= 3.10.6'
  s.dependency 'RangersAPM/Public', '>= 3.10.6'
  s.dependency 'RangersAPM/Crash', '>= 3.10.6'
  s.dependency 'RangersAPM/HMD', '>= 3.10.6'
  s.dependency 'RangersAPM/EventMonitor', '>= 3.10.6'
  s.dependency 'RangersAPM/CN', '>= 3.10.6'
  s.dependency 'RangersAppLog/Core', '>= 6.15.1'
  s.dependency 'RangersAppLog/Log', '>= 6.15.1'
  s.dependency 'RangersAppLog/Host/CN', '>= 6.15.1'
  
  # 流媒体，包含了TTVideoEngine
  s.subspec 'media' do |ss|
    ss.dependency 'PangrowthMedia', '5.4.0.0'
  end
  
  # 流媒体，TTVideoEngine动态库全架构大包
  s.subspec 'media-dynamic' do |ss|
    ss.dependency 'PangrowthMedia-lite', '5.4.2.0'
    ss.dependency 'PangrowthTTVideoEngine-dynamic', '1.0.0.0'
  end

  # 剔除点播
  s.subspec 'media-lite' do |ss|
    ss.dependency 'PangrowthMedia-lite', '5.4.2.0'
  end

  # 新点播
  s.subspec 'media-premium' do |ss|
    ss.dependency 'PangrowthMedia-premium', '5.4.4.0'
  end
  
  s.default_subspecs = []
end

Pod::Spec.new do |s|
  s.name             = 'Pangrowth'
  s.version          = '3.9.0.3'
  s.summary          = 'Pangrowth is an SDK that integrates novels, media, and live broadcasts.'
  s.description      = <<-DESC
Pangrowth is an SDK that integrates novels, media, and live broadcasts.
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/Pangrowth.zip" }

  s.ios.deployment_target = '9.0'

#  s.source_files = 'Pangrowth/Classes/**/*'
  
  # s.dependency 'Ads-CN','>= 3.7.0.8'

  s.dependency 'RangersAppLog/Core', '6.15.1'
  s.dependency 'RangersAppLog/Host/CN', '6.15.1'
  # s.dependency 'RangersAppLog/Log', '5.6.6'
  # s.dependency 'RangersAppLog/Picker', '5.6.6'
  # s.dependency 'RangersAppLog/UITracker', '5.6.6'

  s.dependency 'RangersAPM/Core', '3.3.1'
  s.dependency 'RangersAPM/Crash', '3.3.1'
  s.dependency 'RangersAPM/EventMonitor', '3.3.1'
  s.dependency 'RangersAPM/HMD', '3.3.1'
  s.dependency 'RangersAPM/Public', '3.3.1'
  s.dependency 'RangersAPM/CN', '3.3.1'
  
  # 流媒体，包含了TTVideoEngine
  s.subspec 'media' do |ss|
    ss.dependency 'PangrowthMedia', '4.9.0.3'
  end
  
  # 流媒体，TTVideoEngine动态库全架构大包
  s.subspec 'media-dynamic' do |ss|
    ss.dependency 'PangrowthMedia-dynamic', '4.9.2.3'
  end
  
  s.default_subspecs = []
end
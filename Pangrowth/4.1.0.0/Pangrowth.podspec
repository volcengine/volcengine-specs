Pod::Spec.new do |s|
  s.name             = 'Pangrowth'
  s.version          = '4.1.0.0'
  s.summary          = 'Pangrowth is an SDK that integrates novels, media, and live broadcasts.'
  s.description      = <<-DESC
Pangrowth is an SDK that integrates novels, media, and live broadcasts.
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/Pangrowth.zip" }

  s.ios.deployment_target = '10.0'

  s.dependency 'RangersAppLog/Core', '6.15.1'
  s.dependency 'RangersAppLog/Host/CN', '6.15.1'

  s.dependency 'RangersAPM/Core', '3.3.1'
  s.dependency 'RangersAPM/Crash', '3.3.1'
  s.dependency 'RangersAPM/EventMonitor', '3.3.1'
  s.dependency 'RangersAPM/HMD', '3.3.1'
  s.dependency 'RangersAPM/Public', '3.3.1'
  s.dependency 'RangersAPM/CN', '3.3.1'
  
  # 流媒体，包含了TTVideoEngine
  s.subspec 'media' do |ss|
    ss.dependency 'PangrowthMedia', '5.1.0.0'
  end
  
  # 流媒体，TTVideoEngine动态库全架构大包
  s.subspec 'media-dynamic' do |ss|
    ss.dependency 'PangrowthMedia-dynamic', '5.1.2.0'
  end

  s.subspec 'shortplay' do |ss|
    ss.dependency 'PangrowthDJX', '1.1.0.1'
  end

  s.subspec 'shortplay-dynamic' do |ss|
    ss.dependency 'PangrowthDJX-lite', '1.1.0.1'
    ss.dependency 'PangrowthTTVideoEngine-dynamic', '1.0.0.0'
  end

  s.subspec 'shortplay-lite' do |ss|
    ss.dependency 'PangrowthDJX-lite', '1.1.0.1'
  end
  
  s.default_subspecs = []
end

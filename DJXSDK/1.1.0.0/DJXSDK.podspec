Pod::Spec.new do |s|
  s.name             = 'DJXSDK'
  s.version          = '1.1.0.0'
  s.summary          = 'Pangrowth is an SDK that integrates novels, media, and live broadcasts.'
  s.description      = <<-DESC
Pangrowth is an SDK that integrates novels, media, and live broadcasts.
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-djx/DJXSDK.zip" }

  s.ios.deployment_target = '10.0'

  s.dependency 'RangersAppLog/Core', '6.15.1'
  s.dependency 'RangersAppLog/Host/CN', '6.15.1'

  s.dependency 'RangersAPM/Core', '3.3.1'
  s.dependency 'RangersAPM/Crash', '3.3.1'
  s.dependency 'RangersAPM/EventMonitor', '3.3.1'
  s.dependency 'RangersAPM/HMD', '3.3.1'
  s.dependency 'RangersAPM/Public', '3.3.1'
  s.dependency 'RangersAPM/CN', '3.3.1'
  
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

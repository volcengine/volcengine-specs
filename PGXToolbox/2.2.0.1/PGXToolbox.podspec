Pod::Spec.new do |s|
  s.name             = 'PGXToolbox'
  s.version          = '2.2.0.1'
  s.summary          = 'PGXToolbox is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PGXToolbox/LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-toolbox/#{s.version.to_s}/PGXToolbox-#{s.version.to_s}.zip" }
  
  s.ios.deployment_target = '12.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.dependency 'Ads-CN', '>= 5.8.0.9'
  s.dependency 'RangersAPM/Crash', '>= 3.10.6'
  s.dependency 'RangersAPM/EventMonitor', '>= 3.10.6'
  s.dependency 'RangersAPM/CN', '>= 3.10.6'
  s.dependency 'RangersAppLog/Log', '>= 6.16.3'
  s.dependency 'RangersAppLog/Host/CN', '>= 6.16.3'

  s.vendored_frameworks = ['PGXToolbox/PGXToolbox.framework']
  s.preserve_paths = 'PGXToolbox/*.*'
end

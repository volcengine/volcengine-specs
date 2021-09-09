Pod::Spec.new do |s|
  s.name             = 'PangrowthMedia-live'
  s.version          = '2.9.3.2'
  s.summary          = 'LCDSDK is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthMedia-live/LICENSE' }
  s.author           = { 'yuxuri' => 'yuxuri@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-media-live/#{s.version.to_s}/PangrowthMedia-live-#{s.version.to_s}.zip" }
  s.ios.deployment_target = '9.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox','WebKit','Security'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'
  
  s.ios.dependency 'RangersAPM/Core', '>= 2.0.5'
  s.ios.dependency 'RangersAPM/Public', '>= 2.0.5'
  s.ios.dependency 'RangersAPM/Crash', '>= 2.0.5'
  s.ios.dependency 'RangersAPM/HMD', '>= 2.0.5'
  s.ios.dependency 'RangersAPM/EventMonitor', '>= 2.0.5'
  s.ios.dependency 'RangersAppLog/Core', '~> 5.6'
  s.ios.dependency 'RangersAppLog/Log', '~> 5.6'
  s.ios.dependency 'RangersAppLog/Host/CN', '~> 5.6'

  s.preserve_paths = 'PangrowthMedia-live/*.framework', 'PangrowthMedia-live/*.bundle', 'LICENSE'
  s.vendored_frameworks = 'PangrowthMedia-live/LCDSDK.framework'
  s.resources = 'PangrowthMedia-live/LCDSDK.bundle'

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']
end
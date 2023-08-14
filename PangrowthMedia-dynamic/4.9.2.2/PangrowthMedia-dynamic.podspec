Pod::Spec.new do |s|
  s.name             = 'PangrowthMedia-dynamic'
  s.version          = '4.9.2.2'
  s.summary          = 'LCDSDK is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthMedia-dynamic/LICENSE' }
  s.author           = { 'yuxuri' => 'yuxuri@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-media-dynamic/#{s.version.to_s}/PangrowthMedia-dynamic-#{s.version.to_s}.zip" }
  s.ios.deployment_target = '9.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'

  s.ios.dependency 'RangersAPM/Core', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/Public', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/Crash', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/HMD', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/EventMonitor', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/CN', '>= 3.3.1'
  s.ios.dependency 'RangersAppLog/Core', '~> 6.15.1'
  s.ios.dependency 'RangersAppLog/Log', '~> 6.15.1'
  s.ios.dependency 'RangersAppLog/Host/CN', '~> 6.15.1'

  s.preserve_paths = 'PangrowthMedia-dynamic/*.framework', 'PangrowthMedia-dynamic/*.bundle', 'LICENSE'
  s.vendored_frameworks = ['PangrowthMedia-dynamic/LCDSDK.framework', 'PangrowthMedia-dynamic/TTVideoEngine.framework']
  s.resources = ['PangrowthMedia-dynamic/LCDSDK.bundle']

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']
end
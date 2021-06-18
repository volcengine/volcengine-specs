Pod::Spec.new do |s|
  s.name             = 'PangrowthMedia-dynamic-lite'
  s.version          = '2.7.1.1'
  s.summary          = 'LCDSDK is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthMedia-dynamic-lite/LICENSE' }
  s.author           = { 'yuxuri' => 'yuxuri@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => 'https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-media-dynamic-lite/2.7.1.1/PangrowthMedia-dynamic-lite-2.7.1.1.zip' }
  s.ios.deployment_target = '9.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'

  s.ios.dependency 'RangersAPM/WatchDog', '>= 2.0.5'
  s.ios.dependency 'RangersAPM/Crash', '>= 2.0.5'
  s.ios.dependency 'RangersAppLog/Core', '~> 5.6'
  s.ios.dependency 'RangersAppLog/Log', '~> 5.6'
  s.ios.dependency 'RangersAppLog/Host/CN', '~> 5.6'

  s.preserve_paths = 'PangrowthMedia-dynamic-lite/*.framework', 'PangrowthMedia-dynamic-lite/*.bundle', 'LICENSE'
  s.vendored_frameworks = ['PangrowthMedia-dynamic-lite/LCDSDK.framework', 'PangrowthMedia-dynamic-lite/TTVideoEngine.framework']
  s.resources = ['PangrowthMedia-dynamic-lite/LCDSDK.bundle']

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']
end

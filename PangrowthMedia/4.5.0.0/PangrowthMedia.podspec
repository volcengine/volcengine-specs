Pod::Spec.new do |s|
  s.name             = 'PangrowthMedia'
  s.version          = '4.5.0.0'
  s.summary          = 'LCDSDK is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthMedia/LICENSE' }
  s.author           = { 'yuxuri' => 'yuxuri@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-media-static/#{s.version.to_s}/PangrowthMedia-#{s.version.to_s}.zip" }
  s.ios.deployment_target = '9.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'
  
  s.ios.dependency 'RangersAPM/Core', '>= 2.13.1'
  s.ios.dependency 'RangersAPM/Public', '>= 2.13.1'
  s.ios.dependency 'RangersAPM/Crash', '>= 2.13.1'
  s.ios.dependency 'RangersAPM/HMD', '>= 2.13.1'
  s.ios.dependency 'RangersAPM/EventMonitor', '>= 2.13.1'
  s.ios.dependency 'RangersAPM/CN', '>= 2.13.1'
  s.ios.dependency 'RangersAppLog/Core', '~> 6.13.2'
  s.ios.dependency 'RangersAppLog/Log', '~> 6.13.2'
  s.ios.dependency 'RangersAppLog/Host/CN', '~> 6.13.2'

  s.vendored_frameworks = ['PangrowthMedia/LCDSDK.framework']
  s.resources = ['PangrowthMedia/LCDSDK.bundle', 'PangrowthMedia/ttplayer.metallib']
  s.preserve_paths = 'PangrowthMedia/*.framework', 'PangrowthMedia/*.bundle', 'PangrowthMedia/ttplayer.metallib'

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']
end

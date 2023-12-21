Pod::Spec.new do |s|
  s.name             = 'PangrowthDJX'
  s.version          = '1.1.0.1'
  s.summary          = 'LCDSDK is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthDJX/LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-djx/#{s.version.to_s}/PangrowthDJX-#{s.version.to_s}.zip" }
  s.ios.deployment_target = '10.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'
  
  s.ios.dependency 'RangersAPM/Core', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/Public', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/Crash', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/HMD', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/EventMonitor', '>= 3.3.1'
  s.ios.dependency 'RangersAPM/CN', '>= 3.3.1'
  s.ios.dependency 'RangersAppLog/Core', '>= 6.15.1'
  s.ios.dependency 'RangersAppLog/Log', '>= 6.15.1'
  s.ios.dependency 'RangersAppLog/Host/CN', '>= 6.15.1'

  s.vendored_frameworks = ['PangrowthDJX/PangrowthDJX.framework']
  s.resources = ['PangrowthDJX/DJXSDK.bundle', 'PangrowthDJX/ttplayer.metallib']
  s.preserve_paths = 'PangrowthDJX/*.framework', 'PangrowthDJX/*.bundle', 'PangrowthDJX/ttplayer.metallib'

  valid_archs = ['armv7', 'i386', 'x86_64', 'arm64']
end

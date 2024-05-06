Pod::Spec.new do |s|
  s.name             = 'PangrowthDJX'
  s.version          = '1.1.5.2'
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
  
  s.dependency 'RangersAPM/Core', '~> 3.8.4'
  s.dependency 'RangersAPM/Public', '~> 3.8.4'
  s.dependency 'RangersAPM/Crash', '~> 3.8.4'
  s.dependency 'RangersAPM/HMD', '~> 3.8.4'
  s.dependency 'RangersAPM/EventMonitor', '~> 3.8.4'
  s.dependency 'RangersAPM/CN', '~> 3.8.4'
  s.dependency 'RangersAppLog/Core', '>= 6.16.3'
  s.dependency 'RangersAppLog/Log', '>= 6.16.3'
  s.dependency 'RangersAppLog/Host/CN', '>= 6.16.3'

  s.vendored_frameworks = ['PangrowthDJX/PangrowthDJX.framework']
  s.resources = ['PangrowthDJX/DJXSDK.bundle', 'PangrowthDJX/ttplayer.metallib']
  s.preserve_paths = 'PangrowthDJX/*.framework', 'PangrowthDJX/*.bundle', 'PangrowthDJX/ttplayer.metallib'
end

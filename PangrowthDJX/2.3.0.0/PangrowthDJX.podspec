Pod::Spec.new do |s|
  s.name             = 'PangrowthDJX'
  s.version          = '2.3.0.0'
  s.summary          = 'PangrowthDJX is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthDJX/LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-djx/#{s.version.to_s}/PangrowthDJX-#{s.version.to_s}.zip" }
  
  s.ios.deployment_target = '12.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'

  s.dependency 'PGXToolbox', '2.3.0.0'

  s.vendored_frameworks = ['PangrowthDJX/PangrowthDJX.framework']
  s.resources = ['PangrowthDJX/DJXSDK.bundle']
  s.preserve_paths = 'PangrowthDJX/*.*'
end

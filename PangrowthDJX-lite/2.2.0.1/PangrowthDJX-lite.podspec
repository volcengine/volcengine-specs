Pod::Spec.new do |s|
  s.name             = 'PangrowthDJX-lite'
  s.version          = '2.2.0.1'
  s.summary          = 'PangrowthDJX is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthDJX-lite/LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-djx/#{s.version.to_s}/PangrowthDJX-lite-#{s.version.to_s}.zip" }
  
  s.ios.deployment_target = '12.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'
  
  s.dependency 'PGXToolbox', '2.2.0.1'

  s.vendored_frameworks = ['PangrowthDJX-lite/PangrowthDJX.framework']
  s.resources = ['PangrowthDJX-lite/DJXSDK.bundle']
  s.preserve_paths = 'PangrowthDJX-lite/*.*'
end

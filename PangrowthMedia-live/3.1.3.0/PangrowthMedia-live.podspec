Pod::Spec.new do |s|
  s.name             = 'PangrowthMedia-live'
  s.version          = '3.1.3.0'
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
  s.module_name = 'LCDSDK'
  s.header_dir = 'LCDSDK'

  s.frameworks = 'MetalKit', 'CoreMotion', 'SystemConfiguration', 'OpenAL', 'VideoToolbox','WebKit','Security'
  s.libraries = 'c++', 'z', 'iconv', 'xml2', 'bz2', 'c++abi'
  
  s.ios.dependency 'RangersAPM/Core', '>= 2.4.1'
  s.ios.dependency 'RangersAPM/Public', '>= 2.4.1'
  s.ios.dependency 'RangersAPM/Crash', '>= 2.4.1'
  s.ios.dependency 'RangersAPM/HMD', '>= 2.4.1'
  s.ios.dependency 'RangersAPM/EventMonitor', '>= 2.4.1'
  s.ios.dependency 'RangersAPM/CN', '>= 2.4.1'

  s.ios.dependency 'RangersAppLog/Core', '~> 6.3'
  s.ios.dependency 'RangersAppLog/Host/CN', '~> 6.3'

  s.source_files = 'PangrowthMedia-live/include/*'
  s.public_header_files = 'PangrowthMedia-live/include/*.h'
  s.preserve_paths = 'PangrowthMedia-live/*.framework', 'PangrowthMedia-live/*.bundle', 'LICENSE', 'PangrowthMedia-live/**/*'
  s.vendored_libraries = 'PangrowthMedia-live/ios-arch-iphone/*.a'
  s.resources = 'PangrowthMedia-live/LCDSDK.bundle'

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']
end
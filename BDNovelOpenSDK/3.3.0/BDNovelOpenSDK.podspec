Pod::Spec.new do |s|
  s.name = 'BDNovelOpenSDK'
  s.version = '3.3.0'

  s.ios.deployment_target = '10.0'

  s.license = 'MIT'
  s.summary = 'BDNovelOpenSDK'
  s.homepage = 'https://www.pangle.cn/'
  s.author = { 'liuyunxuan' => 'liuyunxuan@bytedance.com' }
  s.source = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/BDNovelOpenSDK/#{s.version.to_s}/BDNovelOpenSDK-#{s.version.to_s}.zip" }
  s.description = 'This library provides ability for App enable Novel Business'

  s.platform     = :ios, "9.0"  
  s.frameworks = 'UIKit', 'WebKit', 'SystemConfiguration'

  s.preserve_paths = "BDNovelOpenSDK/include/*","BDNovelOpenSDK/include/**/*","BDNovelOpenSDK/other/*","BDNovelOpenSDK/other/**/*","BDNovelOpenSDK/novel/*"
  s.ios.vendored_libraries = "BDNovelOpenSDK/other/*.a", "BDNovelOpenSDK/other/**/*.a", "BDNovelOpenSDK/novel/*.a", "BDNovelOpenSDK/novel/sdk/*.a"
  s.source_files = "BDNovelOpenSDK/include/*.h"
  s.public_header_files = "BDNovelOpenSDK/include/*.h"
  s.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'c++abi'
  s.resource = 'BDNovelOpenSDK/novel/bundle/BDNovelResource.bundle'

  # s.dependency 'Ads-CN/BUAdSDK', '>=3.7.0.8'
  # s.dependency 'Ads-CN/Domestic' ,'>=3.7.0.8'
  # s.dependency 'Ads-CN/BUFoundation', '>=3.7.0.8'

  s.dependency 'RangersAppLog/Host/CN', '~>5.6.3'
  s.dependency 'RangersAppLog/Core','~>5.6.3'
  s.dependency 'RangersAppLog/UITracker' ,'~>5.6.3'
  s.dependency 'RangersAppLog/Log', '~>5.6.3'
  s.dependency 'RangersAppLog/Picker', '~>5.6.3'

  s.dependency 'RangersAPM/Crash', '~>2.0.0'
  s.dependency 'RangersAPM/HMD', '~>2.0.0'
  s.dependency 'RangersAPM/Core', '~>2.0.0'
  s.dependency 'RangersAPM/Public', '~>2.0.0'

  s.dependency 'OneKit/ByteDanceKit'

  #内网源没有RangersAPM，内网源是HeimdallrFinder
  # s.dependency 'HeimdallrFinder/Crash', '1.5.0.1-bugfix'
  # s.dependency 'HeimdallrFinder/HMD', '1.5.0.1-bugfix'
  # s.dependency 'HeimdallrFinder/Core', '1.5.0.1-bugfix'
  # s.dependency 'HeimdallrFinder/Public', '1.5.0.1-bugfix'

  s.dependency 'FMDB/standard'
  s.dependency 'YYCache'
  s.dependency 'YYText'
  s.dependency 'MMKV'

  s.xcconfig = {
    'USE_HEADERMAP' => 'NO',
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/BDNovelOpenSDK/include"',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO'
  }

  # valid_archs = ['armv7', 'i386', 'x86_64', 'arm64']
  # s.pod_target_xcconfig = {
  #   'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  # }
  # s.user_target_xcconfig = {
  #   'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  #   'ENABLE_BITCODE' => 'NO'
  # }

  s.user_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO' #真机调试需要NO
  }

end

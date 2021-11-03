Pod::Spec.new do |s|
  s.name = "DVETrackKit"
  s.version = "0.2.3"
  s.summary = "DVETrackKit"
  s.license = "MIT"
  s.authors = {"zhangyuanming"=>"zhangyuanming@bytedance.com"}
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "make better video editing and development experience"
  s.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "VideoToolbox", "CoreMedia", "MetalPerformanceShaders", "MobileCoreServices", "CoreML", "Accelerate"]
  s.requires_arc = true
  s.static_framework = true
  s.libraries = ["xml2", "z", "c++"]
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_libraries  = ['*.a']
  s.ios.public_header_files = ['Headers/*.{h}']
  s.ios.source_files = ['Headers/*.{h}']
  s.ios.module_map = "Modules/module.modulemap"
  s.ios.resource = ['Resources/*.bundle']
  s.dependency 'TTVideoEditor', '>=9.x'
  s.dependency 'NLEPlatform'
  s.dependency 'ReactiveObjC'
  s.dependency 'YYWebImage'
  s.dependency 'Masonry'
  s.dependency 'PocketSVG'
  s.dependency 'YYCache'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64", 'ENABLE_BITCODE' => 'NO' }
end

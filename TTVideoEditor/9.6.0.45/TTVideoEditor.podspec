Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "9.6.0.45"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"zhouyi.ysj"=>"zhouyi.ysj@bytedance.com"}
  s.homepage = "https://github.com/volcengine"
  s.description = "ttvideoeditor"
  s.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "VideoToolbox", "CoreMedia", "MobileCoreServices", "Accelerate"]
  s.weak_frameworks = ["Metal", "MetalPerformanceShaders", "Photos", "CoreML"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/9.6.0.45/TTVideoEditor.zip"}

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_libraries  = ['ios/*.a']
  s.ios.public_header_files = ['ios/Headers/*.{h}']
  s.ios.source_files = ['ios/Headers/*.{h}',"ios/Modules/module.modulemap"]
  s.ios.resource = ['ios/Resources/*.bundle']
  s.ios.module_map   = "ios/Modules/module.modulemap"
  s.dependency "KVOController"
s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64" }
end
 # shell_commit=37b239c675964a39f056397a18227219215b848a
 

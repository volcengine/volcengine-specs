Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "9.6.0.19-D"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"zhouyi.ysj"=>"zhouyi.ysj@bytedance.com"}
  s.homepage = "https://github.com/volcengine"
  s.description = "ttvideoeditor"
  s.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "VideoToolbox", "CoreMedia", "MobileCoreServices", "Accelerate"]
  s.weak_frameworks = ["Metal", "MetalPerformanceShaders", "Photos", "CoreML"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/9.6.0.19-D/TTVideoEditor.zip"}

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/TTVideoEditor.framework'
s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64" }
end
 # shell_commit=06c72b8c6c4ce1a9793a4d1d771475c335479acf
 

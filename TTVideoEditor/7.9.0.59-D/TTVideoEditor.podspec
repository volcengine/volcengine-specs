Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "7.9.0.59-D"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"zhouyi.ysj"=>"zhouyi.ysj@bytedance.com"}
  s.homepage = "https://github.com/volcengine"
  s.description = "ttvideoeditor"
  s.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "VideoToolbox", "CoreMedia", "MetalPerformanceShaders", "MobileCoreServices", "Accelerate"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/7.9.0.59-D/TTVideoEditor.zip"}

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/TTVideoEditor.framework'
s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64" }
end
 # shell_commit=ee4eeebe0252c7caae83c962ea81b987b39ac3be
 

Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "15.1.1.27-EO140-D"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"bytedance.ysj"=>"bytedance.ysj@bytedance.com"}
  s.homepage = "https://github.com/volcengine"
  s.description = "ttvideoeditor"
  s.ios.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "Accelerate", "VideoToolbox", "CoreMedia", "MobileCoreServices", "CoreGraphics", "CoreVideo", "CoreImage", "ImageIO", "QuartzCore"]
  s.weak_frameworks = ["Metal", "MetalPerformanceShaders", "Photos", "CoreML", "MetalKit"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/15.1.1.27-EO120-D/TTVideoEditor.zip"}
  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/TTVideoEditor.framework'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "arm64" }
end
 #dsym:https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/dsym/15.1.1.27-EO120-D/TTVideoEditor-15.1.1.27-EO120-D-dsym.zip
 

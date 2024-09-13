Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "15.1.2.1-EO160"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"bytedance.ysj"=>"bytedance.ysj@bytedance.com"}
  s.homepage = "https://github.com/volcengine"
  s.description = "ttvideoeditor"
  s.ios.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "Accelerate", "VideoToolbox", "CoreMedia", "MobileCoreServices", "CoreGraphics", "CoreVideo", "CoreImage", "ImageIO", "QuartzCore"]
  s.weak_frameworks = ["Metal", "MetalPerformanceShaders", "Photos", "CoreML", "MetalKit"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/#{s.version}/TTVideoEditor.zip"}

  s.ios.deployment_target = '9.0'
  s.ios.vendored_libraries = ['ios/*.a']
  s.ios.public_header_files = ['ios/Headers/**/*.*']
  s.ios.source_files = ['ios/Headers/*.*',"ios/Modules/module.modulemap"]
  s.ios.resource = ['ios/Resources/*.bundle']
  s.ios.module_map = "ios/Modules/module.modulemap"
  #s.dependency "KVOController"
  #s.dependency "SSZipArchive"
  s.pod_target_xcconfig = { "VALID_ARCHS" => "arm64 x86_64" }
end
 

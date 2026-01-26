Pod::Spec.new do |s|
  s.name = "NLEPlatform"
  s.version = "1.2.0.10-likee"
  s.summary = "NLEPlatform"
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.authors = {"zhangyuanming"=>"zhangyuanming@bytedance.com"}
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "make better video editing and development experience"
  s.ios.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "Accelerate", "VideoToolbox", "CoreMedia", "MobileCoreServices", "CoreGraphics", "CoreVideo", "CoreImage", "ImageIO", "QuartzCore"]
  s.requires_arc = true
  s.libraries = ["xml2", "iconv"]
  s.static_framework = true
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/1.2.0.10-likee/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_libraries  = ['ios/*.a']
  s.ios.public_header_files = ['ios/Headers/*.{h}']
  s.ios.source_files = ['ios/Headers/*.{h}']
  s.ios.preserve_paths = ['ios/Headers/*.{h}']
  s.ios.module_map = "ios/Modules/module.modulemap"
  s.dependency 'TTVideoEditor', '>=9.x'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64" }
end

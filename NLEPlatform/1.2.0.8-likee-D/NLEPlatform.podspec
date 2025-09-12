Pod::Spec.new do |s|
  s.name = "NLEPlatform"
  s.version = "1.2.0.8-likee-D"
  s.summary = "NLEPlatform"
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.authors = {""=>"@bytedance.com"}
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "make better video editing and development experience"
  s.ios.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "Accelerate", "VideoToolbox", "CoreMedia", "MobileCoreServices", "CoreGraphics", "CoreVideo", "CoreImage", "ImageIO", "QuartzCore"]
    s.weak_frameworks = ["Metal", "MetalPerformanceShaders", "Photos", "CoreML", "MetalKit"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/NLEPlatform.framework'
  s.dependency 'TTVideoEditor', '>=9.x'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "arm64,x86_64" }
end
  #dsym:https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/NLEPlatform/dsym/#{s.version}/NLEPlatform-${s.version}-dsym.zip

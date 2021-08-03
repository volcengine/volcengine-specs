Pod::Spec.new do |s|
  s.name = "Meepo"
  s.version = "0.0.9-d"
  s.summary = "Meepo"
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.authors = {"zhangyuanming"=>"zhangyuanming@bytedance.com"}
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "make better video editing and development experience"
  s.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "VideoToolbox", "CoreMedia", "MetalPerformanceShaders", "MobileCoreServices", "CoreML", "Accelerate"]
  s.requires_arc = true
  s.libraries = ["xml2", "z", "c++"]
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'Meepo.framework'
  s.ios.resource = ['Resources/*.bundle']
  s.dependency 'TTVideoEditor', '>=9.x'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64", 'ENABLE_BITCODE' => 'NO' }
end

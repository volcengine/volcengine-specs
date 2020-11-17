Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "7.5.0-mac"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"zhouyi.ysj"=>"zhouyi.ysj@bytedance.com"}
  s.homepage = "https://code.byted.org/ugc-android/ttvideoeditor/"
  s.description = "ttvideoeditor"
  s.frameworks = ["AVFoundation", "Foundation", "UIKit", "CoreTelephony", "AudioToolbox", "CoreMotion", "MediaToolbox", "GLKit", "OpenGLES", "VideoToolbox", "CoreMedia"]
  s.libraries = ["xml2", "iconv"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/7.1.0.1/TTVideoEditor.zip"}

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/TTVideoEditor.embeddedframework/TTVideoEditor.framework'
end

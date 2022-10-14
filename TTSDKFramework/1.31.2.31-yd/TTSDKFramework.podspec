Pod::Spec.new do |spec|
  spec.name         = "TTSDKFramework"
  spec.version      = "1.31.2.31-yd"
  spec.summary      = "A comprehensive multimedia SDK"
  spec.description  = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                  DESC

  spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"

  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform     = :ios, "8.0"

  spec.source       = { :http => "https://sf1-hscdn-tos.pstatp.com/obj/cloud-common/ttsdk/iOS/TTSDKFramework-#{spec.version}-ta.zip", :type => :zip }

  spec.static_framework = false
  spec.resources = ['TTSDKFramework.framework/ttplayer.metallib', 'TTSDKFramework.framework/processor.metallib', 'TTSDKFramework.framework/videovrsr.bundle']
  spec.vendored_frameworks = [
    "TTSDKFramework.framework",
    "TTFFmpeg.framework",
    "boringssl.framework",
    "crypto.framework",
    "ffmpeg_dashdec.framework"
  ]
  spec.frameworks = 'CoreGraphics', 'CoreTelephony', 'VideoToolbox', 'AudioToolbox', 'CoreMedia', 'MetalKit', 'MetalPerformanceShadersGraph', 'MetalPerformanceShaders', 'CoreFoundation', 'CoreVideo', 'IOSurface', 'QuartzCore', 'CoreImage', 'OpenGLES'
end

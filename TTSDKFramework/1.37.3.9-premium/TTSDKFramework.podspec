Pod::Spec.new do |spec|
  spec.name = "TTSDKFramework"
  spec.version = "1.37.3.9-premium"
  spec.summary = "A comprehensive multimedia SDK"
  spec.description = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD, webimage, uploader, and the other related abilities.
                  DESC

  spec.homepage = "https://github.com/volcengine/TTSDK-iOS"

  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.author = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform = :ios, "8.0"

  spec.source = { :http => "https://sf1-hscdn-tos.pstatp.com/obj/cloud-common/ttsdk/iOS/TTSDKFramework-#{spec.version}-ta.zip", :type => :zip }

  spec.default_subspecs = "Base"

  spec.static_framework = false

  spec.subspec "Base" do |subspec|
    subspec.vendored_frameworks = [
      "boringssl.framework",
      "crypto.framework",
    ]
  end

  spec.subspec "AppLog" do |subspec|
    unless $DoNotInstallApplogVersion == "6.15.1"
      subspec.dependency 'RangersAppLog/Core', '~> 6.15.1'
      subspec.dependency 'RangersAppLog/Host/CN', '~> 6.15.1'
    end
    subspec.source_files = ''
  end

  spec.subspec "Video" do |subspec|
    subspec.resources = [
      "TTSDKFramework.framework/ttplayer.metallib",
      "TTSDKFramework.framework/processor.metallib",
      "TTSDKFramework.framework/videovrsr.bundle",
      "TTSDKFramework.xcframework/ttplayer.metallib",
      "TTSDKFramework.xcframework/processor.metallib",
      "TTSDKFramework.xcframework/videovrsr.bundle",
    ]
    subspec.vendored_frameworks = [
      "TTSDKFramework.framework",
      "TTSDKFramework.xcframework",
      "byteaudio.framework",
      "byteaudio.xcframework",
      "VolcEngineRTC.framework",
      "VolcEngineRTC.xcframework",
      "BytePlusRTC.framework",
      "BytePlusRTC.xcframework",
      "TTFFmpeg.framework",
      "libvcn.framework",
      "ffmpeg_dashdec.framework",
      'VolcBaseLog.framework',
    ]
    subspec.dependency "TTSDKFramework/Base"
    subspec.dependency "TTSDKFramework/AppLog"
    subspec.dependency "SSZipArchive", "~> 2.2"
    subspec.weak_frameworks = 'CoreGraphics', 'CoreTelephony', 'VideoToolbox', 'AudioToolbox', 'CoreMedia', 'Metal', 'MetalKit', 'MetalPerformanceShaders', 'CoreFoundation', 'CoreVideo', 'IOSurface', 'QuartzCore', 'CoreImage', 'OpenGLES', 'MetricKit', 'Photos', 'UniformTypeIdentifiers'
  end

  spec.subspec "Push" do |subspec|
    subspec.vendored_frameworks = [
      "TTSDKPushFramework.framework",
      "TTSDKPushFramework.xcframework",
      "byteaudio.framework",
      "byteaudio.xcframework",
      "TTFFmpeg.framework",
      'VolcBaseLog.framework',
    ]
    subspec.dependency "TTSDKFramework/AppLog"
  end

  spec.subspec "RtmPush" do |subspec|
    subspec.vendored_frameworks = [
      "TTSDKRTMPushFramework.framework",
      "TTSDKRTMPushFramework.xcframework",
      "byteaudio.framework",
      "byteaudio.xcframework",
      "VolcEngineRTC.framework",
      "VolcEngineRTC.xcframework",
      "TTFFmpeg.framework",
      "ffmpeg_dashdec.framework",
      "BytePlusRTC.framework",
      "BytePlusRTC.xcframework",
      'VolcBaseLog.framework',
    ]
    subspec.dependency "TTSDKFramework/AppLog"
  end

  spec.subspec "BasePull" do |subspec|
    subspec.resources = [
      "TTSDKBasePullFramework.framework/ttplayer.metallib",
      "TTSDKBasePullFramework.framework/processor.metallib",
      "TTSDKBasePullFramework.framework/videovrsr.bundle",
      "TTSDKBasePullFramework.xcframework/ttplayer.metallib",
      "TTSDKBasePullFramework.xcframework/processor.metallib",
      "TTSDKBasePullFramework.xcframework/videovrsr.bundle",
    ]
    subspec.vendored_frameworks = [
      "TTSDKBasePullFramework.xcframework",
      "TTSDKBasePullFramework.framework",
      "TTFFmpeg.framework",
      "ffmpeg_dashdec.framework",
      'VolcBaseLog.framework',
    ]
    subspec.dependency "TTSDKFramework/Base"
    subspec.dependency "TTSDKFramework/AppLog"
    subspec.weak_frameworks = 'CoreGraphics', 'CoreTelephony', 'VideoToolbox', 'AudioToolbox', 'CoreMedia', 'Metal', 'MetalKit', 'MetalPerformanceShaders', 'CoreFoundation', 'CoreVideo', 'IOSurface', 'QuartzCore', 'CoreImage', 'OpenGLES'
  end

  spec.subspec "Pull" do |subspec|
    subspec.resources = [
      "TTSDKPullFramework.framework/ttplayer.metallib",
      "TTSDKPullFramework.framework/processor.metallib",
      "TTSDKPullFramework.framework/videovrsr.bundle",
      "TTSDKPullFramework.xcframework/ttplayer.metallib",
      "TTSDKPullFramework.xcframework/processor.metallib",
      "TTSDKPullFramework.xcframework/videovrsr.bundle",
    ]
    subspec.vendored_frameworks = [
      "TTSDKPullFramework.xcframework",
      "TTSDKPullFramework.framework",
      "TTFFmpeg.framework",
      "ffmpeg_dashdec.framework",
      "libvcn.framework",
      'VolcBaseLog.framework',
    ]
    subspec.dependency "TTSDKFramework/Base"
    subspec.dependency "TTSDKFramework/AppLog"
    subspec.weak_frameworks = 'CoreGraphics', 'CoreTelephony', 'VideoToolbox', 'AudioToolbox', 'CoreMedia', 'Metal', 'MetalKit', 'MetalPerformanceShaders', 'CoreFoundation', 'CoreVideo', 'IOSurface', 'QuartzCore', 'CoreImage', 'OpenGLES'
  end

  spec.subspec "RtmPull" do |subspec|
    subspec.resources = [
      "TTSDKRTMPullFramework.framework/ttplayer.metallib",
      "TTSDKRTMPullFramework.framework/processor.metallib",
      "TTSDKRTMPullFramework.framework/videovrsr.bundle",
      "TTSDKRTMPullFramework.xcframework/ttplayer.metallib",
      "TTSDKRTMPullFramework.xcframework/processor.metallib",
      "TTSDKRTMPullFramework.xcframework/videovrsr.bundle",
    ]
    subspec.vendored_frameworks = [
      "TTSDKRTMPullFramework.xcframework",
      "TTSDKRTMPullFramework.framework",
      "TTFFmpeg.framework",
      "ffmpeg_dashdec.framework",
      "byteaudio.framework",
      "byteaudio.xcframework",
      "VolcEngineRTC.framework",
      "VolcEngineRTC.xcframework",
      "BytePlusRTC.framework",
      "BytePlusRTC.xcframework",
      "libvcn.framework",
      'VolcBaseLog.framework',
    ]
    subspec.dependency "TTSDKFramework/Base"
    subspec.dependency "TTSDKFramework/AppLog"
    subspec.weak_frameworks = 'CoreGraphics', 'CoreTelephony', 'VideoToolbox', 'AudioToolbox', 'CoreMedia', 'Metal', 'MetalKit', 'MetalPerformanceShaders', 'CoreFoundation', 'CoreVideo', 'IOSurface', 'QuartzCore', 'CoreImage', 'OpenGLES'
  end

  spec.subspec "Image" do |subspec|
    subspec.vendored_frameworks = [
      "TTSDKImageFramework.framework",
      "TTSDKImageFramework.xcframework",
    ]
    subspec.dependency "TTSDKFramework/Base"
    subspec.dependency "TTSDKFramework/AppLog"
  end
end

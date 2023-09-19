Pod::Spec.new do |spec|
  spec.name = "TTSDKFramework"
  spec.version = "1.32.2.10-nolive"
  spec.summary = "A comprehensive multimedia SDK"
  spec.description = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD, webimage, uploader, and the other related abilities.
                  DESC

  spec.homepage = "https://github.com/volcengine/TTSDK-iOS"

  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.author = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform = :ios, "8.0"

spec.source = { :http => "https://lf6-vcloud-tos.pstatp.com/obj/cloud-common/ttsdk/iOS/TTSDKFramework-#{spec.version}-ta.zip", :type => :zip }

  spec.default_subspecs = "Base", "Video"

  spec.static_framework = false

  spec.subspec "Base" do |subspec|
    subspec.vendored_frameworks = [
      "boringssl.framework",
      "crypto.framework",
    ]
  end

  spec.subspec "Video" do |subspec|
    subspec.resources = [
      "TTSDKFramework.framework/ttplayer.metallib",
      "TTSDKFramework.framework/processor.metallib",
      "TTSDKFramework.framework/videovrsr.bundle",
    ]
    subspec.vendored_frameworks = [
      "TTSDKFramework.framework",
      "TTFFmpeg.framework",
      "libvcn.framework",
      "ffmpeg_dashdec.framework",
    ]
    subspec.dependency "TTSDKFramework/Base"
  end

  spec.subspec "Image" do |subspec|
    subspec.vendored_frameworks = [
      "TTSDKImageFramework.framework",
    ]
    subspec.dependency "TTSDKFramework/Base"
  end
end

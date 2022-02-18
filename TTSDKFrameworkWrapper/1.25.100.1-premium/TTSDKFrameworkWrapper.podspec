Pod::Spec.new do |spec|
  spec.name         = "TTSDKFrameworkWrapper"
  spec.version      = "1.25.100.1-premium"
  spec.summary      = "A comprehensive multimedia SDK."
  spec.description  = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                  DESC

  spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"

  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform     = :ios, "8.0"

  spec.source       = { :https => "https://console.byteplus.com/vod/download?tosKey=ttsdk/iOS/TTSDKFramework-#{spec.version}-ta.zip" }

  spec.static_framework = false
  spec.vendored_frameworks = [
    "TTSDKFramework.framework",
    "byteaudio.framework"
  ]
end
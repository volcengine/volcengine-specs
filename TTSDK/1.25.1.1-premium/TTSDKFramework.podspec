Pod::Spec.new do |spec|
  spec.name         = "TTSDKFramework"
  spec.version      = "1.25.1.1-premium"
  spec.summary      = "A comprehensive multimedia SDK."
  spec.description  = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                  DESC

  spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"

  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform     = :ios, "8.0"

  spec.source       = { :http => "http://sf1-hscdn-tos.pstatp.com/obj/cloud-common/ttsdk/iOS/TTSDKFramework-#{spec.version}-ta.zip" }

  spec.static_framework = false
  spec.vendored_frameworks = [
    "TTSDKFramework-#{spec.version}-ta/TTSDKFramework.framework",
    "TTSDKFramework-#{spec.version}-ta/byteaudio.framework"
  ]
end
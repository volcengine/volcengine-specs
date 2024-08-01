#
#  Be sure to run `pod spec lint DouyinSDKTemplate.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "DouyinSDKTemplate"
  spec.version      = "3.4.5.3"
  spec.summary      = "A short description of DouyinSDKTemplate."
  spec.description  = <<-DESC
  A long description of DouyinSDKTemplate.
                   DESC

spec.homepage     = "https://developer.open-douyin.com/"

spec.license      = { :type => "Copyright", :text => "Bytedance copyright" }

spec.authors             = { "huangchengfeng" => "huangchengfeng.001@bytedance.com" }

spec.platform     = :ios

#  When using multiple platforms
spec.ios.deployment_target = "9.0"

spec.source       = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/DouyinSDKTemplate/1.0.0/DouyinSDKTemplate.zip" }

spec.pod_target_xcconfig = {
  "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "$(inherited) arm64 i386"
}

spec.default_subspecs = "ToB"
spec.static_framework = true

# 接入层
spec.subspec "ToB" do |tob|
    # ToB 公用依赖
    # 此处的依赖实际是需要增加版本号的
    tob.dependency "DouyinSDK/Init", '3.4.5.2'
    tob.dependency "DouyinSDK/Services/Security", '3.4.5.2'
    tob.dependency "DouyinSDK/Services/APM", '3.4.5.2'
    tob.dependency "DouyinSDK/Services/AppLog", '3.4.5.2'
    tob.dependency "DouyinSDK/Services/SDKSetting", '3.4.5.2'
    tob.dependency "DouyinSDK/Services/Auth", '3.4.5.2'

    # lottie 库不能到 3.x
    tob.dependency 'lottie-ios', '2.5.3'
    tob.dependency 'IGListKit', '3.4.0'
    tob.dependency 'MMKV', '>= 1.0.19'
    tob.dependency 'Masonry', '>= 1.1.0'
    tob.dependency 'MJRefresh', '>= 3.1.7'
    tob.dependency 'YYText', '>= 1.0'

    # 其他二方库
    tob.dependency 'DouyinOpenSDK', '>= 4.1.4'

    # ToB 小视频
    tob.subspec "Media" do |media|
        media.dependency 'MetaAD', '1.0.0.6'
        media.dependency "AwemeOpenSDK/TemplateToB", '= 3.4.5.2-fangzhou'
        # TTSDKFramework 接入方式适配
        unless $DouyinSDKUseTTSDKFramework == true
          media.dependency "TTSDK/Player"
          media.dependency "TTSDK/Image"
        else
          media.dependency "TTSDKFramework/Video"
          media.dependency "TTSDKFramework/Image"
        end
    end


end

end

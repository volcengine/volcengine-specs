#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    
    s.name         = "TTVideoEditor"
    #修改版本号，两个都要修改
    s.version      = "7.6.0"

    if ENV['TTVIDEOEDITOR_DEBUG_FLAG'] == '1'
        s.pod_target_xcconfig = {
                                'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'NO',
                                'CLANG_WARN_DOCUMENTATION_COMMENTS' => 'NO',
                                'GCC_PREPROCESSOR_DEFINITIONS' => 'EditorVersion=\"760\" __IOS__=1 ENABLE_EFFECT_SDK=1 '
                                }
    else
        s.pod_target_xcconfig = {
                                'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'NO',
                                'CLANG_WARN_DOCUMENTATION_COMMENTS' => 'NO',
                                'GCC_PREPROCESSOR_DEFINITIONS' => 'EditorVersion=\"760\" NDEBUG=1 __IOS__=1 ENABLE_EFFECT_SDK=1'
                                }
    end

    s.summary      = "TTVideoEditor"
    s.description  = <<-DESC
    ttvideoeditor
    DESC
    s.author       = { "zhouyi.ysj" => "zhouyi.ysj@bytedance.com" }
    s.license      = "MIT"
    s.homepage     = "https://github.com/volcengine/TTSDK-iOS"
    s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/ttvideoeditor/0.0.0.1/libTTVideoEditor.zip" }
#    s.source       = { :git => "git@code.byted.org:ugc-android/ttvideoeditor.git", :tag => s.version.to_s }
    s.platform     = :ios, '8.0'
    s.requires_arc = true
    s.frameworks   = 'AVFoundation', 'Foundation', 'UIKit', 'CoreTelephony', 'AudioToolbox', 'CoreMotion', 'MediaToolbox', 'GLKit', 'OpenGLES'
    s.library = 'xml2', 'iconv'
    s.vendored_library = 'libTTVideoEditor.a'
#    s.default_subspec = 'Core'
    s.source_files = 'IESMMBodydanceFilter.h'

    
    
end

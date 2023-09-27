  Pod::Spec.new do |spec|

    spec.name         = "TTSDK"
    spec.version      = "1.39.2.11-premium"
    spec.summary      = "A comprehensive multimedia SDK."
    spec.description  = <<-DESC
      A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                    DESC

    spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"

    spec.license      = { :type => 'MIT', :file => 'LICENSE' }

    spec.author       = { "chenzhaojie" => "chenzhaojie@bytedance.com" }
    spec.platform     = :ios, "11.0"

    spec.source       = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTSDK/#{spec.version}/TTSDK.zip" }
    
    spec.default_subspecs = 'Core', 'Effect', 'TTFFmpeg', 'PlayerCore', 'LivePull', 'LivePush', 'Player', 'Image'

    spec.static_framework = true
    
    spec.subspec 'Core' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/TTSDKManager.h',
      ]
      subspec.source_files = [
        'TTSDK/VCloudPandora/**/TTSDKManager.h',
        'TTSDK/TTSDK_Dummy/TTSDK_Module_Dummy.m',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Core_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_CN_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_SG_ios.a',
      ]

      unless $DoNotInstallApplogVersion == "6.15.1"
        subspec.dependency 'RangersAppLog/Core', '~> 6.15.1'
        subspec.dependency 'RangersAppLog/Host/CN', '~> 6.15.1'
      end
      
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'VolcLog' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/VolcBaseLog/*.framework',
        'TTSDK/VolcBaseLog/*.xcframework',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VolcBaseLogiOS/ios-arch-iphone/libVolcBaseLogiOS_VolcBaseLogiOS_ios.a',
      ]
      subspec.dependency 'TTSDK/SSL'
    end

    spec.subspec 'VolcLog-VE' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/VolcBaseLog/*.framework',
        'TTSDK/VolcBaseLog/*.xcframework',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VolcBaseLogiOS/ios-arch-iphone/libVolcBaseLogiOS_VolcBaseLogiOS_ios.a',
      ]
      subspec.dependency 'VEVideoKit/boringssl'
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec "Effect" do |subspec|
      subspec.public_header_files = [
        "TTSDK/VCloudPandora/**/TTSDKEffectManager.h",
      ]
      subspec.source_files = [
        "TTSDK/VCloudPandora/**/TTSDKEffectManager.h",
      ]
      subspec.vendored_libraries = [
        "TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Effect_ios.a",
      ]
      subspec.pod_target_xcconfig = {
        'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) TTSDK_ENABLE_EFFECT=1'
      }
      subspec.libraries = "stdc++"
    end

    spec.subspec 'Tools' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/lib_h_dec/**/*.a',
        'TTSDK/BVCParser/**/*.a'
      ]
      subspec.dependency 'TTSDK/SSL'
    end

    spec.subspec 'SSL' do |subspec| 
      subspec.vendored_frameworks = [
        'TTSDK/boringssl/*.framework'
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end    

    spec.subspec 'Tools-VE' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/lib_h_dec/**/*.a',
        'TTSDK/BVCParser/**/*.a'
      ]
      subspec.dependency 'VEVideoKit/boringssl'
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec 'VCN' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/VCNVCloudNetwork/**/*.a',
        'TTSDK/protobuf_lite/**/*.a'
      ]
      subspec.vendored_frameworks = [
        'TTSDK/VCNVCloudNetwork/products/framework/*.framework',
      ]
    end

    spec.subspec 'TTNet' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/protobuf_lite/**/*.a',
        'TTSDK/TTNetworkManager/**/*.a'
      ]
      subspec.ios.frameworks = [
        'JavaScriptCore'
      ]
    end

    spec.subspec 'TTNet-VE' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/protobuf_lite/**/*.a',
      ]
      subspec.dependency 'VEVideoKit/TTNetworkManager'
    end

    spec.subspec 'VideoProcessor' do |subspec|
      class_name = 'videoprocessor'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.vendored_libraries = [
        'TTSDK/videoprocessor/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/videoprocessor/videoprocessor/metal/processor.metallib',
      ]
    end

    spec.subspec 'TTFFmpeg' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/TTFFmpeg/*.framework',
      ]
      subspec.frameworks = [
        'CoreMotion',
        'CoreMedia',
        'MetalKit',
        'OpenAL',
        'VideoToolBox',
        'AudioToolBox',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.dependency 'TTSDK/Tools'
    end

    spec.subspec 'TTFFmpeg-VE' do |subspec|
      subspec.frameworks = [
        'CoreMotion',
        'CoreMedia',
        'MetalKit',
        'OpenAL',
        'VideoToolBox',
        'AudioToolBox',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.dependency 'TTFFmpeg'
      subspec.dependency 'TTSDK/Tools-VE'
    end
    spec.subspec 'PlayerCore' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/{*}.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/{*}.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/**/*.a',
      ]
      subspec.vendored_frameworks = [
        'TTSDK/ffmpeg_dashdec_iOS/*.framework',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.dependency 'TTSDK/TTFFmpeg'
      subspec.dependency 'TTSDK/VideoProcessor'
    end

    spec.subspec 'PlayerCore-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/{*}.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/{*}.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/**/*.a',
      ]
      subspec.vendored_frameworks = [
        'TTSDK/ffmpeg_dashdec_iOS/*.framework',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.dependency 'TTSDK/TTFFmpeg-VE'
      subspec.dependency 'TTSDK/VideoProcessor'
    end

    # Support Super Resolution
    spec.subspec 'PlayerCore-SR' do |subspec|
      subspec.frameworks = [
        'CoreML',
      ]
      subspec.dependency 'TTSDK/PlayerCore'
      subspec.dependency 'TTSDK/BMF'
    end

    spec.subspec 'BMF' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/BMFMods/BMFMods/**/*.a',
        'TTSDK/BMFSDK/BMF/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/BMFMods/BMFMods/resource/**/*',
      ]
    end

    spec.subspec 'LivePull' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/{TTLiveURLComposer,TVLPlayerItem+TTSDK,TVLManager+External}.h',
        'TTSDK/TTVideoLive/TTVideoLive/Classes/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VideoProcessing/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VR/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTVideoLive/TTVideoLive/Classes/**/*.h',
        'TTSDK/VCloudPandora/**/{TTLiveURLComposer,TVLPlayerItem+TTSDK,TVLManager+External}.h',
        'TTSDK/TTVideoLive/TTVideoLive/VideoProcessing/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VR/**/*.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/**/libTTVideoLive_Wrapper_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VideoProcessing_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VR_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VolcLog_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_Settings_ios.a',
        'TTSDK/TTReachability/**/libTTReachability_TTReachability_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePull_ios.a',
      ]
      subspec.dependency 'TTSDK/LiveSettings'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-SR'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.dependency 'TTSDK/LiveBase'
      subspec.frameworks = [
        'MetalPerformanceShaders'
      ]
    end
    spec.subspec 'LivePull-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/{TTLiveURLComposer,TVLPlayerItem+TTSDK,TVLManager+External}.h',
        'TTSDK/TTVideoLive/TTVideoLive/Classes/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VideoProcessing/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VR/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTVideoLive/TTVideoLive/Classes/**/*.h',
        'TTSDK/VCloudPandora/**/{TTLiveURLComposer,TVLPlayerItem+TTSDK,TVLManager+External}.h',
        'TTSDK/TTVideoLive/TTVideoLive/VideoProcessing/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VR/**/*.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/**/libTTVideoLive_Wrapper_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VideoProcessing_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VR_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VolcLog_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_Settings_ios.a',
        'TTSDK/TTReachability/**/libTTReachability_TTReachability_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePull_ios.a',
      ]
      subspec.dependency 'TTSDK/LiveSettings'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-VE'
      subspec.dependency 'TTSDK/VolcLog-VE'
      subspec.dependency 'TTSDK/LiveBase'
      subspec.frameworks = [
        'MetalPerformanceShaders'
      ]
    end
    
    spec.subspec 'LiveBase' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/*.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_VeLiveCore_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Live-CN_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Live-SG_ios.a',
      ]
    end

    spec.subspec 'LivePull-RTS' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/ios-arch-iphone/libTTVideoLive_RTC_ios.a',
      ]
      subspec.dependency 'TTSDK/ByteAudio'
      subspec.dependency 'TTSDK/LivePull'
      subspec.dependency 'TTSDK/RTS-Framework'
    end

    spec.subspec 'LivePull-RTS-VE' do |subspec|
      subspec.vendored_libraries = [
      	'TTSDK/TTVideoLive/ios-arch-iphone/libTTVideoLive_RTC_ios.a',
      ]
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtsSDK/*.framework',
      ]
      subspec.dependency 'TTSDK/LivePull-VE'
      subspec.dependency 'VolcEngineRTC-VE'
      subspec.dependency 'VEVideoKit/VolcEngineAudio'
    end

    spec.subspec 'LivePush-Base' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamFramework/**/*.h',
        'TTSDK/LiveStreamFramework/avframework/src/cpp/auto_generated/*.h',
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamAudioEffect/**/*.h',
        'TTSDK/LiveCore/**/*.h',
      ]
      subspec.private_header_files = [
        'TTSDK/LiveStreamFramework/avframework/src/cpp/third_party/byterts/**/*.h',
        'TTSDK/LiveStreamFramework/avframework/src/cpp/third_party/webrtc/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveCore/**/*.h',
        'TTSDK/LiveStreamFramework/**/*.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveCore/**/*.a',
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{base,glbase,session,webrtc,_base_webrtc,ntp,audio-effect,disklog,effect,effect-wrapper,camera,volc_base_log,di}_ios.a",
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePush_ios.a',
        'TTSDK/libyuv-iOS/**/*.a',
      ]
      subspec.frameworks = [
        'VideoToolBox',
        'AudioToolBox',
        'CoreMotion',
        'CoreMedia',
        'AVFoundation',
        'SystemConfiguration',
        'GLKit',
        'imageIO',
        'MetalPerformanceShaders'
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTFFmpeg'
      subspec.dependency 'TTSDK/LiveSettings'
      subspec.dependency 'TTSDK/ByteAudio'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.dependency 'TTSDK/Quic/Push'
      subspec.libraries = 'stdc++'
      subspec.dependency 'TTVideoEditor', '11.8.1.83-D'
      subspec.dependency "TTSDK/Encode/vc0"
      subspec.dependency "TTSDK/Encode/vc1"
      subspec.dependency 'TTSDK/BMF'
      subspec.dependency 'TTSDK/LiveBase'
    end
    
    spec.subspec 'LivePush-Base-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamFramework/**/*.h',
        'TTSDK/LiveStreamFramework/avframework/src/cpp/auto_generated/*.h',
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamAudioEffect/**/*.h',
        'TTSDK/LiveCore/**/*.h',
      ]
      subspec.private_header_files = [
        'TTSDK/LiveStreamFramework/avframework/src/cpp/third_party/byterts/**/*.h',
        'TTSDK/LiveStreamFramework/avframework/src/cpp/third_party/webrtc/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveCore/**/*.h',
        'TTSDK/LiveStreamFramework/**/*.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveCore/**/*.a',
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{base,glbase,session,webrtc,_base_webrtc,ntp,audio-effect,disklog,effect,effect-wrapper,camera,volc_base_log,di}_ios.a",
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePush_ios.a',
        'TTSDK/libyuv-iOS/**/*.a'
      ]
      subspec.frameworks = [
        'VideoToolBox',
        'AudioToolBox',
        'CoreMotion',
        'CoreMedia',
        'AVFoundation',
        'SystemConfiguration',
        'GLKit',
        'imageIO',
        'MetalPerformanceShaders'
      ]

      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTFFmpeg-VE'
      subspec.dependency 'TTSDK/LiveSettings'
      subspec.dependency 'VEVideoKit/VolcEngineAudio'
      subspec.dependency 'TTSDK/VolcLog-VE'
      subspec.dependency 'TTSDK/Quic/Push'
      subspec.libraries = 'stdc++'
      subspec.dependency 'TTVideoEditor', '11.8.1.83-D'
      subspec.dependency "TTSDK/Encode-VE/vc0"
      subspec.dependency "TTSDK/Encode-VE/vc1"
      subspec.dependency 'TTSDK/BMF'
      subspec.dependency 'TTSDK/LiveBase'
      subspec.dependency 'TTSDK/TTNet-VE'
    end

    spec.subspec 'LivePush-RTC' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_base-ext_ios.a",
      ]
      subspec.dependency 'TTSDK/LivePush-Base'
    end

    spec.subspec 'LivePush-RTMPS' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rtmps_ios.a"
      ]
      subspec.dependency 'TTSDK/TTNet'
    end

    spec.subspec 'LivePush-RTMPS-VE' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rtmps_ios.a"
      ]
      subspec.dependency 'TTSDK/TTNet-VE'
    end
    
    spec.subspec 'LivePush-RTC-VE' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_base-ext_ios.a",
      ]
      subspec.dependency 'TTSDK/LivePush-Base-VE'
    end
    
    spec.subspec 'LivePush' do |subspec|
      subspec.dependency 'TTSDK/LivePush-RTC'
    end

    spec.subspec 'LivePush-RTS' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rts_ios.a",
      ]
      subspec.dependency 'TTSDK/RTS-Framework'
      subspec.dependency 'TTSDK/LivePush-Base'
    end

    spec.subspec 'LivePush-VE' do |subspec|
      subspec.dependency 'TTSDK/LivePush-RTC-VE'
      subspec.dependency 'VEVideoKit/VolcEngineAudio'
    end

    spec.subspec 'LivePush-RTS-VE' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rts_ios.a",
      ]
      subspec.dependency 'TTSDK/LivePush-Base-VE'
      subspec.dependency 'VEVideoKit/VolcEngineAudio'
    end

    spec.subspec 'LivePush-Effect-VE' do |subspec|
      subspec.dependency 'TTSDK/Effect'
      subspec.dependency 'TTSDK/LivePush-VE'
    end

    spec.subspec 'Encode' do |subspec|
      subspec.subspec 'vc0' do |ss|
        ss.vendored_frameworks = 'TTSDK/libbytevc0enc/lib/h264.framework'
      end
      subspec.subspec 'vc1' do |ss|
        ss.vendored_frameworks = 'TTSDK/ByteRtcSDK/h265enc.xcframework'
      end
    end

    spec.subspec 'Encode-VE' do |subspec|
      subspec.subspec 'vc0' do |ss|
        ss.vendored_frameworks = 'TTSDK/libbytevc0enc/lib/h264.framework'
      end
      subspec.subspec 'vc1' do |ss|
        ss.vendored_frameworks = 'VolcEngineRTC-VE'
      end
    end

    spec.subspec 'LiveSettings' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_TTLiveSetting_ios.a',
      ]
    end
    
    spec.subspec 'Player' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/DualCore/**/*',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/Public/NetClient/TTVideoEngineNetwork.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCUtilBridge.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCVodStrategyBridge.h',
        'TTSDK/VCPreloadStrategy/sources/**/*',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader,TTTopSignature,PlaylistCacheModule,TTReachability"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.weak_frameworks = ['MetricKit']
    end
    
    spec.subspec 'Player-VE' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/DualCore/**/*',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/Public/NetClient/TTVideoEngineNetwork.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCUtilBridge.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCVodStrategyBridge.h',
        'TTSDK/VCPreloadStrategy/sources/**/*',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader,TTTopSignature,PlaylistCacheModule,TTReachability"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-VE'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog-VE'
      subspec.weak_frameworks = ['MetricKit']
    end

    # Support Super Resolution
    spec.subspec 'Player-SR' do |subspec| 
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/DualCore/**/*',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/Public/NetClient/TTVideoEngineNetwork.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCUtilBridge.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCVodStrategyBridge.h',
        'TTSDK/VCPreloadStrategy/sources/**/*',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader,TTTopSignature,PlaylistCacheModule,TTReachability"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-SR'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.weak_frameworks = ['MetricKit']
    end
    
    spec.subspec 'RTC-Framework' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtcSDK/*.framework',
        'TTSDK/ByteRtcSDK/*.xcframework',
      ]
    end

    spec.subspec 'RTS-Framework' do |subspec|
      subspec.dependency 'TTSDK/RTC-Framework'
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtsSDK/*.framework',
      ]
    end
    
    spec.subspec 'Image' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/BDWebImageToB/**/*.a',
        'TTSDK/libttheif_ios/**/*.a',
        'TTSDK/BDSword/ios-arch-iphone/*.a',
        'TTSDK/BDModel/ios-arch-iphone/*.a',    
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTNet'
      subspec.dependency 'TTSDK/Tools'
      # Third
      subspec.ios.frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
      subspec.libraries = "c++", "resolv"
      subspec.dependency 'libwebp', '>= 1.3.2'
      subspec.dependency 'MMKV', '1.2.14'
      subspec.dependency 'libdav1d', '0.8.0'
      subspec.dependency 'libavif/libdav1d', '0.9.1'
    end

    spec.subspec 'Uploader' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      lib_name = "BDVCFileUploadClient,TTTopSignature"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/Tools'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'SSZipArchive', '~> 2.2'
      subspec.weak_frameworks = 'Photos', 'UniformTypeIdentifiers'
    end

    spec.subspec 'Uploader-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      lib_name = "BDVCFileUploadClient,TTTopSignature"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'VEVideoKit/boringssl'
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
      subspec.weak_frameworks = 'Photos', 'UniformTypeIdentifiers'
    end

    spec.subspec 'ByteAudio' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/ByteAudio/*.framework',
        'TTSDK/ByteAudio/*.xcframework',
      ]
    end

    spec.subspec 'Quic' do |subspec|
      subspec.subspec 'Core' do |c|
        c.vendored_libraries = 'TTSDK/ttquic/ttquic.framework/libttquic.a'
      end

      subspec.subspec 'Pull' do |pull|
        pull.vendored_libraries = 'TTSDK/TTVideoLive/ios-arch-iphone/libTTVideoLive_TTQuicWrapper_ios.a'
        pull.dependency 'TTSDK/Quic/Core'
      end
      
      subspec.subspec 'Push' do |push|
        push.public_header_files = [
          'TTSDK/VCloudPandora/**/LiveCore+TTSDK.h',
        ]
        push.source_files = [
          'TTSDK/VCloudPandora/**/LiveCore+TTSDK.h',
        ]
        push.vendored_libraries = 'TTSDK/LiveStreamFramework/ios-arch-iphone/libLiveStreamFramework_rtmpq_ios.a'
        push.dependency 'TTSDK/Quic/Core'
      end
    end
    
    # MARK: - Stripped Pod Spec , Use With Caution! If there is no ssl symbol conflict, Should not intergrate subspecs below.

    spec.subspec 'Player-Strip' do |subspec| 
      subspec.dependency 'TTSDK/Player'
    end
    
    spec.subspec 'LivePull-Strip' do |subspec| 
      subspec.dependency 'TTSDK/LivePull'
    end

    spec.subspec 'LivePush-Strip' do |subspec|
      subspec.dependency 'TTSDK/LivePush'
    end

    spec.subspec 'Image-Strip' do |subspec| 
      subspec.dependency 'TTSDK/Image'
    end
  end

  Pod::Spec.new do |spec|

    spec.name         = "TTSDK"
    spec.version      = "1.28.1.1-standard"
    spec.summary      = "A comprehensive multimedia SDK."
    spec.description  = <<-DESC
      A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                    DESC

    spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"

    spec.license      = { :type => 'MIT', :file => 'LICENSE' }

    spec.author       = { "chenzhaojie" => "chenzhaojie@bytedance.com" }
    spec.platform     = :ios, "8.0"

    spec.source       = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTSDK/#{spec.version}/TTSDK.zip" }
    
    spec.default_subspecs = 'Core', 'TTFFmpeg', 'PlayerCore', 'LivePull', 'LivePush', 'Player', 'Image'

    spec.static_framework = true
    
    spec.subspec 'Core' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/TTSDKManager.h',
      ]
      subspec.source_files = [
        'TTSDK/VCloudPandora/**/TTSDKManager.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Core_ios.a',
      ]
      subspec.dependency 'RangersAppLog/Core', '~> 6.9.1'
      subspec.dependency 'RangersAppLog/Host/CN', '~> 6.9.1'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'Tools' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/boringssl/**/*.a',
        'TTSDK/lib_h_dec/**/*.a'
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec 'VCN' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/VCNVCloudNetwork/**/*.a',
        'TTSDK/protobuf_lite/**/*.a'
      ]
    end

    spec.subspec 'TTNet' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/protobuf_lite/**/*.a',
        'TTSDK/TTNetworkManager/**/*.a'
      ]
    end

    spec.subspec 'TTFFmpeg' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/TTFFmpeg/**/*.a',
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

    spec.subspec 'PlayerCore' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.dependency 'TTSDK/TTFFmpeg'
    end

    # Support Super Resolution
    spec.subspec 'PlayerCore-SR' do |subspec|
      subspec.public_header_files = [
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.source_files = [
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTPlayerSDK/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.dependency 'TTSDK/TTFFmpeg'
    end

    spec.subspec 'LivePull' do |subspec|
      class_name = 'lens,videoprocessor'
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/{TTLiveURLComposer,TVLPlayerItem+TTSDK,TVLManager+External}.h',
        'TTSDK/TTVideoLive/TTVideoLive/Classes/**/*.h',
        'TTSDK/TTVideoLive/TTVideoLive/VideoProcessing/**/*.h',
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        'TTSDK/TTVideoLive/TTVideoLive/Classes/**/*',
        'TTSDK/VCloudPandora/**/{TTLiveURLComposer,TVLPlayerItem+TTSDK,TVLManager+External}.h',
        'TTSDK/TTVideoLive/TTVideoLive/VideoProcessing/**/*.h',
        "TTSDK/{#{class_name}}/**/*"
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/**/libTTVideoLive_Wrapper_ios.a',
        'TTSDK/TTVideoLive/**/libTTVideoLive_VideoProcessing_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePull_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_TTLiveSetting_ios.a',
        "TTSDK/{#{class_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-SR'
    end

    spec.subspec 'LivePull-RTS' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/bytedance_dup_TTSDK_dup/Pods/TTVideoLive/ios-arch-iphone/libTTVideoLive_RTC_ios.a',
      ]
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtsSDK/*.framework',
      ]
      subspec.dependency 'TTSDK/LivePull'
      subspec.dependency 'TTSDK/RTC-Framework'
    end

    spec.subspec 'LivePush-RTC' do |subspec|
    	subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamFramework/**/*.h',
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamAudioEffect/**/*.h',
        'TTSDK/LiveCore/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveCore/**/*',
        'TTSDK/LiveStreamFramework/**/*'
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveCore/**/*.a',
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{base,glbase,session,webrtc,base_webrtc,ntp,audio-effect}_ios.a",
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
      subspec.dependency 'TTSDK/TTFFmpeg'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'LivePush' do |subspec|
      subspec.dependency 'TTSDK/LivePush-RTC'
      subspec.vendored_frameworks = [
        'TTSDK/ByteAudio/*.framework',
      ]
    end

    spec.subspec 'Player' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/DualCore/**/*',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCUtilBridge.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCVodStrategyBridge.h',
        'TTSDK/VCPreloadStrategy/sources/**/*',
        'TTSDK/BDHTTPDNS/BDHTTPDNS/TTDnsExportResult.h',
        'TTSDK/BDHTTPDNS/BDHTTPDNS/TTDnsResolver.h',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader,VCNVCloudNetwork,TTTopSignature"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore'
    end

    # Support Super Resolution
    spec.subspec 'Player-SR' do |subspec| 
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS,lens,videoprocessor'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/DualCore/**/*',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCUtilBridge.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCVodStrategyBridge.h',
        'TTSDK/VCPreloadStrategy/sources/**/*',
        'TTSDK/BDHTTPDNS/BDHTTPDNS/TTDnsExportResult.h',
        'TTSDK/BDHTTPDNS/BDHTTPDNS/TTDnsResolver.h',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader,VCNVCloudNetwork,TTTopSignature"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-SR'
    end
    
    spec.subspec 'RTC-Framework' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtcSDK/*.framework',
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
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTNet'
      subspec.dependency 'TTSDK/Tools'
      # Third
      subspec.ios.frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
      subspec.libraries = "c++", "resolv"
      subspec.dependency 'libwebp'
      subspec.dependency 'MMKV'
      subspec.dependency 'libdav1d', '0.8.0'
      subspec.dependency 'libavif/libdav1d', '0.9.1'
    end

    spec.subspec 'Uploader' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTFileUploadClientb/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTFileUploadClientb/**/*',
      ]
      subspec.vendored_libraries = [
        "TTSDK/{TTFileUploadClientb}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/Tools'
      subspec.dependency 'TTSDK/VCN'
    end

    # Lite Pod Spec , Use With Caution! If there is no symbol conflict, Should not intergrate subspecs below

    spec.subspec 'PlayerCore-Lite' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/**/*.a',
        'TTSDK/lib_h_dec/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.frameworks = ['CoreMotion', 'CoreMedia', 'MetalKit', 'OpenAL', 'VideoToolBox', 'AudioToolBox', 'AVFoundation', 'SystemConfiguration']
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec 'Player-Lite' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader,VCNVCloudNetwork,TTTopSignature"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-Lite'
    end

    spec.subspec 'LivePull-Lite' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTVideoLive/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTVideoLive/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/**/*.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePull_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_TTLiveSetting_ios.a',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-Lite'
    end

    # MARK: - Stripped Pod Spec , Use With Caution! If there is no ssl symbol conflict, Should not intergrate subspecs below.

    spec.subspec 'Player-Strip' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings,BDHTTPDNS'
      subspec.public_header_files = [
        "TTSDK/{#{class_name}}/**/*.h"
      ]
      subspec.source_files = [
        "TTSDK/{#{class_name}}/**/*"
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/DualCore/**/*',
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCUtilBridge.h',
        'TTSDK/VCPreloadStrategy/ios/bridge/VCVodStrategyBridge.h',
        'TTSDK/VCPreloadStrategy/sources/**/*',
        'TTSDK/BDHTTPDNS/BDHTTPDNS/TTDnsExportResult.h',
        'TTSDK/BDHTTPDNS/BDHTTPDNS/TTDnsResolver.h',
      ]
      lib_name = "#{class_name},MDLMediaDataLoader_strip,VCNVCloudNetwork_strip,TTTopSignature,lib_h_dec"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-Strip'
    end
    
    spec.subspec 'LivePull-Strip' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTVideoLive/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTVideoLive/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/**/*.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePull_ios.a',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-Strip'
      subspec.dependency 'CocoaAsyncSocket', '~> 7.6.4'
    end

    spec.subspec 'LivePush-Strip' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamFramework/**/*.h',
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamAudioEffect/**/*.h',
        'TTSDK/LiveCore/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveCore/**/*',
        'TTSDK/LiveStreamFramework/**/*'
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveCore/**/*.a',
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{base,glbase,session,webrtc,base_webrtc,ntp,audio-effect}_ios.a",
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePush_ios.a',
        'TTSDK/libyuv-iOS/**/*.a'
      ]
      subspec.vendored_frameworks = [
        'TTSDK/ByteAudio/*.framework',
      ]
      subspec.frameworks = [
        'SystemConfiguration',
        'GLKit',
        'imageIO',
        'MetalPerformanceShaders'
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTFFmpeg-Strip'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'Uploader-Strip' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTFileUploadClientb/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTFileUploadClientb/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/{TTVideoSetting,TTFileUploadClientb}/**/*.a',
        'TTSDK/protobuf_lite/**/*.a',
        'TTSDK/lib_h_dec/**/*.a',
        'TTSDK/VCNVCloudNetwork_strip/**/*.a'
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
      subspec.dependency 'TTSDK/Core'
    end

    spec.subspec 'PlayerCore-Strip' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTPlayerDef.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/**/*.a',
        'TTSDK/audiosdk/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
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
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
      subspec.dependency 'TTSDK/TTFFmpeg-Strip'
    end

    spec.subspec 'TTFFmpeg-Strip' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/boringssl/**/libcrcrypto.a',
        'TTSDK/TTFFmpeg_strip/**/*.a',
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
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec 'TTNet-Strip' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/protobuf_lite/**/*.a',
        'TTSDK/TTNetworkManager_strip/**/*.a'
      ]
    end

    spec.subspec 'Image-Strip' do |subspec|
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
        'TTSDK/protobuf_lite/**/*.a',
        'TTSDK/lib_h_dec/**/*.a',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTNet-Strip'
      # Third
      subspec.ios.frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
      subspec.libraries = "c++", "resolv", 'stdc++', 'z', 'xml2', 'iconv'
      subspec.dependency 'libwebp'
      subspec.dependency 'MMKV'
      subspec.dependency 'libdav1d', '0.8.0'
      subspec.dependency 'libavif/libdav1d', '0.9.1'
    end
    
  end

  Pod::Spec.new do |spec|
    spec.name         = "TTSDK"
    spec.version      = "1.49.1.8-premium"
    spec.summary      = "A comprehensive multimedia SDK."
    spec.description  = <<-DESC
      A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                    DESC
  
    spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"
  
    spec.license      = { :type => 'Copyright', :text => 'Bytedance copyright' }
  
    spec.author       = { "chenzhaojie" => "chenzhaojie@bytedance.com" }
    spec.platform     = :ios, "11.0"
  
    spec.source       = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/TTSDK/1.49.1.8-premium/TTSDK-1.49.1.8-premium.zip" }
    
    spec.default_subspecs = 'Core', 'LivePull', 'LivePush', 'Player', 'Image'
  
    spec.static_framework = true
    
    spec.subspec 'Core' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/TTSDKManager.h',
        'TTSDK/VCloudPandora/**/TTLicenseManager.h',
        'TTSDK/VCloudPandora/**/TTSDKManager+Debug.h',
      ]
      subspec.source_files = [
        'TTSDK/VCloudPandora/**/TTSDKManager.h',
        'TTSDK/VCloudPandora/**/TTSDKManager+Debug.h',
        'TTSDK/VCloudPandora/**/TTSDKManager+Debug.m',
        'TTSDK/VCloudPandora/**/TTLicenseManager.h',
        'TTSDK/TTSDK_Dummy/TTSDK_Module_Dummy.m',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Core_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_CN_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_SG_ios.a',
        'TTSDK/TTSDKVersion/libTTSDKVersion.a'
      ]
      subspec.vendored_frameworks = [
        'TTSDK/VCBaseKit/*.xcframework',
        'TTSDK/VCBaseKit/*.framework'
      ]
      unless $DoNotInstallApplogVersion == "6.16.8"
        subspec.dependency 'RangersAppLog/Core', '~> 6.16.8'
        subspec.dependency 'RangersAppLog/Host/CN', '~> 6.16.8'
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
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'LivePull-VolcLog' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/LivePlayer/**/libLivePlayer_VolcLog_ios.a',
      ]
      subspec.dependency 'TTSDK/VolcLog'
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
  
    spec.subspec 'Tools' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/lib_h_dec/**/*.a'
      ]
    end
  
    spec.subspec 'SSL' do |subspec| 
      subspec.vendored_frameworks = [
        'TTSDK/boringssl/*.framework'
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end
  
    spec.subspec 'Tools-VE' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/lib_h_dec/**/*.a'
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
      subspec.weak_frameworks = [
        'JavaScriptCore', 'SystemConfiguration'
      ]
      subspec.dependency 'TTNetworkManager', '4.2.210.20'
      subspec.libraries = 'stdc++'
    end
  
    spec.subspec 'TTNet-VE' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/protobuf_lite/**/*.a',
      ]
      subspec.dependency 'VEVideoKit/boringssl'
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
      subspec.weak_frameworks = 'MetalKit', 'CoreMotion'
      subspec.libraries = 'stdc++'
    end
  
    spec.subspec 'TTFFmpeg' do |subspec|
      subspec.subspec 'Normal' do |ss|
        ss.vendored_libraries = [
          'TTSDK/BVCParser/lib/**/*.a'
        ]
        ss.vendored_frameworks = [
          'TTSDK/TTFFmpeg/*.framework'
        ]
        ss.dependency 'TTSDK/Tools'
        ss.dependency 'TTSDK/SSL'
        ss.weak_frameworks = [
          'CoreMotion',
          'CoreMedia',
          'MetalKit',
          'OpenAL',
          'VideoToolBox',
          'AudioToolBox',
          'AVFoundation',
          'SystemConfiguration',
        ]
      end
      
      subspec.subspec 'VodLite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/BVCParser/lib/**/*.a'
        ]
        ss.vendored_frameworks = [
         'TTSDK/TTFFmpeg/VodLite/*.framework'
        ]
        ss.weak_frameworks = [
          'CoreMotion',
          'CoreMedia',
          'MetalKit',
          'OpenAL',
          'VideoToolBox',
          'AudioToolBox',
          'AVFoundation',
          'SystemConfiguration',
        ]
      end

      subspec.subspec 'LiveLite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/BVCParser/lib/**/*.a'
        ]
        ss.vendored_frameworks = [
         'TTSDK/TTFFmpeg/LiveLite/*.framework'
        ]
        ss.weak_frameworks = [
          'CoreMotion',
          'CoreMedia',
          'MetalKit',
          'OpenAL',
          'VideoToolBox',
          'AudioToolBox',
          'AVFoundation',
          'SystemConfiguration',
        ]
      end
    end
  
    spec.subspec 'TTFFmpeg-VE' do |subspec|
      subspec.weak_frameworks = [
        'CoreMotion',
        'CoreMedia',
        'MetalKit',
        'OpenAL',
        'VideoToolBox',
        'AudioToolBox',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.vendored_libraries = [
        'TTSDK/BVCParser/**/*.a'
      ]
      subspec.dependency 'TTFFmpeg/Normal'
      subspec.dependency 'TTSDK/Tools-VE'
    end
  
    spec.subspec 'PlayerCore' do |subspec|
      subspec.subspec 'Base' do |ss|
        ss.public_header_files = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/Headers/{*}.h',
        ]
        ss.source_files = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/Headers/{*}.h',
        ]
        ss.resources = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
        ]
        ss.dependency 'TTSDK/Core'
        ss.libraries = 'z', 'stdc++', 'xml2'
      end

      subspec.subspec 'Normal' do |ss|
        ss.vendored_libraries = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.a',
        ]
        ss.vendored_frameworks = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.xcframework',
          'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.framework',
        ]
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/Normal'
        ss.dependency 'TTSDK/VideoProcessor'
        ss.dependency 'TTSDK/Tools'
        ss.dependency 'TTSDK/SSL'
      end

      subspec.subspec 'H266' do |ss|
        ss.vendored_libraries = [
          'TTSDK/TTPlayerSDK/VodH266/TTPlayerSDK/TTPlayer/*.a',
        ]
        ss.vendored_frameworks = [
          'TTSDK/TTPlayerSDK/VodH266/TTPlayerSDK/TTPlayer/*.xcframework',
          'TTSDK/TTPlayerSDK/VodH266/TTPlayerSDK/TTPlayer/*.framework',
        ]
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/Normal'
        ss.dependency 'TTSDK/VideoProcessor'
        ss.dependency 'TTSDK/Decode/H266'
        ss.dependency 'TTSDK/Tools'
        ss.dependency 'TTSDK/SSL'
      end

      subspec.subspec 'VodLite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.a',
        ]
        ss.vendored_frameworks = [
          'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.xcframework',
          'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.framework',
        ]
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/VodLite'
        ss.dependency 'TTSDK/VideoProcessor'
        ss.dependency 'TTSDK/Tools'
        ss.dependency 'TTSDK/SSL'
      end
      
      subspec.subspec 'LiveLite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/TTPlayerSDK/LiveLite/TTPlayerSDK/TTPlayer/*.a',
        ]
        ss.vendored_frameworks = [
          'TTSDK/TTPlayerSDK/LiveLite/TTPlayerSDK/TTPlayer/*.xcframework',
          'TTSDK/TTPlayerSDK/LiveLite/TTPlayerSDK/TTPlayer/*.framework',
        ]
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/LiveLite'
      end
      
    end
  
    spec.subspec 'PlayerCore-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Headers/{*}.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Headers/{*}.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.a',
      ]
      subspec.vendored_frameworks = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.xcframework',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.framework',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTFFmpeg-VE'
      subspec.dependency 'TTSDK/VideoProcessor'
      subspec.dependency 'TTSDK/Tools-VE'
      subspec.libraries = 'z', 'stdc++'
    end
  
    spec.subspec 'BMF' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/BMFMods/BMFMods/**/*.a',
        'TTSDK/BMFSDK/BMF/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/BMFMods/BMFMods/resource/**/*',
      ]
      subspec.weak_frameworks = [
        'MetalPerformanceShaders'
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'LivePlayer' do |subspec|
      subspec.subspec 'Base' do |ss|
        ss.public_header_files = [
          'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/Classes/**/*.h',
        ]
        ss.source_files = [
          'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/Classes/**/*.h',
        ]
        ss.weak_frameworks = [
          'MetalPerformanceShaders', 'AVFoundation', 'CoreMedia', 'AudioToolBox', 'VideoToolBox', 'CoreTelephony', 'SystemConfiguration', 'CoreML'
        ]
        ss.libraries = 'stdc++'
        ss.dependency 'TTSDK/Core'
        ss.dependency 'TTSDK/LiveBase'
        ss.dependency 'TTSDK/LivePull-VolcLog'
      end

      subspec.subspec 'Normal' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_Wrapper_ios.a',
          'TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_Settings_ios.a',
          'TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_toB_ios.a',
        ]
        ss.dependency 'TTSDK/PlayerCore/Normal'
        ss.dependency 'TTSDK/LivePlayer/Base'
      end

      subspec.subspec 'Lite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/LiveLite/**/libLivePlayer_Wrapper_ios.a',
          'TTSDK/LivePlayer/LiveLite/**/libLivePlayer_Settings_ios.a',
          'TTSDK/LivePlayer/LiveLite/**/libLivePlayer_toB_ios.a',
        ]
        ss.dependency 'TTSDK/PlayerCore/LiveLite'
        ss.dependency 'TTSDK/LivePlayer/Base'
      end

      subspec.subspec 'BMF' do |ss|
        ss.public_header_files = [
          'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VideoProcessing/**/*.h',
          'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VR/**/*.h',
        ]
        ss.source_files = [
          'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VideoProcessing/**/*.h',
          'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VR/**/*.h',
        ]
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/**/libLivePlayer_VideoProcessing_ios.a',
          'TTSDK/LivePlayer/**/libLivePlayer_VR_ios.a',
        ]
        ss.dependency 'TTSDK/BMF'
        ss.dependency 'TTSDK/LivePlayer/Normal'
      end

      subspec.subspec 'RTM' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_RTC_ios.a',
        ]
        ss.dependency 'TTSDK/LivePlayer/Normal'
        ss.dependency 'TTSDK/RTS-Framework'
      end

      subspec.subspec 'RTM-Lite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/LiveLite/ios-arch-iphone/libLivePlayer_RTC_ios.a',
        ]
        ss.dependency 'TTSDK/LivePlayer/Lite'
        ss.dependency 'TTSDK/RTS-Framework'
      end
    end


    spec.subspec 'LivePull-Lite' do |subspec|
      subspec.dependency 'TTSDK/LivePlayer/Lite'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/Strategy/Lite'
      subspec.dependency 'TTSDK/LiveBase'
    end
  
    spec.subspec 'LivePull-Lite-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/Classes/**/*.h',
        'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VideoProcessing/**/*.h',
        'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VR/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/Classes/**/*.h',
        'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VideoProcessing/**/*.h',
        'TTSDK/LivePlayer/business_modules/LivePlayer/Sources/VR/**/*.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/LivePlayer/**/libLivePlayer_Wrapper_ios.a',
        'TTSDK/LivePlayer/**/libLivePlayer_Settings_ios.a',
        'TTSDK/LivePlayer/**/libLivePlayer_VideoProcessing_ios.a',
        'TTSDK/LivePlayer/**/libLivePlayer_VR_ios.a',
        'TTSDK/LivePlayer/**/libLivePlayer_VolcLog_ios.a',
        'TTSDK/LivePlayer/**/libLivePlayer_toB_ios.a'
      ]
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-VE'
      subspec.dependency 'TTSDK/VolcLog-VE'
      subspec.dependency 'TTSDK/LiveBase-VE'
      subspec.weak_frameworks = [
        'MetalPerformanceShaders'
      ]
    end

    spec.subspec 'MDLMediaDataLoader' do |subspec|
      subspec.subspec 'Main' do |s|
        s.vendored_libraries = [
          "TTSDK/MDLMediaDataLoader/**/libMediaLoader.a"
        ]
      end
      subspec.subspec 'TTNetDownloader' do |s|
        s.vendored_libraries = [
          "TTSDK/MDLMediaDataLoader/**/libttnet_loader.a"
        ]
      end
    end

    spec.subspec 'LivePull' do |subspec|
      subspec.dependency 'TTSDK/LivePlayer/Normal'
      subspec.dependency 'TTSDK/LivePlayer/BMF'
      subspec.dependency 'TTSDK/Quic/Pull'
      subspec.dependency 'TTSDK/Strategy/Pull'
    end

    spec.subspec 'LivePull-VE' do |subspec|
      subspec.dependency 'TTSDK/LivePull-Lite-VE'
      subspec.dependency 'TTSDK/Quic-VE/Pull'
      subspec.dependency 'TTSDK/Strategy-VE/Pull'
    end
    
    spec.subspec 'LiveBase' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Live-CN_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Live-SG_ios.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_TTLiveSetting_ios.a',
        'TTSDK/VeLiveCommon/ios-arch-iphone/libVeLiveCommon_Core_ios.a',
        'TTSDK/VeLiveCommon/ios-arch-iphone/libVeLiveCommon_CN_ios.a',
        'TTSDK/VeLiveCommon/ios-arch-iphone/libVeLiveCommon_SG_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_AppLog_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_Log_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK__Core_SettingsManager_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK__SettingsManager_NodeProberConfig_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_NodeProberConfig_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_webrtc_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_Utils_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK__Log_NodeProberToB_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_Preconnect_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_NodeProberToB_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_Core_ios.a',
        'TTSDK/LiveStreamStrategySDK/ios-arch-iphone/libLiveStreamStrategySDK_SettingsManager_ios.a',
      ]
      subspec.public_header_files = [
        'TTSDK/VeLiveCommon/iOS/VeLiveCommon/Classes/Core/*.h',
      ]
      subspec.source_files = [
        'TTSDK/VeLiveCommon/iOS/VeLiveCommon/Classes/Core/*.h',
      ]
      subspec.resource_bundles = {
        'VeLive' => ['TTSDK/VeLiveCommon/iOS/VeLiveCommon/Assets/PrivacyInfo.xcprivacy']
      }
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'LiveBase-VE' do |subspec|
      subspec.dependency 'TTSDK/LiveBase'
    end

    spec.subspec 'Live-HttpDNS' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VeLiveCommon/iOS/VeLiveCommon/Classes/HttpDNS/*.h',
      ]
      subspec.source_files = [
        'TTSDK/VeLiveCommon/iOS/VeLiveCommon/Classes/HttpDNS/*.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VeLiveCommon/ios-arch-iphone/libVeLiveCommon_HttpDNS_ios.a',
      ]
      subspec.dependency 'TTSDK/HttpDNS'
      subspec.dependency 'TTSDK/LiveBase'
    end

    spec.subspec 'Strategy' do |subspec|
      subspec.subspec 'Core' do |ss|
        # ss.vendored_libraries = [
        # ]
        ss.dependency 'TTSDK/Reachability'
        ss.dependency 'TTSDK/LiveBase'
      end

      subspec.subspec 'Pull' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_LSS_ios.a'
        ]
        ss.dependency 'TTSDK/LivePlayer/Normal'
        ss.dependency 'TTSDK/Strategy/Core'
      end

      subspec.subspec 'Lite' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/LiveLite/**/libLivePlayer_LSS_ios.a'
        ]
        ss.dependency 'TTSDK/LivePlayer/Lite'
        ss.dependency 'TTSDK/Strategy/Core'
      end
    end

    spec.subspec 'Strategy-VE' do |subspec|
      subspec.subspec 'Core' do |ss|
        ss.dependency 'TTSDK/Strategy/Core'
      end
      subspec.subspec 'Pull' do |ss|
        ss.vendored_libraries = [
          'TTSDK/LivePlayer/**/libLivePlayer_LSS_ios.a'
        ]
        ss.dependency 'TTSDK/LivePull-Lite-VE'
        ss.dependency 'TTSDK/Strategy/Core'
      end
    end
  
    spec.subspec 'LivePull-RTS' do |subspec|
      subspec.dependency 'TTSDK/LivePlayer/RTM'
      subspec.dependency 'TTSDK/LivePull'
      subspec.dependency 'TTSDK/LivePlayer/BMF'
      subspec.libraries = 'stdc++', 'z'
    end

    spec.subspec 'LivePull-RTS-Lite' do |subspec|
      subspec.dependency 'TTSDK/LivePull-Lite'
      subspec.dependency 'TTSDK/LivePlayer/RTM-Lite'
      subspec.libraries = 'stdc++', 'z'
    end
  
    spec.subspec 'LivePull-RTS-VE' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_RTC_ios.a',
      ]
      subspec.dependency 'TTSDK/RTS-Framework-VE'
      subspec.dependency 'TTSDK/LivePull-Lite-VE'
      subspec.libraries = 'stdc++', 'z'
    end
  
    spec.subspec 'LivePush-Lite' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/sources/**/*.h',
        'TTSDK/LiveStreamFramework/avframework/src/cpp/auto_generated/*.h',
        'TTSDK/VCloudPandora/**/LiveCore+TTSDK.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveStreamFramework/**/*.h',
        'TTSDK/VCloudPandora/**/LiveCore+TTSDK.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{_glbase_rtcBase,ktv,lite,liveStream,rtcBase,screenRecorder,tools}_ios.a',
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{base,glbase,session,webrtc,_base_webrtc,ntp,audio-effect,disklog,effect,effect-wrapper,camera,volc_base_log,di,_glbase_effect,VeCamera}_ios.a",
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_base-ext_ios.a",
      ]
      subspec.weak_frameworks = [
        'VideoToolBox',
        'AudioToolBox',
        'CoreMotion',
        'CoreMedia',
        'AVFoundation',
        'SystemConfiguration',
        'GLKit',
        'ImageIO',
        'MetalPerformanceShaders',
        'Accelerate'
      ]
      subspec.dependency 'TTSDK/LibYUV'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/SSL'
      subspec.dependency 'TTSDK/ByteAudio'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.libraries = 'stdc++', 'z'
      subspec.dependency 'TTSDK/BMF'
      subspec.dependency 'TTSDK/LiveBase'
    end
    
    spec.subspec 'LivePush-Lite-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/sources/**/*.h',
        'TTSDK/LiveStreamFramework/avframework/src/cpp/auto_generated/*.h',
        'TTSDK/VCloudPandora/**/LiveCore+TTSDK.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveCore/**/*.h',
        'TTSDK/LiveStreamFramework/**/*.h',
        'TTSDK/VCloudPandora/**/LiveCore+TTSDK.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{_glbase_rtcBase,ktv,lite,liveStream,rtcBase,screenRecorder,tools}_ios.a',
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_{base,glbase,session,webrtc,_base_webrtc,ntp,audio-effect,disklog,effect,effect-wrapper,camera,volc_base_log,di,_glbase_effect,VeCamera}_ios.a",
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_base-ext_ios.a",
      ]
      subspec.weak_frameworks = [
        'VideoToolBox',
        'AudioToolBox',
        'CoreMotion',
        'CoreMedia',
        'AVFoundation',
        'SystemConfiguration',
        'GLKit',
        'ImageIO',
        'MetalPerformanceShaders',
        'Accelerate'
      ]
      subspec.dependency 'TTSDK/LibYUV'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTFFmpeg-VE'
      subspec.dependency 'VEVideoKit/boringssl'
      subspec.dependency 'VEVideoKit/VolcEngineAudio'
      subspec.dependency 'TTSDK/VolcLog-VE'
      subspec.libraries = 'stdc++', 'z'
      subspec.dependency 'TTSDK/BMF'
      subspec.dependency 'TTSDK/LiveBase-VE'
      subspec.dependency "TTSDK/Encode-VE/h264"
      subspec.dependency "TTSDK/Encode-VE/h265"
    end

    spec.subspec 'LivePush' do |subspec|
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency 'TTSDK/Quic/Push'
      subspec.dependency "TTSDK/Encode/h264"
      subspec.dependency "TTSDK/Encode/h265"
    end

    spec.subspec 'LivePush-VE' do |subspec|
      subspec.dependency 'TTSDK/LivePush-Lite-VE'
      subspec.dependency 'TTSDK/Quic-VE/Push'
    end
  
    spec.subspec 'LivePush-RTMPS' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rtmps_ios.a"
      ]
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency 'TTSDK/TTNet'
      subspec.dependency "TTSDK/Encode/h264"
      subspec.dependency "TTSDK/Encode/h265"
      subspec.libraries = 'stdc++'
    end
  
    spec.subspec 'LivePush-RTMPS-VE' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rtmps_ios.a"
      ]
      subspec.dependency 'TTSDK/LivePush-Lite-VE'
      subspec.dependency 'TTSDK/TTNet-VE'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'ScreenCapture' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/sources/VeLiveInterface/Classes/ScreenCapture/VeLivePusher+ScreenCapture.h'
      ]
      subspec.source_files = [
        'TTSDK/LiveStreamFramework/sources/VeLiveInterface/Classes/ScreenCapture/VeLivePusher+ScreenCapture.h'
      ]
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/ios-arch-iphone/libLiveStreamFramework_ScreenCapture_ios.a",
      ]
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency 'TTSDK/ScreenCaptureExtension'
    end

    spec.subspec 'ScreenCaptureExtension' do |subspec|
      subspec.weak_frameworks = 'ReplayKit'
      subspec.vendored_frameworks = 'TTSDK/VeLiveReplayKitExtension/binaries/ios/VeLiveReplayKitExtension.framework'
    end

    spec.subspec 'LivePush-RTS' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rts_ios.a",
      ]
      subspec.dependency 'TTSDK/RTS-Framework'
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency "TTSDK/Encode/h264"
      subspec.dependency "TTSDK/Encode/h265"
    end
  
    spec.subspec 'LivePush-RTS-VE' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/LiveStreamFramework/**/libLiveStreamFramework_rts_ios.a",
      ]
      subspec.dependency 'TTSDK/RTS-Framework-VE'
      subspec.dependency 'TTSDK/LivePush-Lite-VE'
    end
  
    spec.subspec 'Encode' do |subspec|
      subspec.subspec 'h264' do |ss|
        ss.vendored_frameworks = 'TTSDK/libbytevc0enc/**/h264.framework'
      end
      subspec.subspec 'h265' do |ss|
        ss.vendored_frameworks = 'TTSDK/ByteRtcSDK/**/h265enc.xcframework'
      end
    end

    spec.subspec 'Decode' do |subspec|
      subspec.subspec 'H266' do |ss|
        ss.vendored_libraries = [
          'TTSDK/libbytevc2dec/lib/**/*.a',
        ]
      end
    end
  
    spec.subspec 'Encode-VE' do |subspec|
      subspec.subspec 'h264' do |ss|
        ss.vendored_frameworks = 'TTSDK/libbytevc0enc/lib/h264.framework'
      end
      subspec.subspec 'h265' do |ss|
        ss.dependency 'VolcEngineRTC-VE'
      end
    end
    
    spec.subspec 'Player' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings'
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
      lib_name = "#{class_name},PlaylistCacheModule"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/MDLMediaDataLoader/Main'
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore/Normal'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
      subspec.libraries = 'sqlite3', 'stdc++', 'z'
      subspec.resource_bundles = {
        'TTSDKPlayer' => ['TTSDK/TTVideoEngine/TTVideoEngine/Assets/PrivacyInfo.xcprivacy']
      }
    end

    spec.subspec 'PlayerLite' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings'
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
      lib_name = "#{class_name},PlaylistCacheModule"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/MDLMediaDataLoader/Main'
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore/VodLite'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
      subspec.libraries = 'sqlite3', 'stdc++', 'z'
      subspec.resource_bundles = {
        'TTSDKPlayer' => ['TTSDK/TTVideoEngine/TTVideoEngine/Assets/PrivacyInfo.xcprivacy']
      }
    end

    spec.subspec 'Player-H266' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings'
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
      lib_name = "#{class_name},PlaylistCacheModule"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/MDLMediaDataLoader/Main'
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore/H266'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
      subspec.libraries = 'sqlite3', 'stdc++', 'z'
      subspec.resource_bundles = {
        'TTSDKPlayer' => ['TTSDK/TTVideoEngine/TTVideoEngine/Assets/PrivacyInfo.xcprivacy']
      }
    end

    spec.subspec 'Player-Quic' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings'
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
      lib_name = "#{class_name},PlaylistCacheModule"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/MDLMediaDataLoader/Main'
      subspec.dependency 'TTSDK/MDLMediaDataLoader/TTNetDownloader'
      subspec.dependency 'TTSDK/TTNet'
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore/Normal'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog'
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
      subspec.libraries = 'sqlite3', 'stdc++', 'z'
      subspec.resource_bundles = {
        'TTSDKPlayer' => ['TTSDK/TTVideoEngine/TTVideoEngine/Assets/PrivacyInfo.xcprivacy']
      }
    end

    spec.subspec 'HttpDNS' do |subspec|
      subspec.vendored_frameworks = 'TTSDK/BDHTTPDNS/binaries/ios/BDHTTPDNS.{framework,xcframework}'
      subspec.weak_frameworks = ['CoreTelephony', 'SystemConfiguration']
    end
    
    spec.subspec 'Player-VE' do |subspec|
      class_name = 'TTVideoEngine,ABRInterface,VCPreloadStrategy,TTNetworkPredict,VCVodSettings'
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
      lib_name = "#{class_name},PlaylistCacheModule"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/MDLMediaDataLoader/Main'
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore-VE'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/VolcLog-VE'
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
      subspec.libraries = 'sqlite3', 'stdc++', 'z'
      subspec.resource_bundles = {
        'TTSDKPlayerVE' => ['TTSDK/TTVideoEngine/TTVideoEngine/Assets/PrivacyInfo.xcprivacy']
      }
    end
  
    # Support Super Resolution
    spec.subspec 'Player-SR' do |subspec| 
      subspec.dependency 'TTSDK/Player'
      subspec.dependency 'TTSDK/BMF'
    end

    spec.subspec 'PlayerLite-SR' do |subspec| 
      subspec.dependency 'TTSDK/Player'
      subspec.dependency 'TTSDK/BMF'
    end

    spec.subspec 'Player-SR-H266' do |subspec| 
      subspec.dependency 'TTSDK/Player-H266'
      subspec.dependency 'TTSDK/BMF'
    end
  
    spec.subspec 'Reachability' do |subspec|
      unless $DoNotUseReachability == "1"
        subspec.vendored_libraries = [
          "TTSDK/TTReachability/**/*.a"
        ]
      else
        subspec.source_files = [
          'TTSDK/TTSDK_Dummy/TTSDK_Module_Dummy.m'
        ]
      end
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony', 'SystemConfiguration']
      subspec.libraries = 'stdc++', 'z'
    end
  
    spec.subspec 'TopSignature' do |subspec|
      subspec.vendored_libraries = [
        "TTSDK/TTTopSignature/**/*.a"
      ]
      subspec.libraries = 'stdc++', 'z'
    end
    
    spec.subspec 'RTS-Framework' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtsSDK/*.{framework,xcframework}',
      ]
      subspec.libraries = 'stdc++', 'z'
    end

    spec.subspec 'RTS-Framework-VE' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/ByteRtsSDK/*.{framework,xcframework}',
      ]
      subspec.dependency 'VEVideoKit/VolcEngineAudio'
      subspec.dependency 'VEVideoKit/boringssl'
      subspec.libraries = 'stdc++', 'z'
    end
    
    spec.subspec 'LibTTHEIF' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/HEIC/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageDecoder/BDImageDecoder.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageDecoder/BDImageDecoderConfig/BDImageDecoderConfig.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/Util/BDImageDecoderUtil.h'
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/HEIC/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageDecoder/BDImageDecoder.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageDecoder/BDImageDecoderConfig/BDImageDecoderConfig.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/Util/BDImageDecoderUtil.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/libttheif_ios/**/*.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB__DecoderBase_HeifDecoder_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB__SubDecoder_HeifDecoder_ios.a'
      ]
      subspec.dependency 'TTSDK/ImageBase'
      subspec.dependency 'TTSDK/Tools'
      subspec.dependency 'TTSDK/SSL'
      subspec.dependency 'TTSDK/Decode/H266'
    end
    
    spec.subspec 'HeifCore' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/HeifCloudConfig/Public/BDHeifCloudManagerConfig.h'
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/HeifCloudConfig/Public/BDHeifCloudManagerConfig.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_HeifCloudConfig_ios.a'
      ]
      subspec.dependency 'TTSDK/ImageBase'
    end
    
    spec.subspec 'LibYUV' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/libyuv-iOS/**/*.a'
      ]
    end
    
    spec.subspec 'ImageBase' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageMacro.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageError.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/BaseConfig/**/*.h'
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageMacro.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageError.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/AuthorizationConfig/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/BaseConfig/**/*.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_AuthorizationConfig_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_BaseConfig_ios.a',
        # 'TTSDK/BDSword/ios-arch-iphone/*.a',
        'TTSDK/TTImageLicenseToB/ios-arch-iphone/*.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB__Core_HeifCore_ios.a',
      ]
      subspec.dependency 'TTSDK/Model'
      subspec.libraries = "stdc++", "resolv", 'z'
    end
    
    spec.subspec 'Image' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Adapter/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/BDBase/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/CloudConfig/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Cache/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Crypto/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Manager/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Request/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Transform/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageDownloader.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageURLFactory.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageUtil.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/BVC2/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/AVIF/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/BlurHash/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/ImageIO/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/WebP/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageView/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageDecoder/BDImageDecoderFactory/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Download/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Extentions/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/LivePhoto/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Monitor/**/*.h'
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Adapter/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/BDBase/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/BDBase/CloudConfig/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Cache/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Crypto/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Manager/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Request/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Transform/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageDownloader.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageURLFactory.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Core/Public/Utils/BDWebImageUtil.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/BVC2/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/AVIF/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/BlurHash/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/ImageIO/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/WebP/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageView/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Decoder/DecoderBase/Public/BDImageDecoder/BDImageDecoderFactory/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Download/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Extentions/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/LivePhoto/**/*.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Monitor/**/*.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_BDSubBase_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_BlurHash_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_Cache_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_Chromium_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_CloudConfig_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_Core_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_DAV1D_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_DecoderBase_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_Download_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_Extentions_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_ImageIO_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_LivePhoto_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_Monitor_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_SDInterface_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_WebP_ios.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_BVC2_ios.a',
        'TTSDK/BDSword/ios-arch-iphone/*.a'
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/TTNet'
      subspec.dependency 'TTSDK/LibTTHEIF'
      # Third
      subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
      subspec.libraries = "stdc++", "resolv", 'z'
      subspec.dependency 'libwebp', '>= 1.3.2'
      subspec.dependency 'MMKV', '1.2.14'
      subspec.dependency 'MMKVCore', '1.2.14'
      subspec.dependency 'libdav1d', '0.8.0'
      subspec.dependency 'libavif/libdav1d', '0.9.1'
    end

    spec.subspec 'ImageHeifDecoder' do |subspec|
      subspec.dependency 'TTSDK/Tools'
      subspec.dependency 'TTSDK/SSL'
      subspec.dependency 'TTSDK/ImageBase'
      subspec.dependency 'TTSDK/HeifCore'
      subspec.dependency 'TTSDK/LibTTHEIF'
      subspec.dependency 'TTSDK/Core'
      # Third
      subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
      subspec.libraries = "stdc++", "resolv", 'z'
    end

    spec.subspec 'ImageHeifEncoder' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Encoder/HEIC/BDImageHeicEncoder.h',
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Encoder/HEIC/BDImageHeicEncoderMonitor.h'
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/Encoder/**/*.h'
      ]
      subspec.vendored_libraries = [
        'TTSDK/libttheif_enc_ios/**/*.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_SubEncoder_ios.a'
      ]
      subspec.dependency 'TTSDK/ImageBase'
      subspec.dependency 'TTSDK/HeifCore'
      subspec.dependency 'TTSDK/LibYUV'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency "TTSDK/Encode/h265"
      # Third
      subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
      subspec.libraries = "stdc++", "resolv", 'z'
    end
    
    spec.subspec 'ImageExifEditor' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/ExifEditor/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/BDWebImage/Classes/ExifEditor/**/*.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/BDExifEditor/**/*.a',
        'TTSDK/BDWebImageToB/ios-arch-iphone/libBDWebImageToB_ExifEditor_ios.a'
      ]
    end
    
    spec.subspec 'Model' do |subspec|
      subspec.vendored_libraries = [
          'TTSDK/BDModel/ios-arch-iphone/*.a',
      ]
    end
  
    spec.subspec 'Uploader' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      lib_name = "BDVCFileUploadClient"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/Tools'
      subspec.dependency 'TTSDK/SSL'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/Model'
      subspec.dependency 'SSZipArchive', '~> 2.2'
      subspec.libraries = "stdc++", 'z', 'xml2', 'iconv'
      subspec.weak_frameworks = 'Photos', 'UniformTypeIdentifiers'

      subspec.resource_bundles = {
        'TTSDKUploader' => ['TTSDK/BDVCFileUploadClient/zip/PrivacyInfo.xcprivacy']
      }
    end
  
    spec.subspec 'Uploader-VE' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDVCFileUploadClient/**/*.h',
      ]
      lib_name = "BDVCFileUploadClient"
      subspec.vendored_libraries = [
        "TTSDK/{#{lib_name}}/**/*.a"
      ]
      subspec.dependency 'TTSDK/TopSignature'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/VCN'
      subspec.dependency 'TTSDK/Model'
      subspec.dependency 'VEVideoKit/boringssl'
      subspec.dependency 'SSZipArchive', '~> 2.2'
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
      subspec.weak_frameworks = 'Photos', 'UniformTypeIdentifiers'
      subspec.resource_bundles = {
        'TTSDKUploader' => ['TTSDK/BDVCFileUploadClient/zip/PrivacyInfo.xcprivacy']
      }
    end
  
    spec.subspec 'ByteAudio' do |subspec|
      subspec.vendored_frameworks = 'TTSDK/ByteAudio/byteaudio.{framework,xcframework}'
      subspec.dependency 'TTSDK/RealXBase'
      subspec.dependency 'TTSDK/RTCFFmpeg'
    end
    
    spec.subspec 'RealXBase' do |subspec|
      subspec.vendored_frameworks = 'TTSDK/ByteAudio/RealXBase.{framework,xcframework}'
    end

    spec.subspec 'RTCSDK' do |rtc|
      rtc.vendored_frameworks = 'TTSDK/ByteRtcSDK/*RTC.{framework,xcframework}', 'TTSDK/ByteRtcSDK/ByteRTCFFmpegAudioExtension.{framework,xcframework}'
      rtc.dependency 'TTSDK/RTCFFmpeg'
      rtc.dependency 'TTSDK/Encode/h265'
      rtc.dependency 'TTSDK/ByteAudio'
    end

    spec.subspec 'RTCFFmpeg' do |subspec|
      subspec.vendored_frameworks = 'TTSDK/ByteRtcSDK/RTCFFmpeg.{framework,xcframework}'
    end
  
    spec.subspec 'Quic' do |subspec|
      subspec.subspec 'Core' do |core|
        core.vendored_libraries = 'TTSDK/ttquic/ttquic.framework/libttquic.a'
        core.libraries = 'stdc++', 'z'
        core.dependency 'TTSDK/SSL'
        core.dependency 'TTSDK/Core'
      end
      subspec.subspec 'Pull' do |pull|
        pull.vendored_libraries = ['TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_TTQuicWrapper_ios.a']
        pull.dependency 'TTSDK/Quic/Core'
        pull.dependency 'TTSDK/LivePlayer/Normal'
      end
      subspec.subspec 'Push' do |push|
        push.vendored_libraries = ['TTSDK/LiveStreamFramework/ios-arch-iphone/libLiveStreamFramework_rtmpq_ios.a']
        push.dependency 'TTSDK/Quic/Core'
        push.dependency 'TTSDK/LivePush-Lite'
      end
    end
  
    spec.subspec 'Quic-VE' do |subspec|
      subspec.subspec 'Core' do |core|
        core.vendored_libraries = 'TTSDK/ttquic/ttquic.framework/libttquic.a'
        core.libraries = 'stdc++', 'z'
        core.dependency 'VEVideoKit/boringssl'
        core.dependency 'TTSDK/Core'
      end
      subspec.subspec 'Pull' do |pull|
        pull.vendored_libraries = ['TTSDK/LivePlayer/ios-arch-iphone/libLivePlayer_TTQuicWrapper_ios.a']
        pull.dependency 'TTSDK/Quic-VE/Core'
        pull.dependency 'TTSDK/LivePull-Lite-VE'
      end
      subspec.subspec 'Push' do |push|
        push.vendored_libraries = ['TTSDK/LiveStreamFramework/ios-arch-iphone/libLiveStreamFramework_rtmpq_ios.a']
        push.dependency 'TTSDK/Quic-VE/Core'
        push.dependency 'TTSDK/LivePush-Lite-VE'
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

    # MARK: deprecated 
    spec.subspec 'LivePush-RTC' do |subspec|
      subspec.dependency 'TTSDK/LivePush'
    end
    
    spec.subspec 'LivePush-RTC-VE' do |subspec|
      subspec.dependency 'TTSDK/LivePush-VE'
    end
  end
  

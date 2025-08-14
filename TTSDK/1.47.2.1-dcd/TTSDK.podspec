  Pod::Spec.new do |spec|
    spec.name         = "TTSDK"
    spec.version      = "1.47.2.1-dcd"
    spec.summary      = "A comprehensive multimedia SDK."
    spec.description  = <<-DESC
      A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                    DESC
  
    spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"
  
    spec.license      = { :type => 'Copyright', :text => 'Bytedance copyright' }
  
    spec.author       = { "chenzhaojie" => "chenzhaojie@bytedance.com" }
    spec.platform     = :ios, "11.0"
  
    spec.source       = { :http => "https://lf6-vcloud-tos.pstatp.com/obj/cloud-common/ttsdk/iOS/TTSDK-1.47.2.1-premium.zip" }
    
    spec.default_subspecs = 'Core', 'LivePull', 'LivePush', 'Player'
  
    spec.static_framework = true
    
    spec.subspec 'Core' do |subspec|
      subspec.dependency "VCloudPandora/CN", "1.47.2.3.1-binary"
      subspec.dependency "VCloudPandora/Core", "1.47.2.3.1-binary"
      subspec.dependency "VCloudPandora/Player", "1.47.2.3.1-binary"
      subspec.dependency "VCBaseKit", "1.24.2"
    end

    spec.subspec 'BMF' do |subspec|
      subspec.dependency 'TTSDK/Core'
      subspec.dependency "BMFMods", "2.58.1-tob.1.binary"
      subspec.dependency "BMFSDK", "2.1.23.1-binary"
    end
  
    spec.subspec 'Player' do |subspec|
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/BMF'
      subspec.dependency "ABRInterface", "3.0.0"
      subspec.dependency "TTNetworkPredict", "0.5.2"
      subspec.dependency "VCVodSettings",  "1.0.5.1.binary"
      subspec.dependency "PlaylistCacheModule", "1.16.14"
      subspec.dependency "TTVideoEngine/CN", "1.41.200.102-tob-test18.1.binary"
      subspec.dependency "TTVideoEngine/DebugTools", "1.41.200.102-tob-test18.1.binary"
      subspec.dependency "TTVideoEngine/DebugToolToB", "1.41.200.102-tob-test18.1.binary"
      subspec.dependency "VCPreloadStrategy", "1.218.3-tob.1.binary"
      subspec.dependency "VCPreloadStrategy/TOB", "1.218.3-tob.1.binary"
      subspec.dependency "MDLMediaDataLoader/Main", "1.1.218.201-tob-test2" # 非boringssl改符号版本
      subspec.dependency "MDLMediaDataLoader/TTNetDownloader", "1.1.218.201-tob-test2" # 非boringssl改符号版本
      subspec.dependency "TTTopSignature", "0.0.25-tob.1.binary"
      subspec.dependency "TTReachability", "1.10.7"
      subspec.dependency "boringssl", "0.2.2-ttnet3dynamic.1.binary" # 非boringssl改符号版本
      subspec.dependency "lib_h_dec", "2.3.1.1-bugfix"
      subspec.dependency "libbytevc2dec", "0.8.4"
      subspec.dependency "TTPlayerSDK", "2.10.218.100-tob-sr-lls-vc2" # 带H.266版本
      subspec.dependency "BVCParser/Core", "0.9.3-tob.1.binary"
      subspec.dependency "BVCParser/Header", "0.9.3-tob.1.binary"
      subspec.dependency "TTFFmpeg", "1.25.126.201-tob-test13.1.binary" # 非boringssl改符号版本
      subspec.dependency "videoprocessor", "0.218.14-tob.1.binary"
      subspec.dependency "videoprocessor/TOB", "0.218.14-tob.1.binary"
      subspec.dependency "lens", "5.1.12-toblicense.1.binary"
      subspec.dependency 'TTNetworkManager', '4.2.210.20'
      subspec.dependency "VCNVCloudNetwork", "5.6.3-tob-dynamic-volc-test1" # 非boringssl改符号版本
      subspec.dependency 'VolcBaseLog', '2025.0813.1452'
      subspec.dependency 'VolcBaseLogiOS', '1.0.5-tob.1.binary'
      subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
    end
    
    ############ 以下可以重新整理 ##############

    spec.subspec 'Tools' do |subspec| 
      subspec.vendored_libraries = [
        'TTSDK/lib_h_dec/**/*.a'
      ]
      subspec.dependency "lib_h_dec", "2.3.1.1-bugfix"
      subspec.dependency 'TTSDK/SSL'
    end
  
    spec.subspec 'SSL' do |subspec| 
      subspec.dependency "boringssl", "0.2.2-ttnet3dynamic.1.binary"
    end

    spec.subspec 'TTNet' do |subspec|
      subspec.dependency 'TTNetworkManager', '4.2.210.20'
    end
  
    spec.subspec 'VideoProcessor' do |subspec|
      subspec.dependency "videoprocessor", "0.218.14-tob.1.binary"
      subspec.dependency "videoprocessor/TOB", "0.218.14-tob.1.binary"
      subspec.dependency "lens", "5.1.12-toblicense.1.binary"
    end
  
    spec.subspec 'TTFFmpeg' do |subspec|
      subspec.subspec 'Base' do |ss|
        ss.dependency 'TTSDK/Tools'
        ss.dependency "BVCParser/Core", "0.9.3-tob.1.binary"
        ss.dependency "BVCParser/Header", "0.9.3-tob.1.binary"
      end
      subspec.subspec 'Normal' do |ss|
        ss.dependency 'TTSDK/TTFFmpeg/Base'
        ss.dependency "TTFFmpeg", "1.25.126.201-tob-test13.1.binary"
      end

      subspec.subspec 'LiveLite' do |ss|
        ss.dependency 'TTSDK/TTFFmpeg/Base'
        ss.dependency "TTFFmpeg", "1.25.126.201-tob-test13.1.binary"
      end
    end
  
    spec.subspec 'PlayerCore' do |subspec|
      subspec.subspec 'Base' do |ss|
        ss.dependency 'TTSDK/Core'
        ss.dependency 'TTSDK/Tools'
      end

      subspec.subspec 'Normal' do |ss|
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/Normal'
        ss.dependency 'TTSDK/VideoProcessor'
        ss.dependency "TTPlayerSDK", "2.10.218.100-tob-sr-lls"
      end

      subspec.subspec 'H266' do |ss|
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/Normal'
        ss.dependency 'TTSDK/VideoProcessor'
        ss.dependency 'TTSDK/Decode/H266'
        ss.dependency "TTPlayerSDK", "2.10.218.100-tob-sr-lls-vc2"
      end
      
      subspec.subspec 'LiveLite' do |ss|
        ss.dependency 'TTSDK/PlayerCore/Base'
        ss.dependency 'TTSDK/TTFFmpeg/LiveLite'
        ss.dependency "TTPlayerSDK", "2.10.218.100-tob-livelite"
      end

    end
  
    spec.subspec 'LivePlayer' do |subspec|
      subspec.subspec 'Base' do |ss|
        ss.dependency 'TTSDK/Core'
        ss.dependency 'TTSDK/LiveBase'
      end

      subspec.subspec 'Normal' do |ss|
        ss.dependency "LivePlayer", "1.10.218.6-tob"
        ss.dependency 'TTSDK/PlayerCore/Normal'
        ss.dependency 'TTSDK/LivePlayer/Base'
      end

      subspec.subspec 'Lite' do |ss|
        ss.dependency "LivePlayer", "1.10.218.6-tob"
        ss.dependency 'TTSDK/PlayerCore/LiveLite'
        ss.dependency 'TTSDK/LivePlayer/Base'
      end

      subspec.subspec 'BMF' do |ss|
        ss.dependency "LivePlayer", "1.10.218.6-tob"
        ss.dependency 'TTSDK/BMF'
        ss.dependency 'TTSDK/LivePlayer/Normal'
      end

      subspec.subspec 'RTM' do |ss|
        ss.dependency "LivePlayer", "1.10.218.6-tob"
        ss.dependency 'TTSDK/LivePlayer/Normal'
        ss.dependency 'TTSDK/RTS-Framework'
      end

      subspec.subspec 'RTM-Lite' do |ss|
        ss.dependency "LivePlayer", "1.10.218.6-tob"
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

    spec.subspec 'LivePull' do |subspec|
      subspec.dependency 'TTSDK/LivePlayer/Normal'
      subspec.dependency 'TTSDK/LivePlayer/BMF'
      subspec.dependency 'TTSDK/Quic/Pull'
      subspec.dependency 'TTSDK/Strategy/Pull'
    end
    
    spec.subspec 'LiveBase' do |subspec|
      subspec.dependency 'TTSDK/Reachability'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency "VCloudPandora", "1.47.2.3"
      subspec.dependency "VeLiveCommon", "0.0.16"
      subspec.dependency "LiveStreamStrategySDK", "1.10.190.3-tob"
    end

    spec.subspec 'Live-HttpDNS' do |subspec|
      subspec.dependency "VeLiveCommon", "0.0.16"
      subspec.dependency 'TTSDK/HttpDNS'
      subspec.dependency 'TTSDK/LiveBase'
    end

    spec.subspec 'Strategy' do |subspec|
      subspec.subspec 'Core' do |ss|
        ss.dependency 'TTSDK/Reachability'
        ss.dependency 'TTSDK/LiveBase'
      end

      subspec.subspec 'Pull' do |ss|
        ss.dependency 'TTSDK/LivePlayer/Normal'
        ss.dependency 'TTSDK/Strategy/Core'
      end

      subspec.subspec 'Lite' do |ss|
        ss.dependency 'TTSDK/LivePlayer/Lite'
        ss.dependency 'TTSDK/Strategy/Core'
      end
    end
  
    spec.subspec 'LivePull-RTS' do |subspec|
      subspec.dependency 'TTSDK/LivePlayer/RTM'
      subspec.dependency 'TTSDK/LivePull'
      subspec.dependency 'TTSDK/LivePlayer/BMF'
    end

    spec.subspec 'LivePull-RTS-Lite' do |subspec|
      subspec.dependency 'TTSDK/LivePull-Lite'
      subspec.dependency 'TTSDK/LivePlayer/RTM-Lite'
    end
  
    spec.subspec 'LivePush-Lite' do |subspec|
      subspec.dependency "LiveStreamFramework", "15.4.0.67-tob"
      subspec.dependency 'TTSDK/LibYUV'
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/SSL'
      subspec.dependency 'TTSDK/ByteAudio'
      subspec.libraries = 'stdc++', 'z'
      subspec.dependency 'TTSDK/BMF'
      subspec.dependency 'TTSDK/LiveBase'
    end

    spec.subspec 'LivePush' do |subspec|
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency 'TTSDK/Quic/Push'
      subspec.dependency "TTSDK/Encode/h264"
      subspec.dependency "TTSDK/Encode/h265"
    end
  
    spec.subspec 'LivePush-RTMPS' do |subspec|
      subspec.dependency "LiveStreamFramework", "15.4.0.67-tob"
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency 'TTSDK/TTNet'
      subspec.dependency "TTSDK/Encode/h264"
      subspec.dependency "TTSDK/Encode/h265"
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'ScreenCapture' do |subspec|
      subspec.dependency "LiveStreamFramework", "15.4.0.67-tob"
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency 'TTSDK/ScreenCaptureExtension'
    end

    spec.subspec 'ScreenCaptureExtension' do |subspec|
      subspec.dependency "VeLiveReplayKitExtension", "0.0.1.20"
    end

    spec.subspec 'LivePush-RTS' do |subspec|
      subspec.dependency "LiveStreamFramework", "15.4.0.67-tob"
      subspec.dependency 'TTSDK/RTS-Framework'
      subspec.dependency 'TTSDK/LivePush-Lite'
      subspec.dependency "TTSDK/Encode/h264"
      subspec.dependency "TTSDK/Encode/h265"
    end
  
    spec.subspec 'Encode' do |subspec|
      subspec.subspec 'h264' do |ss|
        ss.dependency "libbytevc0enc", "1.6.6.2-alpha.2"
      end
      subspec.subspec 'h265' do |ss|
        ss.dependency "ByteRtcSDK", "3.58.1.29563208"
      end
    end

    spec.subspec 'Decode' do |subspec|
      subspec.subspec 'H266' do |ss|
        ss.dependency "libbytevc2dec", "0.8.1"
      end
    end
    
    

    spec.subspec 'HttpDNS' do |subspec|
      subspec.dependency "BDHTTPDNS", "0.17.5-ios9"
    end

    spec.subspec 'Reachability' do |subspec|
      subspec.dependency "TTReachability", "1.10.7"
    end
  
    spec.subspec 'TopSignature' do |subspec|
      subspec.dependency "TTTopSignature", "0.0.25-tob.1.binary"
    end
    
    spec.subspec 'RTS-Framework' do |subspec|
      subspec.dependency "ByteRtsSDK", "16.1.358.1-tob"
      subspec.dependency 'TTSDK/RealXBase'
      subspec.dependency 'TTSDK/RTCFFmpeg'
      subspec.dependency 'TTSDK/SSL'
    end

    spec.subspec 'ByteAudio' do |subspec|
      subspec.dependency 'TTSDK/RealXBase'
      subspec.dependency 'TTSDK/RTCFFmpeg'
      subspec.dependency "ByteAudio", "3.58.1.29563208"
    end
    
    spec.subspec 'RealXBase' do |subspec|
      subspec.dependency "ByteAudio", "3.58.1.29563208"
    end

    spec.subspec 'RTCSDK' do |rtc|
      rtc.dependency "ByteRtcSDK", "3.58.1.29563208"
      rtc.dependency 'TTSDK/RTCFFmpeg'
      rtc.dependency 'TTSDK/Encode/h265'
      rtc.dependency 'TTSDK/ByteAudio'
    end

    spec.subspec 'RTCFFmpeg' do |subspec|
      subspec.dependency "ByteRtcSDK", "3.58.1.29563208"
    end
  
    spec.subspec 'Quic' do |subspec|
      subspec.subspec 'Core' do |core|
        core.dependency "ttquic", "0.10.13.34-tob"
        core.dependency 'TTSDK/SSL'
        core.dependency 'TTSDK/Core'
      end
      subspec.subspec 'Pull' do |pull|
        pull.dependency 'TTSDK/Quic/Core'
        pull.dependency 'TTSDK/LivePlayer/Normal'
      end
      subspec.subspec 'Push' do |push|
        push.dependency "LiveStreamFramework", "15.4.0.67-tob"
        push.dependency 'TTSDK/Quic/Core'
        push.dependency 'TTSDK/LivePush-Lite'
      end
    end
  end
  

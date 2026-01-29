Pod::Spec.new do |spec|
  spec.name = "TTSDKFramework"
  spec.version = "1.49.1.8-premium"
  spec.summary = "A comprehensive multimedia SDK"
  spec.description = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD, webimage, uploader, and the other related abilities.
                  DESC

  spec.homepage = "https://github.com/volcengine/TTSDK-iOS"

  spec.license      = { :type => 'Copyright', :text => 'Bytedance copyright' }

  spec.author = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform = :ios, "11.0"

  spec.source = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/TTSDKFramework/1.49.1.8-premium/TTSDKFramework-1.49.1.8-premium-ta.zip", :type => :zip }

  spec.default_subspecs = "Base"

  spec.static_framework = true

  spec.module_name = ENV['TTSDK_FRAMEWORK_MODULE_NAME'] || 'TTSDKFramework'
  spec.header_dir = ENV['TTSDK_FRAMEWORK_MODULE_NAME'] || 'TTSDKFramework'
  
  spec.preserve_paths = "TTSDKFramework/**/*.dSYM"

  spec.subspec "Base" do |subspec|
    subspec.dependency 'TTSDKFramework/SSL'
  end

  spec.subspec "Video" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTS'
    subspec.dependency 'TTSDKFramework/LivePull-RTS'
    subspec.dependency 'TTSDKFramework/Image'
    subspec.dependency 'TTSDKFramework/Uploader'
    subspec.dependency 'TTSDKFramework/Player-SR'
  end

  spec.subspec "Player-up" do |subspec|
    subspec.dependency 'TTSDKFramework/Uploader'
    subspec.dependency 'TTSDKFramework/Player-SR'
  end
    
  spec.subspec 'Player' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKPlayer/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKPlayer/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKPlayer/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/PlayerCore/Normal'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.dependency 'TTSDKFramework/TopSignature'
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
    subspec.libraries = 'sqlite3', 'stdc++', 'z'
    subspec.resources = ['TTSDKFramework/TTSDKPlayer/Resources/*.bundle']
  end

  spec.subspec 'PlayerLite' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKPlayer/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKPlayer/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKPlayer/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/PlayerCore/VodLite'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.dependency 'TTSDKFramework/TopSignature'
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
    subspec.libraries = 'sqlite3', 'stdc++', 'z'
    subspec.resources = ['TTSDKFramework/TTSDKPlayer/Resources/*.bundle']
  end

  spec.subspec 'Player-H266' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKPlayerH266/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKPlayerH266/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKPlayerH266/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/PlayerCore/H266'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.dependency 'TTSDKFramework/TopSignature'
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
    subspec.libraries = 'sqlite3', 'stdc++', 'z'
    subspec.resources = ['TTSDKFramework/TTSDKPlayer/Resources/*.bundle']
  end

  spec.subspec 'Player-Quic' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKPlayerQuic/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKPlayerQuic/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKPlayerQuic/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/PlayerCore/Normal'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.dependency 'TTSDKFramework/TopSignature'
    subspec.dependency 'TTSDKFramework/TTNet'
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
    subspec.libraries = 'sqlite3', 'stdc++', 'z'
    subspec.resources = ['TTSDKFramework/TTSDKPlayer/Resources/*.bundle']
  end

  spec.subspec "Push" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush'
  end

  spec.subspec "RtmPush" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTS'
  end

  spec.subspec "BasePull" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePull'
  end

  spec.subspec "Pull" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePull'
    subspec.dependency 'TTSDKFramework/Player-SR'
  end

  spec.subspec "RtmPull" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePull-RTS'
    subspec.dependency 'TTSDKFramework/Player-SR'
  end

  # new spec from static spec
  spec.subspec 'Core' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKCore/Classes/Headers/*.{h,m}", "TTSDKFramework/TTSDKCore/Classes/Sources/*.{h,m}", "TTSDKFramework/*.{h,m}"
    subspec.public_header_files = "TTSDKFramework/TTSDKCore/Classes/Headers/*.h", "TTSDKFramework/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKCore/*.{xcframework,framework}"
    
    unless $DoNotInstallApplogVersion == "6.16.8"
      subspec.dependency 'RangersAppLog/Core', '~> 6.16.8'
      subspec.dependency 'RangersAppLog/Host/CN', '~> 6.16.8'
    end
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'VolcLog' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKVolcLog/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKVolcLog/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKVolcLog/*.{xcframework,framework}"
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'Tools' do |subspec| 
    subspec.source_files = "TTSDKFramework/TTSDKTools/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKTools/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKTools/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/SSL'
  end

  spec.subspec 'SSL' do |subspec| 
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKSSL/*.{xcframework,framework}"
    subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
  end    

  spec.subspec 'VCN' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKVCN/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKVCN/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKVCN/*.{xcframework,framework}"
  end

  spec.subspec 'TTNet' do |subspec|
    subspec.weak_frameworks = ['JavaScriptCore', 'SystemConfiguration']
    subspec.dependency 'TTNetworkManager', '4.2.210.20'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'VideoProcessor' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKVideoProcessor/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKVideoProcessor/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKVideoProcessor/*.{xcframework,framework}"
    subspec.resources = "TTSDKFramework/TTSDKVideoProcessor/Resources/*"
    subspec.weak_frameworks = 'MetalKit', 'CoreMotion'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'TTFFmpeg' do |subspec|
    subspec.subspec 'Normal' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKTTFFmpegNormal/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKTTFFmpegNormal/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKTTFFmpegNormal/*.{xcframework,framework}"
      ss.dependency 'TTSDKFramework/Tools'
      ss.weak_frameworks = ['CoreMotion','CoreMedia','MetalKit','OpenAL','VideoToolBox','AudioToolBox','AVFoundation','SystemConfiguration']
    end
    subspec.subspec 'VodLite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKTTFFmpegVodLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKTTFFmpegVodLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKTTFFmpegVodLite/*.{xcframework,framework}"
      ss.dependency 'TTSDKFramework/Tools'
      ss.weak_frameworks = ['CoreMotion','CoreMedia','MetalKit','OpenAL','VideoToolBox','AudioToolBox','AVFoundation','SystemConfiguration']
    end
    subspec.subspec 'LiveLite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKTTFFmpegLiveLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKTTFFmpegLiveLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKTTFFmpegLiveLite/*.{xcframework,framework}"
      ss.weak_frameworks = ['CoreMotion','CoreMedia','MetalKit','OpenAL','VideoToolBox','AudioToolBox','AVFoundation','SystemConfiguration']
    end
    
  end

  spec.subspec 'PlayerCore' do |subspec|
    subspec.subspec 'Base' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKPlayerCoreBase/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKPlayerCoreBase/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKPlayerCoreBase/*.{xcframework,framework}"
      ss.dependency 'TTSDKFramework/Core'
      ss.libraries = 'z', 'stdc++'
    end
    subspec.subspec 'Normal' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKPlayerCoreNormal/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKPlayerCoreNormal/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKPlayerCoreNormal/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKPlayerCoreNormal/Resources/*"
      ss.dependency 'TTSDKFramework/PlayerCore/Base'
      ss.dependency 'TTSDKFramework/TTFFmpeg/Normal'
      ss.dependency 'TTSDKFramework/VideoProcessor'
      ss.dependency 'TTSDKFramework/Tools'
    end
    subspec.subspec 'H266' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKPlayerCoreH266/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKPlayerCoreH266/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKPlayerCoreH266/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKPlayerCoreH266/Resources/*"
      ss.dependency 'TTSDKFramework/PlayerCore/Base'
      ss.dependency 'TTSDKFramework/TTFFmpeg/Normal'
      ss.dependency 'TTSDKFramework/VideoProcessor'
      ss.dependency 'TTSDKFramework/Decode/H266'
      ss.dependency 'TTSDKFramework/Tools'
    end
    subspec.subspec 'VodLite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKPlayerCoreVodLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKPlayerCoreVodLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKPlayerCoreVodLite/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKPlayerCoreVodLite/Resources/*"
      ss.dependency 'TTSDKFramework/PlayerCore/Base'
      ss.dependency 'TTSDKFramework/TTFFmpeg/Normal'
      ss.dependency 'TTSDKFramework/VideoProcessor'
      ss.dependency 'TTSDKFramework/Tools'
    end
    subspec.subspec 'LiveLite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKPlayerCoreLiveLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKPlayerCoreLiveLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKPlayerCoreLiveLite/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKPlayerCoreLiveLite/Resources/*"
      ss.dependency 'TTSDKFramework/PlayerCore/Base'
      ss.dependency 'TTSDKFramework/TTFFmpeg/LiveLite'
    end
    
  end

  spec.subspec 'BMF' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKBMF/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKBMF/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKBMF/*.{xcframework,framework}"
    subspec.resources = "TTSDKFramework/TTSDKBMF/Resources/*"
    subspec.weak_frameworks = ['MetalPerformanceShaders']
    subspec.dependency 'TTSDKFramework/Core'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'LivePlayer' do |subspec|
    subspec.subspec 'Base' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKLivePlayerBase/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKLivePlayerBase/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKLivePlayerBase/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKLivePlayerBase/Resources/*"
      ss.dependency 'TTSDKFramework/LiveBase'
      ss.dependency 'TTSDKFramework/Reachability'
      ss.dependency 'TTSDKFramework/Core'
      ss.dependency 'TTSDKFramework/LivePull-VolcLog'
      ss.weak_frameworks = ['MetalPerformanceShaders', 'AVFoundation', 'CoreMedia', 'AudioToolBox', 'VideoToolBox', 'CoreTelephony', 'SystemConfiguration', 'CoreML']
      ss.libraries = 'stdc++'
    end
    subspec.subspec 'Lite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKLivePlayerLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKLivePlayerLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKLivePlayerLite/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKLivePlayerLite/Resources/*"
      ss.dependency 'TTSDKFramework/PlayerCore/LiveLite'
      ss.dependency 'TTSDKFramework/LivePlayer/Base'
    end
    subspec.subspec 'Normal' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKLivePlayerNormal/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKLivePlayerNormal/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKLivePlayerNormal/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKLivePlayerNormal/Resources/*"
      ss.dependency 'TTSDKFramework/PlayerCore/Normal'
      ss.dependency 'TTSDKFramework/LivePlayer/Base'
    end
    subspec.subspec 'RTM' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKLivePlayerRTM/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKLivePlayerRTM/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKLivePlayerRTM/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKLivePlayerRTM/Resources/*"
      ss.dependency 'TTSDKFramework/LivePlayer/Normal'
      ss.dependency 'TTSDKFramework/RTS-Framework'
    end
    subspec.subspec 'RTM-Lite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKLivePlayerRTMLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKLivePlayerRTMLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKLivePlayerRTMLite/*.{xcframework,framework}"
      ss.resources = "TTSDKFramework/TTSDKLivePlayerRTMLite/Resources/*"
      ss.dependency 'TTSDKFramework/LivePlayer/Lite'
      ss.dependency 'TTSDKFramework/RTS-Framework'
    end
  end

  spec.subspec 'LivePull-Lite' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePullLite/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePullLite/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePullLite/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Strategy/Lite'
    subspec.dependency 'TTSDKFramework/LivePlayer/Lite'
  end

  spec.subspec 'LivePull-VolcLog' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePullVolcLog/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePullVolcLog/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePullVolcLog/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/VolcLog'
  end

  spec.subspec 'LivePull-BMF' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePlayerBMF/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePlayerBMF/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePlayerBMF/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/BMF'
  end
  
  spec.subspec 'LivePull' do |subspec|
    subspec.dependency 'TTSDKFramework/Quic/Pull'
    subspec.dependency 'TTSDKFramework/Strategy/Pull'
    subspec.dependency 'TTSDKFramework/LivePull-BMF'
    subspec.dependency 'TTSDKFramework/LivePlayer/Normal'
  end
  
  spec.subspec 'LiveBase' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLiveBase/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLiveBase/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLiveBase/*.{xcframework,framework}"
    subspec.resources = ['TTSDKFramework/TTSDKLiveBase/Resources/*.bundle']
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'Live-HttpDNS' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLiveHttpDNS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLiveHttpDNS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLiveHttpDNS/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/HttpDNS'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'LivePull-RTS-Lite' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePullRTSLite/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePullRTSLite/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePullRTSLite/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/LivePull-Lite'
    subspec.dependency 'TTSDKFramework/LivePlayer/RTM-Lite'
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'LivePull-RTS' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePullRTS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePullRTS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePullRTS/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/LivePull'
    subspec.dependency 'TTSDKFramework/LivePlayer/RTM'
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'LivePush-RTMPS' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePushRTMPS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePushRTMPS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePushRTMPS/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/TTNet'
    subspec.dependency 'TTSDKFramework/LivePush-Lite'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'LivePush-Lite' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePushLite/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePushLite/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePushLite/*.{xcframework,framework}"
    subspec.weak_frameworks = ['VideoToolBox','AudioToolBox','CoreMotion','CoreMedia','AVFoundation','SystemConfiguration','GLKit','ImageIO','MetalPerformanceShaders','Accelerate']
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/SSL'
    subspec.dependency 'TTSDKFramework/ByteAudio'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.dependency 'TTSDKFramework/LiveBase'
    subspec.libraries = 'stdc++', 'z'
  end
  
  spec.subspec 'LivePush' do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-Lite'
    subspec.dependency 'TTSDKFramework/Quic/Push'
    subspec.dependency 'TTSDKFramework/LivePush-RTMPS'
    subspec.dependency 'TTSDKFramework/ScreenCapture'
    subspec.dependency "TTSDKFramework/Encode/h264"
    subspec.dependency "TTSDKFramework/Encode/h265"
  end

  spec.subspec 'LivePush-RTS-Lite' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePushRTS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePushRTS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePushRTS/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/RTS-Framework'
    subspec.dependency 'TTSDKFramework/LivePush-Lite'
    subspec.dependency "TTSDKFramework/Encode/h264"
    subspec.dependency "TTSDKFramework/Encode/h265"
  end

  spec.subspec 'LivePush-RTS' do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTS-Lite'
    subspec.dependency 'TTSDKFramework/Quic/Push'
    subspec.dependency 'TTSDKFramework/LivePush-RTMPS'
    subspec.dependency 'TTSDKFramework/ScreenCapture'
  end

  spec.subspec 'Encode' do |subspec|
    subspec.subspec 'h264' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKEncodeh264/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKEncodeh264/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKEncodeh264/*.{xcframework,framework}"
    end
    subspec.subspec 'h265' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKEncodeh265/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKEncodeh265/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKEncodeh265/*.{xcframework,framework}"
    end
  end

  spec.subspec 'Decode' do |subspec|
    subspec.subspec 'H266' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKDecodeH266/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKDecodeH266/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKDecodeH266/*.{xcframework,framework}"
    end
  end

  # Support Super Resolution
  spec.subspec 'Player-SR' do |subspec| 
    subspec.dependency 'TTSDKFramework/Player'
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.weak_frameworks = ['CoreML']
  end

  spec.subspec 'PlayerLite-SR' do |subspec| 
    subspec.dependency 'TTSDKFramework/PlayerLite'
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.weak_frameworks = ['CoreML']
  end

  spec.subspec 'Player-SR-H266' do |subspec| 
    subspec.dependency 'TTSDKFramework/Player-H266'
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.weak_frameworks = ['CoreML']
  end

  spec.subspec 'RTS-Framework' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKRTSFramework/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKRTSFramework/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKRTSFramework/*.{xcframework,framework}"
  end
  
  spec.subspec 'LibTTHEIF' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLibTTHEIF/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLibTTHEIF/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLibTTHEIF/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/ImageBase'
    subspec.dependency 'TTSDKFramework/Tools'
    subspec.dependency 'TTSDKFramework/Decode/H266'
  end
  
  spec.subspec 'HeifCore' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKHeifCore/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKHeifCore/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKHeifCore/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/ImageBase'
  end
  
  spec.subspec 'ImageBase' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKImageBase/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKImageBase/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKImageBase/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Model'
  end
  
  spec.subspec 'Image' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKImage/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKImage/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKImage/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/LibTTHEIF'
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/TTNet'
    subspec.dependency 'TTSDKFramework/Tools'
    # Third
    subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
    subspec.libraries = "stdc++", "resolv"
    subspec.dependency 'libwebp', '>= 1.3.2'
    subspec.dependency 'MMKV', '1.2.14'
    subspec.dependency 'MMKVCore', '1.2.14'
    subspec.dependency 'libdav1d', '0.8.0'
    subspec.dependency 'libavif/libdav1d', '0.9.1'
  end
  
  spec.subspec 'ImageHeifDecoder' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKImageHeifDecoder/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKImageHeifDecoder/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKImageHeifDecoder/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/LibTTHEIF'
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/HeifCore'
    subspec.dependency 'TTSDKFramework/Tools'
    # Third
    subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
    subspec.libraries = "stdc++", "resolv"
  end
  
  spec.subspec 'ImageHeifEncoder' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKImageHeifEncoder/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKImageHeifEncoder/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKImageHeifEncoder/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/HeifCore'
    subspec.dependency "TTSDKFramework/Encode/h265"
    # Third
    subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
    subspec.libraries = "stdc++", "resolv"
  end
  
  spec.subspec 'ImageExifEditor' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKImageExifEditor/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKImageExifEditor/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKImageExifEditor/*.{xcframework,framework}"
  end
  
  spec.subspec 'Model' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKModel/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKModel/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKModel/*.{xcframework,framework}"
  end

  spec.subspec 'Uploader' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKUploader/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKUploader/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKUploader/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/Tools'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/TopSignature'
    subspec.dependency 'TTSDKFramework/Model'
    subspec.dependency 'SSZipArchive', '~> 2.2'
    
    subspec.libraries = "stdc++", 'z', 'xml2', 'iconv'
    subspec.weak_frameworks = 'Photos', 'UniformTypeIdentifiers'
    subspec.resources = ['TTSDKFramework/TTSDKUploader/Resources/*.bundle']
  end

  spec.subspec 'ByteAudio' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKByteAudio/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKByteAudio/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKByteAudio/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/RealXBase'
    subspec.dependency 'TTSDKFramework/RTCFFmpeg'
  end

  spec.subspec 'RealXBase' do |subspec|
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKRealXBase/*.{xcframework,framework}"
  end

  spec.subspec 'RTCSDK' do |subspec|
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKRTCSDK/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/RTCFFmpeg'
    subspec.dependency 'TTSDKFramework/Encode/h265'
    subspec.dependency 'TTSDKFramework/ByteAudio'
  end

  spec.subspec 'RTCFFmpeg' do |subspec|
    subspec.vendored_frameworks = 'TTSDKFramework/TTSDKRTCFFmpeg/*.{framework,xcframework}'
  end

  spec.subspec 'Quic' do |subspec|
    subspec.subspec 'Core' do |core|
      core.source_files = "TTSDKFramework/TTSDKQuicCore/Classes/Headers/*.h"
      core.public_header_files = "TTSDKFramework/TTSDKQuicCore/Classes/Headers/*.h"
      core.vendored_frameworks = "TTSDKFramework/TTSDKQuicCore/*.{xcframework,framework}"
      core.dependency 'TTSDKFramework/SSL'
      core.dependency 'TTSDKFramework/Core'
      core.libraries = 'stdc++', 'z'
    end
    subspec.subspec 'Pull' do |pull|
      pull.source_files = "TTSDKFramework/TTSDKQuicPull/Classes/Headers/*.h"
      pull.public_header_files = "TTSDKFramework/TTSDKQuicPull/Classes/Headers/*.h"
      pull.vendored_frameworks = "TTSDKFramework/TTSDKQuicPull/*.{xcframework,framework}"
      pull.dependency 'TTSDKFramework/Quic/Core'
    end
    subspec.subspec 'Push' do |push|
      push.source_files = "TTSDKFramework/TTSDKQuicPush/Classes/Headers/*.h"
      push.public_header_files = "TTSDKFramework/TTSDKQuicPush/Classes/Headers/*.h"
      push.vendored_frameworks = "TTSDKFramework/TTSDKQuicPush/*.{xcframework,framework}"
      push.dependency 'TTSDKFramework/Quic/Core'
      push.dependency 'TTSDKFramework/LivePush-Lite'
    end
  end
  
  spec.subspec 'Reachability' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKReachability/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKReachability/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKReachability/*.{xcframework,framework}"
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony', 'SystemConfiguration']
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'HttpDNS' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKHttpDNS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKHttpDNS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKHttpDNS/*.{xcframework,framework}"
    subspec.weak_frameworks = ['CoreTelephony', 'SystemConfiguration']
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'TopSignature' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKTopSignature/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKTopSignature/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKTopSignature/*.{xcframework,framework}"
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'ScreenCapture' do |subspec|
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKScreenCapture/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/LivePush-Lite'
    subspec.dependency 'TTSDKFramework/ScreenCaptureExtension'
  end

  spec.subspec 'ScreenCaptureExtension' do |subspec|
    subspec.weak_frameworks = 'ReplayKit'
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKScreenCaptureExtension/*.{xcframework,framework}"
  end

  spec.subspec 'Strategy' do |subspec|
    subspec.subspec 'Core' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKStrategyCore/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKStrategyCore/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKStrategyCore/*.{xcframework,framework}"
      ss.dependency 'TTSDKFramework/Reachability'
      ss.dependency 'TTSDKFramework/LiveBase'
    end
    subspec.subspec 'Pull' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKStrategyPull/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKStrategyPull/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKStrategyPull/*.{xcframework,framework}"
      ss.dependency 'TTSDKFramework/LivePlayer/Normal'
      ss.dependency 'TTSDKFramework/Strategy/Core'
    end
    subspec.subspec 'Lite' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKStrategyLite/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKStrategyLite/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKStrategyLite/*.{xcframework,framework}"
      ss.dependency 'TTSDKFramework/LivePlayer/Lite'
      ss.dependency 'TTSDKFramework/Strategy/Core'
    end
  end

  # MARK: deprecated
  spec.subspec 'LivePush-RTC' do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush'
  end
end

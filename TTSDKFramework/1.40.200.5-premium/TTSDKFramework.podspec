Pod::Spec.new do |spec|
  spec.name = "TTSDKFramework"
  spec.version = "1.40.200.5-premium"
  spec.summary = "A comprehensive multimedia SDK"
  spec.description = <<-DESC
    A comprehensive multimedia SDK which provides live streaming, VOD, webimage, uploader, and the other related abilities.
                  DESC

  spec.homepage = "https://github.com/volcengine/TTSDK-iOS"

  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.author = { "shangjincheng-bd" => "shangjincheng@bytedance.com" }
  spec.platform = :ios, "11.0"

  spec.source = { :http => "https://lf16-bpsdk.bytepluscdn.com/obj/byteplussdk-sg/TTSDKFramework/1.40.200.5-premium/TTSDKFramework-1.40.200.5-premium-ta.zip", :type => :zip }

  spec.default_subspecs = "Base"

  spec.static_framework = true

  spec.module_name = ENV['TTSDK_FRAMEWORK_MODULE_NAME'] || 'TTSDKFramework'
  spec.header_dir = ENV['TTSDK_FRAMEWORK_MODULE_NAME'] || 'TTSDKFramework'

  spec.subspec "Base" do |subspec|
    subspec.dependency 'TTSDKFramework/SSL'
  end

  spec.subspec "Video" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTS'
    subspec.dependency 'TTSDKFramework/LivePull-RTS'
    subspec.dependency 'TTSDKFramework/Image'
    subspec.dependency 'TTSDKFramework/Uploader'
    subspec.dependency 'TTSDKFramework/Player-SR'
    subspec.dependency "TTSDKFramework/ScreenCaptureExtension"
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
    subspec.dependency 'TTSDKFramework/PlayerCore'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.dependency 'TTSDKFramework/TopSignature'
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony']
    subspec.libraries = 'sqlite3', 'stdc++', 'z'
  end
  
  spec.subspec "Push" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTC'
    subspec.dependency "TTSDKFramework/ScreenCaptureExtension"
  end

  spec.subspec "RtmPush" do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTS'
    subspec.dependency "TTSDKFramework/ScreenCaptureExtension"
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
    subspec.source_files = "TTSDKFramework/TTSDKCore/Classes/Headers/*.h", "TTSDKFramework/*.{h,m}"
    subspec.public_header_files = "TTSDKFramework/TTSDKCore/Classes/Headers/*.h", "TTSDKFramework/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKCore/*.{xcframework,framework}"
    
    unless $DoNotInstallApplogVersion == "6.15.1"
      subspec.dependency 'RangersAppLog/Core', '~> 6.15.1'
      subspec.dependency 'RangersAppLog/Host/SG', '~> 6.15.1'
    end
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'VolcLog' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKVolcLog/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKVolcLog/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKVolcLog/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/SSL'
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
    subspec.source_files = "TTSDKFramework/TTSDKTTNet/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKTTNet/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKTTNet/*.{xcframework,framework}"
    subspec.weak_frameworks = ['JavaScriptCore', 'SystemConfiguration']
    subspec.dependency 'TTSDKFramework/SSL'
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
    subspec.source_files = "TTSDKFramework/TTSDKTTFFmpeg/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKTTFFmpeg/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKTTFFmpeg/*.{xcframework,framework}"
    subspec.weak_frameworks = ['CoreMotion','CoreMedia','MetalKit','OpenAL','VideoToolBox','AudioToolBox','AVFoundation','SystemConfiguration']
    subspec.dependency 'TTSDKFramework/Tools'
  end

  spec.subspec 'PlayerCore' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKPlayerCore/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKPlayerCore/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKPlayerCore/*.{xcframework,framework}"
    subspec.resources = "TTSDKFramework/TTSDKPlayerCore/Resources/*"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/TTFFmpeg'
    subspec.dependency 'TTSDKFramework/VideoProcessor'
    subspec.dependency 'TTSDKFramework/Tools'
    subspec.libraries = 'z', 'stdc++'
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

  spec.subspec 'LivePull' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePull/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePull/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePull/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Reachability'
    subspec.dependency 'TTSDKFramework/LiveSettings'
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/PlayerCore'
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Quic/Pull'
    subspec.dependency 'TTSDKFramework/LiveBase'
    subspec.weak_frameworks = ['MetalPerformanceShaders', 'AVFoundation', 'CoreMedia', 'AudioToolBox', 'VideoToolBox', 'CoreTelephony', 'SystemConfiguration', 'CoreML']
    subspec.libraries = 'stdc++'
  end
  
  spec.subspec 'LiveBase' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLiveBase/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLiveBase/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLiveBase/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.libraries = 'stdc++'
  end

  spec.subspec 'LivePull-RTS' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePullRTS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePullRTS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePullRTS/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/ByteAudio'
    subspec.dependency 'TTSDKFramework/LivePull'
    subspec.dependency 'TTSDKFramework/RTS-Framework'
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'LivePush-Base' do |subspec|
    subspec.weak_frameworks = ['VideoToolBox','AudioToolBox','CoreMotion','CoreMedia','AVFoundation','SystemConfiguration','GLKit','ImageIO','MetalPerformanceShaders','Accelerate']
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/TTFFmpeg'
    subspec.dependency 'TTSDKFramework/SSL'
    subspec.dependency 'TTSDKFramework/LiveSettings'
    subspec.dependency 'TTSDKFramework/ByteAudio'
    subspec.dependency 'TTSDKFramework/VolcLog'
    subspec.dependency 'TTSDKFramework/Quic/Push'
    if ENV['TT_VIDEO_EDITOR_VERSION'].nil?
      subspec.dependency 'TTVideoEditor', '11.8.1.83-D'
    else
      subspec.dependency 'TTVideoEditor', "#{ENV['TT_VIDEO_EDITOR_VERSION']}"
    end
    subspec.dependency "TTSDKFramework/Encode/vc0"
    subspec.dependency "TTSDKFramework/Encode/vc1"
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.dependency 'TTSDKFramework/LiveBase'
    subspec.libraries = 'stdc++', 'z'
  end
  
  spec.subspec 'LivePush-RTC' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePushRTC/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePushRTC/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePushRTC/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/LivePush-Base'
  end

  spec.subspec 'LivePush-RTMPS' do |subspec|
    subspec.dependency 'TTSDKFramework/TTNet'
    subspec.libraries = 'stdc++'
  end
  
  spec.subspec 'LivePush' do |subspec|
    subspec.dependency 'TTSDKFramework/LivePush-RTC'
  end

  spec.subspec 'LivePush-RTS' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLivePushRTS/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLivePushRTS/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLivePushRTS/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/RTS-Framework'
    subspec.dependency 'TTSDKFramework/LivePush-Base'
  end

  spec.subspec 'Encode' do |subspec|
    subspec.subspec 'vc0' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKEncodevc0/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKEncodevc0/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKEncodevc0/*.{xcframework,framework}"
    end
    subspec.subspec 'vc1' do |ss|
      ss.source_files = "TTSDKFramework/TTSDKEncodevc1/Classes/Headers/*.h"
      ss.public_header_files = "TTSDKFramework/TTSDKEncodevc1/Classes/Headers/*.h"
      ss.vendored_frameworks = "TTSDKFramework/TTSDKEncodevc1/*.{xcframework,framework}"
    end
  end

  spec.subspec 'LiveSettings' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKLiveSettings/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKLiveSettings/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKLiveSettings/*.{xcframework,framework}"
  end

  # Support Super Resolution
  spec.subspec 'Player-SR' do |subspec| 
    subspec.dependency 'TTSDKFramework/Player'
    subspec.dependency 'TTSDKFramework/BMF'
    subspec.weak_frameworks = ['CoreML']
  end
  
  spec.subspec 'RTC-Framework' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKRTCFramework/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKRTCFramework/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKRTCFramework/*.{xcframework,framework}"
  end

  spec.subspec 'RTS-Framework' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKRTSFramework/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKRTSFramework/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKRTSFramework/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/RTC-Framework'
  end
  
  spec.subspec 'Image' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKImage/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKImage/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKImage/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/TTNet'
    subspec.dependency 'TTSDKFramework/Tools'
    # Third
    subspec.weak_frameworks = 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration', 'JavaScriptCore', 'Accelerate'
    subspec.libraries = "stdc++", "resolv"
    
    if !ENV['TTSDK_USE_INNER_THIRD'].nil? && ENV['TTSDK_USE_INNER_THIRD'] == '0'
      subspec.vendored_frameworks = "TTSDKFramework/TTSDKImage/TT*.{xcframework,framework}"
      subspec.exclude_files = "TTSDKFramework/TTSDKImage/{libwebp,MMKV,libdav1d,libavif}.{xcframework,framework}"
      subspec.dependency 'libwebp', '>= 1.3.2'
      subspec.dependency 'MMKV', '1.2.14'
      subspec.dependency 'libdav1d', '0.8.0'
      subspec.dependency 'libavif/libdav1d', '0.9.1'
    end
  end

  spec.subspec 'Uploader' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKUploader/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKUploader/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKUploader/*.{xcframework,framework}"
    subspec.dependency 'TTSDKFramework/Core'
    subspec.dependency 'TTSDKFramework/Tools'
    subspec.dependency 'TTSDKFramework/VCN'
    subspec.dependency 'TTSDKFramework/TopSignature'

    if !ENV['TTSDK_USE_INNER_THIRD'].nil? && ENV['TTSDK_USE_INNER_THIRD'] == '0'
      subspec.vendored_frameworks = "TTSDKFramework/TTSDKUploader/TT*.{xcframework,framework}"
      subspec.exclude_files = "TTSDKFramework/TTSDKUploader/SSZipArchive.{xcframework,framework}"
      subspec.dependency 'SSZipArchive', '~> 3.0.0'
    end
    
    subspec.libraries = "stdc++", 'z', 'xml2', 'iconv'
    subspec.weak_frameworks = 'Photos', 'UniformTypeIdentifiers'
  end

  spec.subspec 'ByteAudio' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKByteAudio/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKByteAudio/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKByteAudio/*.{xcframework,framework}"
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
      pull.dependency 'TTSDKFramework/Quic/Core'
    end
    subspec.subspec 'Push' do |push|
      push.dependency 'TTSDKFramework/Quic/Core'
    end
  end
  
  spec.subspec 'Reachability' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKReachability/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKReachability/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKReachability/*.{xcframework,framework}"
    subspec.weak_frameworks = ['MetricKit', 'CoreTelephony', 'SystemConfiguration']
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'TopSignature' do |subspec|
    subspec.source_files = "TTSDKFramework/TTSDKTopSignature/Classes/Headers/*.h"
    subspec.public_header_files = "TTSDKFramework/TTSDKTopSignature/Classes/Headers/*.h"
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKTopSignature/*.{xcframework,framework}"
    subspec.libraries = 'stdc++', 'z'
  end

  spec.subspec 'ScreenCaptureExtension' do |subspec|
    subspec.weak_frameworks = 'ReplayKit'
    subspec.vendored_frameworks = "TTSDKFramework/TTSDKScreenCaptureExtension/*.{xcframework,framework}"
  end
end

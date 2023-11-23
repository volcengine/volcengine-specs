Pod::Spec.new do |spec|
  spec.name = "veVOS"
  spec.version = "2.11.2"
  spec.summary = "Video in One Solution development kits base on Volcano Engine"
  spec.homepage = "https://www.volcengine.com/solutions/vevos"
  spec.license = { :type => "Copyright", :text => "Bytedance copyright" }
  spec.author = { "VolcanoEngine Service" => "service@volcengine.com" }
  spec.platform = :ios
  spec.platform = :ios, "9.0"
  spec.source = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/VEVideoKit/0.3.2/VEVideoKit.framework.tar.xz" }
  spec.requires_arc = true

  vevideokitversion = "0.3.6"
  ttversion = "1.39.3.9-onekit"
  ffmpegversion = "1.25.136.101-tob-dynamic-biz"

  spec.subspec "RTC" do |rtc|
    rtc.dependency "VolcEngineRTC-VE", "3.52.155"
    rtc.dependency "VEVideoKit/VolcEngineAudio", "#{vevideokitversion}"
  end

  spec.subspec "VOD" do |vod|
    vod.dependency "TTSDK/Player-VE", "#{ttversion}"
    vod.dependency "TTFFmpeg", "#{ffmpegversion}"
    vod.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
  end

  spec.subspec "LivePull" do |pull|
    pull.dependency "TTSDK/LivePull-RTS-VE", "#{ttversion}"
    pull.dependency "TTSDK/Quic/Pull", "#{ttversion}"
    pull.dependency "TTFFmpeg", "#{ffmpegversion}"
    pull.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
    pull.dependency "veVOS/RTC"
  end

  spec.subspec "LivePush" do |push|
    push.dependency "TTSDK/LivePush-RTS-VE", "#{ttversion}"
    push.dependency "TTSDK/Effect", "#{ttversion}"
    push.dependency "TTSDK/Quic/Push", "#{ttversion}"
    push.dependency "TTFFmpeg", "#{ffmpegversion}"
    push.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
    push.dependency "veVOS/RTC"
    push.dependency "TTVideoEditor", "11.8.3.1-VE"
  end
  
  spec.subspec "CK" do |ck|
    ck.dependency "TTVideoEditor", "11.8.3.1-VE"
    ck.dependency "TTFFmpeg", "#{ffmpegversion}"
    ck.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
  end

  spec.subspec "CV" do |cv|
    cv.dependency "EffectSDK_iOS_TOB", "11.6.0-VE-STB"
  end

  spec.subspec "Uploader" do |uploader|
    uploader.dependency "TTSDK/Uploader-VE", "#{ttversion}"
    uploader.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
  end

  spec.subspec "Sami" do |sami|
    sami.dependency "AudioSdkTob", "5.0.7-alpha.1-tobonekit"
    sami.dependency "VEVideoKit/TTNetworkManager", "#{vevideokitversion}"
  end
end

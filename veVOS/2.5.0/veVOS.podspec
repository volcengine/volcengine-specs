Pod::Spec.new do |spec|
  spec.name         = "veVOS"
  spec.version      = "2.5.0"
  spec.summary      = "Video in One Solution development kits base on Volcano Engine"
  spec.homepage     = "https://www.volcengine.com/solutions/vevos"
  spec.license      = { :type => "Copyright", :text => "Bytedance copyright" }
  spec.author       = { "VolcanoEngine Service" => "service@volcengine.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "9.0"
  spec.source       = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/VEVideoKit/0.3.0/VEVideoKit.framework.tar.xz"}
  spec.requires_arc = true

  spec.default_subspec = "Core"

  coreversion = "0.3.0"
  ttversion = "1.33.2.2-premium"
  ffmpegversion = "1.25.98.115-tob-dynamic-biz"

  spec.subspec "Core" do |core|
    core.dependency "VEVideoKit/boringssl", "#{coreversion}"
    core.dependency "VEVideoKit/VolcEngineAudio", "#{coreversion}"
    core.dependency "VEVideoKit/TTNetworkManager", "#{coreversion}"
    core.dependency "TTFFmpeg", "#{ffmpegversion}"
  end

  spec.subspec "VOD" do |vod|
    vod.dependency "TTSDK/Player-VE", "#{ttversion}"
    vod.dependency "veVOS/Core"
  end

  spec.subspec "LivePull" do |pull|
    pull.dependency "TTSDK/LivePull-RTS-VE", "#{ttversion}"
    pull.dependency "TTSDK/Quic/Pull", "#{ttversion}"
    pull.dependency "veVOS/Core"
  end

  spec.subspec "LivePush" do |push|
    push.dependency "TTSDK/LivePush-RTS-VE", "#{ttversion}"
    push.dependency "TTSDK/Effect", "#{ttversion}"
    push.dependency "TTSDK/Quic/Push", "#{ttversion}"
    push.dependency "veVOS/Core"
  end

  spec.subspec "CK" do |ck|
    ck.dependency "TTVideoEditor", "11.3.1.5-VE"
    ck.dependency "veVOS/Core"
  end

  spec.subspec "RTC" do |rtc| 
    rtc.dependency "VolcEngineRTC-VE", "3.39.153"
    rtc.dependency "veVOS/Core"
  end

  spec.subspec "CV" do |cv| 
    cv.dependency "EffectSDK_iOS_TOB", "10.6.10.2-VE"
    cv.dependency "veVOS/Core"
  end

end

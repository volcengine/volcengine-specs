Pod::Spec.new do |spec|
  spec.name = "veVOS"
  spec.version = "2.14.0"
  spec.summary = "Video in One Solution development kits base on Volcano Engine"
  spec.homepage = "https://www.volcengine.com/solutions/vevos"
  spec.license = { :type => "Copyright", :text => "Bytedance copyright" }
  spec.author = { "VolcanoEngine Service" => "service@volcengine.com" }
  spec.platform = :ios
  spec.platform = :ios, "9.0"
  spec.source = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/VEVideoKit/0.3.8/VEVideoKit.framework.tar.xz" }
  spec.requires_arc = true

  vevideokitversion = "0.3.8"
  ttversion = "1.41.3.500-premium"
  ffmpegversion = "1.25.146.601-tob-biz"
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
    pull.dependency "TTSDK/Quic-VE/Pull", "#{ttversion}"
    pull.dependency "TTFFmpeg", "#{ffmpegversion}"
    pull.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
    pull.dependency "veVOS/RTC"
  end

  spec.subspec "LivePush" do |push|
    push.dependency "TTSDK/LivePush-RTS-VE", "#{ttversion}"
    push.dependency "TTSDK/Effect-VE", "#{ttversion}"
    push.dependency "TTSDK/Quic-VE/Push", "#{ttversion}"
    push.dependency "TTFFmpeg", "#{ffmpegversion}"
    push.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
    push.dependency "veVOS/RTC"
    push.dependency "TTVideoEditor", "11.8.1.83-D"
  end
  
  spec.subspec "Uploader" do |uploader|
    uploader.dependency "TTSDK/Uploader-VE", "#{ttversion}"
    uploader.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
  end

  spec.subspec "IM" do |im|
    im.dependency 'imsdk-tob/Core_VE', '1.15.0'
    im.dependency 'im-uikit-tob/VE', '1.15.0'
  end
  
  spec.subspec "CV" do |cv|
    cv.dependency "EffectSDK_iOS_TOB", "11.6.0.1-VE-STB-dynamic"
  end
end

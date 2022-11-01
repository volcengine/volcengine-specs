Pod::Spec.new do |spec|
  spec.name         = "veVOS"
  spec.version      = "2.4.0"
  spec.summary      = "Video in One Solution development kits base on Volcano Engine"
  spec.homepage     = "https://www.volcengine.com/solutions/vevos"
  spec.license      = { :type => "Copyright", :text => "Bytedance copyright" }
  spec.author             = { "VolcanoEngine Service" => "service@volcengine.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "9.0"
  spec.source       = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/VEVideoKit/0.3.0/VEVideoKit.framework.tar.xz"}
  spec.requires_arc = true

  spec.default_subspec = "Core"

  spec.subspec "Core" do |core|
    coreversion = "0.3.0"
    core.dependency "VEVideoKit/boringssl", "#{coreversion}"
    core.dependency "VEVideoKit/VolcEngineAudio", "#{coreversion}"
    core.dependency "VEVideoKit/TTNetworkManager", "#{coreversion}"
  end

  spec.subspec "TT" do |tt|
    ttversion = "1.32.2.2-premium"
    tt.dependency "TTSDK/Player-VE", "#{ttversion}"
    tt.dependency "TTSDK/LivePull-RTS-VE", "#{ttversion}"
    tt.dependency "TTSDK/LivePush-Effect-VE", "#{ttversion}"
    tt.dependency "veVOS/Core"
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

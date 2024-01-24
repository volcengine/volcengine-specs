Pod::Spec.new do |spec|
  spec.name = "veVOS"
  spec.version = "2.11.4"
  spec.summary = "Video in One Solution development kits base on Volcano Engine"
  spec.homepage = "https://www.volcengine.com/solutions/vevos"
  spec.license = { :type => "Copyright", :text => "Bytedance copyright" }
  spec.author = { "VolcanoEngine Service" => "service@volcengine.com" }
  spec.platform = :ios
  spec.platform = :ios, "9.0"
  spec.source = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/VEVideoKit/0.3.2/VEVideoKit.framework.tar.xz" }
  spec.requires_arc = true

  vevideokitversion = "0.3.6"
  ttversion = "1.39.3.12-premium"
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

  spec.subspec "Uploader" do |uploader|
    uploader.dependency "TTSDK/Uploader-VE", "#{ttversion}"
    uploader.dependency "VEVideoKit/boringssl", "#{vevideokitversion}"
  end

  spec.subspec "Sami" do |sami|
    sami.dependency "AudioSdkTob", "5.0.7-alpha.1-tobonekit"
    sami.dependency "VEVideoKit/TTNetworkManager", "#{vevideokitversion}"
  end
  spec.subspec "CV" do |cv|
    cv.dependency "EffectSDK_iOS_TOB", "11.6.0-VE-STB"
    be_effect_symbols = <<EOF
-Wl,-u,_bef_effect_ai_get_version
-Wl,-u,_bef_effect_ai_check_license
-Wl,-u,_bef_effect_ai_check_license_buffer
-Wl,-u,_bef_effect_ai_create
-Wl,-u,_bef_effect_ai_destroy
-Wl,-u,_bef_effect_ai_init
-Wl,-u,_bef_effect_ai_use_pipeline_processor
-Wl,-u,_bef_effect_ai_set_intensity
-Wl,-u,_bef_effect_ai_set_color_filter_v2
-Wl,-u,_bef_effect_ai_set_camera_device_position
-Wl,-u,_bef_effect_ai_composer_set_nodes
-Wl,-u,_bef_effect_ai_algorithm_texture
-Wl,-u,_bef_effect_ai_process_texture
-Wl,-u,_bef_effect_ai_composer_set_mode
-Wl,-u,_bef_effect_ai_set_width_height
-Wl,-u,_bef_effect_ai_composer_update_node
-Wl,-u,_bef_effect_ai_matting_check_license
-Wl,-u,_bef_effect_ai_portrait_matting_init_model
-Wl,-u,_bef_effect_ai_portrait_matting_destroy
-Wl,-u,_bef_effect_ai_portrait_matting_set_param
-Wl,-u,_bef_effect_ai_portrait_matting_do_detect
-Wl,-u,_bef_effect_ai_portrait_get_output_shape
-Wl,-u,_bef_effect_ai_portrait_matting_create
-Wl,-u,_bef_effect_ai_set_orientation
-Wl,-u,_bef_effect_ai_get_face_detect_result
-Wl,-u,_bef_effect_ai_get_license_wrapper_instance
-Wl,-u,_bef_effect_ai_set_render_api
-Wl,-u,_bef_effect_ai_use_builtin_sensor
-Wl,-u,_bef_effect_ai_check_online_license
-Wl,-u,_bef_effect_ai_set_effect
-Wl,-u,_bef_effect_ai_composer_set_nodes_with_tags
-Wl,-u,_bef_effect_ai_composer_append_nodes
-Wl,-u,_bef_effect_ai_composer_append_nodes_with_tags
-Wl,-u,_bef_effect_ai_composer_remove_nodes
-Wl,-u,_bef_effect_ai_load_resource_with_timeout
-Wl,-u,_bef_effect_ai_set_algorithm_force_detect
-Wl,-u,_bef_effect_ai_process_touch
-Wl,-u,_bef_effect_ai_process_gesture
-Wl,-u,_bef_effect_add_log_to_local_func_with_key
-Wl,-u,_bef_effect_remove_log_to_local_func_with_key
-Wl,-u,_bef_effect_load_egl_library_with_func
-Wl,-u,_bef_effect_load_glesv2_library_with_func
-Wl,-u,_bef_effect_ai_face_detect_create
-Wl,-u,_bef_effect_ai_face_detect_destroy
-Wl,-u,_bef_effect_ai_face_detect_setparam
-Wl,-u,_bef_effect_ai_face_detect
-Wl,-u,_bef_effect_ai_face_check_license
-Wl,-u,_bef_effect_ai_set_render_cache_texture_with_buffer
EOF
  cv.xcconfig = {
    'STRIP_STYLE' => "non-global",
    'OTHER_LDFLAGS' => "#{be_effect_symbols.split("\n").map{|s| s.strip}.join(' ')}"
  }
  end
end

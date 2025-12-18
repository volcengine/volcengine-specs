Pod::Spec.new do |s|
  s.name             = 'UnionOpenPlatformSDK' 
  s.version = '2.5.2.0'
  s.summary          = '抖音游戏SDK'

  s.description      = <<-DESC
                     This SDK may be used to invoke Douyin game features.
                     DESC

  s.homepage         = 'https://game.open.douyin.com'
  s.license          = { :type => 'Copyright', :text => 'Copyright 2020 bytedance.com. All rights reserved.' }
  s.author           = { 'ByteDance' => 'bytedance.com' }
  s.source = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/#{s.name}/#{s.version.to_s}/#{s.name}.zip" }
  puts "s.source: #{s.source}"

  s.ios.deployment_target = '11.0'

  s.frameworks = 'UIKit', 'Foundation', 'Accelerate', 'MobileCoreServices'
  s.weak_framework = 'ApptrackingTransparency'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'GENERATE_INFOPLIST_FILE' => 'YES'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'GENERATE_INFOPLIST_FILE' => 'YES'}

  s.subspec 'Core' do |ss|
    ss.source_files = "#{s.name}/Core/UnionOpenPlatformCore.framework/Headers/*.h"
    ss.public_header_files = "#{s.name}/Core/UnionOpenPlatformCore.framework/Headers/*.h"

    ss.vendored_frameworks = "#{s.name}/Core/UnionOpenPlatformCore.framework"
  end

  s.subspec 'DataLink' do |ss|
    ss.dependency "#{s.name}/Core"

    # DataLink不直接依赖抖音
    ss.source_files  = "#{s.name}/DataLink/UnionOpenPlatformDataLink.framework/Headers/*.h"
    ss.public_header_files  = "#{s.name}/DataLink/UnionOpenPlatformDataLink.framework/Headers/*.h"

    ss.vendored_frameworks = "#{s.name}/DataLink/UnionOpenPlatformDataLink.framework"
  end

  s.subspec 'Douyin' do |ss|
    ss.dependency "#{s.name}/Core"

    ss.source_files  = ["#{s.name}/Douyin/UnionOpenPlatformDouyin.framework/Headers/*.h", "#{s.name}/Douyin/DouyinOpenSDK.framework/Headers/*.h"]
    ss.public_header_files  = ["#{s.name}/Douyin/UnionOpenPlatformDouyin.framework/Headers/*.h", "#{s.name}/Douyin/DouyinOpenSDK.framework/Headers/*.h"]

    ss.vendored_frameworks = ["#{s.name}/Douyin/UnionOpenPlatformDouyin.framework", "#{s.name}/Douyin/DouyinOpenSDK.framework"]
  end

  s.subspec 'Share' do |ss|
    ss.dependency "#{s.name}/Douyin"

    ss.source_files  = "#{s.name}/Share/UnionOpenPlatformShare.framework/Headers/*.h"
    ss.public_header_files  = "#{s.name}/Share/UnionOpenPlatformShare.framework/Headers/*.h"
    ss.vendored_frameworks = "#{s.name}/Share/UnionOpenPlatformShare.framework"
  end
  
  s.subspec 'Replay' do |ss|
    ss.dependency "#{s.name}/Core"

    ss.source_files  = "#{s.name}/Replay/UnionOpenPlatformReplay.framework/Headers/*.h"
    ss.public_header_files  = "#{s.name}/Replay/UnionOpenPlatformReplay.framework/Headers/*.h"

    ss.vendored_frameworks = ["#{s.name}/Replay/UnionOpenPlatformReplay.framework", "#{s.name}/Replay/BDAudioRecord.framework", "#{s.name}/Replay/BDAudioRecordResolver.framework"]
  end

  # s.subspec 'TeamPlay' do |ss|
  #   ss.dependency "#{s.name}/Douyin"

  #   ss.source_files  = "#{s.name}/TeamPlay/UnionOpenPlatformTeamPlay.framework/Headers/*.h"
  #   ss.public_header_files  = "#{s.name}/TeamPlay/UnionOpenPlatformTeamPlay.framework/Headers/*.h"

  #   ss.vendored_frameworks = "#{s.name}/TeamPlay/UnionOpenPlatformTeamPlay.framework"
  # end

  s.subspec 'Broadcast' do |ss|    
    ss.dependency "#{s.name}/Douyin"

    ss.source_files  = "#{s.name}/Broadcast/UnionOpenPlatformBroadcast.framework/Headers/*.h"
    ss.public_header_files  = "#{s.name}/Broadcast/UnionOpenPlatformBroadcast.framework/Headers/*.h"

    ss.vendored_frameworks = "#{s.name}/Broadcast/UnionOpenPlatformBroadcast.framework"
  end

  s.subspec 'Ticket' do |ss|
    ss.dependency "#{s.name}/Douyin"
    ss.source_files = "#{s.name}/Ticket/UnionOpenPlatformTicket.framework/Headers/*.h"
    ss.public_header_files = "#{s.name}/Ticket/UnionOpenPlatformTicket.framework/Headers/*.h"
    ss.vendored_frameworks = "#{s.name}/Ticket/UnionOpenPlatformTicket.framework"
  end

  s.subspec 'Profile' do |ss|
    ss.dependency "#{s.name}/Ticket"
    ss.source_files = "#{s.name}/Profile/UnionOpenPlatformProfile.framework/Headers/*.h"
    ss.public_header_files = "#{s.name}/Profile/UnionOpenPlatformProfile.framework/Headers/*.h"
    ss.vendored_frameworks = "#{s.name}/Profile/UnionOpenPlatformProfile.framework"
  end

  s.subspec 'UG' do |ss|
    ss.dependency "#{s.name}/Core"

    ss.source_files  = "#{s.name}/UG/UnionOpenPlatformUG.framework/Headers/*.h"
    ss.public_header_files  = "#{s.name}/UG/UnionOpenPlatformUG.framework/Headers/*.h"

    ss.vendored_frameworks = "#{s.name}/UG/UnionOpenPlatformUG.framework"
  end

  s.subspec 'DebugTool' do |ss|    
    ss.source_files  = "#{s.name}/DebugTool/UnionOpenPlatformDebugTool.framework/Headers/*.h"
    ss.public_header_files  = "#{s.name}/DebugTool/UnionOpenPlatformDebugTool.framework/Headers/*.h"
    ss.resources = "#{s.name}/DebugTool/UOPDebugToolBundle.bundle"

    ss.vendored_frameworks = "#{s.name}/DebugTool/UnionOpenPlatformDebugTool.framework"
  end

end
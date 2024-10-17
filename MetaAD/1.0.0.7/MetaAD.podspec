Pod::Spec.new do |s|
  s.name             = 'MetaAD'
  s.version          = '1.0.0.7'
  s.summary          = 'Pangrowth MetaAD.'
  s.description      = <<-DESC
Pangrowth MetaAD
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'MetaAD/LICENSE' }
  s.author           = { 'huangchengfeng' => 'huangchengfeng.001@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/MetaAD/1.0.0.7/MetaAD-1.0.0.7.zip" }

  s.ios.deployment_target = '9.0'

  s.static_framework = true
  
  s.resources = 'MetaAD/MetaAD.bundle'
  s.public_header_files = ['MetaAD/headers/MetaADManager.h','MetaAD/headers/MetaADView.h']
  s.vendored_library = 'MetaAD/libMetaAD_MetaAD_awesome_ios.a'

  if $IdentifyCJSImport
  else
    if $DouyinSDKUseAdsFusion
        s.dependency 'Ads-Fusion-CN-Beta'
    else
        s.dependency 'Ads-CN', '>= 4.7'
    end
    
    if $DouyinSDKWithoutBURely
    else
        s.dependency 'BURelyFoundation/CSJ'
    end
  end
  
  s.dependency 'RangersAPM/Core'
  s.dependency 'RangersAPM/Public'
  s.dependency 'RangersAPM/Crash'
  s.dependency 'RangersAPM/HMD'
  s.dependency 'RangersAPM/EventMonitor'
  s.dependency 'RangersAPM/CN'

 if $DouyinSDKUseTTSDKFramework
   s.dependency 'TTSDKFramework/Player'
   s.dependency 'TTSDKFramework/Image'
 else
   s.dependency 'TTSDK/Player'
   s.dependency 'TTSDK/Image'
 end

  s.dependency 'YYText'
  s.dependency 'Masonry'
  s.dependency 'lottie-ios'
end

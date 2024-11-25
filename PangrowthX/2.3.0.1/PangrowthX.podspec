Pod::Spec.new do |s|
  s.name             = 'PangrowthX'
  s.version          = '2.3.0.1'
  s.summary          = 'PangrowthX is an SDK that integrates shortplay, ministory...'
  s.description      = <<-DESC
  PangrowthX is an SDK that integrates shortplay, ministory...
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangzhengbei' => 'wangzhengbei@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/Pangrowth.zip" }

  s.ios.deployment_target = '12.0'

  s.subspec 'shortplay-beta' do |ss|
    ss.dependency 'TTSDKFramework/Player', '>= 1.42.3.4-premium'
    ss.dependency 'PangrowthDJX', '2.3.0.1'
    ss.dependency 'PGXToolbox', '2.3.0.1'
    ss.dependency 'Ads-CN-Beta', '>= 5.8.0.7'
  end

  s.subspec 'shortplay' do |ss|
    ss.dependency 'TTSDKFramework/Player', '>= 1.42.3.4-premium'
    ss.dependency 'PangrowthDJX', '2.3.0.1'
    ss.dependency 'PGXToolbox', '2.3.0.1'
    ss.dependency 'Ads-CN', '>= 5.8.0.9'
  end

  s.subspec 'ministory' do |ss|
    ss.dependency 'PangrowthMiniStory', '2.3.0.1'
    ss.dependency 'PGXToolbox', '2.3.0.1'
  end
  
end

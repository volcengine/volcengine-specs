Pod::Spec.new do |s|
  s.name             = 'PangrowthX'
  s.version          = '2.3.0.0'
  s.summary          = 'PangrowthX is an SDK that integrates shortplay, ministory...'
  s.description      = <<-DESC
  PangrowthX is an SDK that integrates shortplay, ministory...
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangzhengbei' => 'wangzhengbei@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/Pangrowth.zip" }

  s.ios.deployment_target = '12.0'
  s.default_subspecs = [ 'Base' ]

  s.subspec 'Base' do |ss|
    ss.dependency 'RangersApplog', '>= 6.16.3'
    ss.dependency 'RangersAPM', '>= 3.10.6'
  end
  
  s.subspec 'shortplay' do |ss|
    ss.dependency 'PangrowthDJX', '2.3.0.0'
    ss.dependency 'PGXToolbox', '2.3.0.0'
    ss.dependency 'TTSDKFramework/Player'
  end

  s.subspec 'ministory' do |ss|
    ss.dependency 'PangrowthMiniStory', '2.3.0.0'
    ss.dependency 'PGXToolbox', '2.3.0.0'
  end
  
end

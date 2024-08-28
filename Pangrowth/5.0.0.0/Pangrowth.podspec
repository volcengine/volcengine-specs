Pod::Spec.new do |s|
  s.name             = 'Pangrowth'
  s.version          = '5.0.0.0'
  s.summary          = 'Pangrowth is an SDK that integrates novels, media, and live broadcasts.'
  s.description      = <<-DESC
Pangrowth is an SDK that integrates novels, media, and live broadcasts.
                       DESC

  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth/Pangrowth.zip" }

  s.ios.deployment_target = '12.0'

  s.subspec 'media' do |ss|
    ss.dependency 'PangrowthMedia', '5.3.0.0'
  end

  s.subspec 'media-dynamic' do |ss|
    ss.dependency 'PangrowthMedia-lite', '5.3.2.0'
    ss.dependency 'PangrowthTTVideoEngine-dynamic', '1.0.0.0'
  end

  s.subspec 'media-lite' do |ss|
    ss.dependency 'PangrowthMedia-lite', '5.3.2.0'
  end

  s.subspec 'djx' do |ss|
    ss.dependency 'PangrowthDJX', '2.0.0.0'
  end

  s.subspec 'djx-dynamic' do |ss|
    ss.dependency 'PangrowthDJX-lite', '2.0.0.0'
    ss.dependency 'PangrowthTTVideoEngine-dynamic', '1.0.0.0'
  end

  s.subspec 'djx-lite' do |ss|
    ss.dependency 'PangrowthDJX-lite', '2.0.0.0'
  end

  s.subspec 'nov' do |ss|
    ss.dependency 'PangrowthMiniStory', '2.0.0.0'
  end

  s.default_subspecs = []
end

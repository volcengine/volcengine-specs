Pod::Spec.new do |s|
  s.name             = 'PangrowthTTVideoEngine-dynamic'
  s.version          = '1.0.0.0'
  s.summary          = 'PangrowthTTVideoEngine is a SDK from Bytedance providing content service.'
  s.license          = { :type => 'MIT', :file => 'PangrowthTTVideoEngine-dynamic/LICENSE' }
  s.author           = { 'yuxuri' => 'yuxuri@bytedance.com' }

  s.homepage         = 'https://www.csjplatform.com/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/TTVideoEngine/dynamic/#{s.version.to_s}/PangrowthTTVideoEngine-#{s.version.to_s}.zip" }

  s.vendored_frameworks = ['PangrowthTTVideoEngine-dynamic/TTVideoEngine.framework']
end
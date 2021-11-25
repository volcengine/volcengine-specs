Pod::Spec.new do |s|
  s.name             = 'PangrowthTTVideoEngine'
  s.version          = '1.0.0.0'
  s.summary          = 'PangrowthTTVideoEngine is a SDK from Bytedance providing content service.'
  s.license          = { :type => 'MIT', :file => 'PangrowthTTVideoEngine/LICENSE' }
  s.author           = { 'yuxuri' => 'yuxuri@bytedance.com' }

  s.homepage         = 'https://www.csjplatform.com/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/TTVideoEngine/static/#{s.version.to_s}/PangrowthTTVideoEngine-#{s.version.to_s}.zip" }

  s.vendored_frameworks = ['PangrowthTTVideoEngine/TTVideoEngine.framework']
  s.resources = 'PangrowthTTVideoEngine/ttplayer.metallib'
end
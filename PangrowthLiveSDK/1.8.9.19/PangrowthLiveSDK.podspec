Pod::Spec.new do |s|
  s.name             = 'PangrowthLiveSDK'
  s.version          = '1.8.9.19'
  s.summary          = 'PangrowthLiveSDK is a SDK from bytedance providing live streaming service.'
  s.description      = <<-DESC
PangrowthLiveSDK provides live sdk for our business partners.
                       DESC
  s.homepage         = 'https://www.pangle.cn/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'Sun Xianglin' => 'sunxianglin@bytedance.com' }
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/PangrowthLiveSDK/#{s.version.to_s}/PangrowthLiveSDK-#{s.version.to_s}.zip" }
  s.framework        = 'CoreML'
  s.vendored_frameworks = 'IESLiveSaaSKit/*.framework'
  s.resources        = 'IESLiveSaaSKit/*.bundle'
  s.preserve_paths   = 'IESLiveSaaSKit/*.framework', 'IESLiveSaaSKit/*.bundle', 'LICENSE'
end

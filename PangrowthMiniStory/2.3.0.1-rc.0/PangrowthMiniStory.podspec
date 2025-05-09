Pod::Spec.new do |s|
  s.name             = 'PangrowthMiniStory'
  s.version          = '2.3.0.1-rc.0'
  s.summary          = 'PangrowthMiniStory is a SDK from Bytedance providing content service.'
  s.description      = <<-DESC
  Bytedance provides content which include video、feed、video card etc.
                       DESC
  
  s.license          = { :type => 'MIT', :file => 'PangrowthMiniStory/LICENSE' }
  s.author           = { 'sunxianglin' => 'sunxianglin@bytedance.com' }

  s.homepage         = 'https://www.pangle.cn/'
  s.source           = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/pangle-empower/pangrowth-ministory/#{s.version.to_s}/PangrowthMiniStory-#{s.version.to_s}.zip" }
  
  s.ios.deployment_target = '12.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-lObjC'] }

  s.dependency 'PGXToolbox', '2.3.0.1'
  s.dependency 'MMKV'
  s.dependency 'FMDB/standard'
  s.dependency 'YYCache'
  s.dependency 'YYText'
  s.dependency 'OneKit/BaseKit', '>= 1.3.8'
  s.dependency 'OneKit/ByteDanceKit/UIKit', '>= 1.3.8'
  
  s.vendored_frameworks = ['PangrowthMiniStory/PangrowthMiniStory.framework']
  s.resources = ['PangrowthMiniStory/PangrowthMiniStory.bundle']
  s.preserve_paths = 'PangrowthMiniStory/*.*'
end

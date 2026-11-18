Pod::Spec.new do |spec|

  spec.name         = 'GMBaiduAdapter-Beta'
  spec.version      = '10.060.0'
  spec.summary      = 'GMBaiduAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.'
  spec.homepage     = 'https://www.csjplatform.com/gromore'
  spec.description  = <<-DESC   
  GMBaiduAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.
                       DESC

  spec.license      = { :type => 'MIT', :file => 'CSJMBaiduAdapter/LICENSE' }
  spec.author       = { 'csj-ios' => 'csj-ios@bytedance.com' }
  
  spec.platform     = :ios, '11.0'

  spec.source       = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/CSJMBaiduAdapter/10.060.0/CSJMBaiduAdapter.zip" }

  spec.requires_arc = true
  
  spec.ios.deployment_target = '11.0'

  spec.vendored_frameworks = ['CSJMBaiduAdapter/CSJMBaiduAdapter.xcframework']
  spec.dependency 'Ads-CN-Beta/CSJMediation-Only','>= 7.9.0.3'
  
end
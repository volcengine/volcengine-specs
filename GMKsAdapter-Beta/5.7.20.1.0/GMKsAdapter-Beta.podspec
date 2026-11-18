Pod::Spec.new do |spec|

  spec.name         = 'GMKsAdapter-Beta'
  spec.version      = '5.7.20.1.0'
  spec.summary      = 'GMKsAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.'
  spec.homepage     = 'https://www.csjplatform.com/gromore'
  spec.description  = <<-DESC   
  GMKsAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.
                       DESC

  spec.license      = { :type => 'MIT', :file => 'CSJMKsAdapter/LICENSE' }
  spec.author       = { 'csj-ios' => 'csj-ios@bytedance.com' }
  
  spec.platform     = :ios, '11.0'

  spec.source       = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/CSJMKsAdapter/5.7.20.1.0/CSJMKsAdapter.zip" }

  spec.requires_arc = true
  
  spec.ios.deployment_target = '11.0'

  spec.vendored_frameworks = ['CSJMKsAdapter/CSJMKsAdapter.xcframework']
  spec.dependency 'Ads-CN-Beta/CSJMediation-Only','>= 7.9.0.3'
  
end
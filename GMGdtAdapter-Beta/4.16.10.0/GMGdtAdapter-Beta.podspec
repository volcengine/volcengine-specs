Pod::Spec.new do |spec|

  spec.name         = 'GMGdtAdapter-Beta'
  spec.version      = '4.16.10.0'
  spec.summary      = 'GMGdtAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.'
  spec.homepage     = 'https://www.csjplatform.com/gromore'
  spec.description  = <<-DESC   
  GMGdtAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.
                       DESC

  spec.license      = { :type => 'MIT', :file => 'CSJMGdtAdapter/LICENSE' }
  spec.author       = { 'csj-ios' => 'csj-ios@bytedance.com' }
  
  spec.platform     = :ios, '11.0'

  spec.source       = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/CSJMGdtAdapter/4.16.10.0/CSJMGdtAdapter.zip" }

  spec.requires_arc = true
  
  spec.ios.deployment_target = '11.0'

  spec.vendored_frameworks = ['CSJMGdtAdapter/CSJMGdtAdapter.xcframework']
  spec.dependency 'Ads-CN-Beta/CSJMediation-Only','>= 7.9.0.3'
  
end
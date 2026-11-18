Pod::Spec.new do |spec|

  spec.name         = 'GMSigmobAdapter-Beta'
  spec.version      = '5.1.4.0'
  spec.summary      = 'GMSigmobAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.'
  spec.homepage     = 'https://www.csjplatform.com/gromore'
  spec.description  = <<-DESC   
  GMSigmobAdapter-Beta is a adapter SDK from Bytedance providing media union AD service.
                       DESC

  spec.license      = { :type => 'MIT', :file => 'CSJMSigmobAdapter/LICENSE' }
  spec.author       = { 'csj-ios' => 'csj-ios@bytedance.com' }
  
  spec.platform     = :ios, '11.0'

  spec.source       = { :http => "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/CSJMSigmobAdapter/5.1.4.0/CSJMSigmobAdapter.zip" }

  spec.requires_arc = true
  
  spec.ios.deployment_target = '11.0'

  spec.vendored_frameworks = ['CSJMSigmobAdapter/CSJMSigmobAdapter.xcframework']
  spec.dependency 'Ads-CN-Beta/CSJMediation-Only','>= 7.9.0.3'
  
end
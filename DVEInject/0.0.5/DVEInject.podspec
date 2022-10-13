Pod::Spec.new do |s|
  s.name = "DVEInject"
  s.version = "0.0.5"
  s.summary = "DVEInject"
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.authors = {"bytedance"=>"bytedance@bytedance.com"}
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "make better inject"
  s.frameworks = ["Foundation", "UIKit"]
  s.requires_arc = true
  s.libraries = ["xml2", "z", "c++"]
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'DVEInject.framework'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64", 'ENABLE_BITCODE' => 'NO' }
end

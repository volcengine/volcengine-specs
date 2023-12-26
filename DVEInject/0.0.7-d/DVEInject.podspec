Pod::Spec.new do |s|
  s.name = "DVEInject"
  s.version = "0.0.7-d"
  s.summary = "DVEInject"
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.authors = {"zhangyuanming"=>"zhangyuanming@bytedance.com"}
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "DI"
  s.frameworks = ["Foundation", "UIKit"]
  s.requires_arc = true
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/0.0.6-d/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'DVEInject.framework'
  s.preserve_paths = 'DVEInject.framework'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "x86_64 arm64", 'ENABLE_BITCODE' => 'NO' }
end

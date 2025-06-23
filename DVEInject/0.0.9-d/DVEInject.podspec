Pod::Spec.new do |s|
  s.name = "DVEInject"
  s.version = "0.0.9-d"
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
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'DVEInject.framework'
  s.preserve_paths = 'DVEInject.framework'
  s.pod_target_xcconfig = { "VALID_ARCHS" => "arm64,x86_64", 'ENABLE_BITCODE' => 'NO' }
end

#dsym: https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/DVEInject/dsym/#{s.version}/DVEInject-${s.version}-dsym.zip

Pod::Spec.new do |s|
  s.name = "DVEInject"
  s.version = "0.0.6"
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
  s.static_framework = true
  s.libraries = ["xml2", "z", "c++"]
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_libraries  = ['*.a']
  s.ios.public_header_files = ['Headers/*.{h}']
  s.ios.source_files = ['Headers/*.{h}']
  s.ios.module_map = "Modules/module.modulemap"
  s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64", 'ENABLE_BITCODE' => 'NO' }
end

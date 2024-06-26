Pod::Spec.new do |s|
  s.name = "TTVideoEditor"
  s.version = "11.8.5.21-VE"
  s.summary = "TTVideoEditor"
  s.license = "MIT"
  s.authors = {"bytedance.ysj"=>"bytedance.ysj@bytedance.com"}
  s.homepage = "https://github.com/volcengine"
  s.description = "ttvideoeditor"
  s.weak_frameworks = ["Metal", "MetalPerformanceShaders", "Photos", "CoreML", "MetalKit"]
  s.libraries = ["xml2", "iconv", "compression", "z", "c++"]
  s.requires_arc = true
  s.source = {"http"=>"https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTVideoEditor/11.8.5.21-VE/TTVideoEditor.zip"}

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_libraries  = ['ios/*.a']
  s.ios.public_header_files = ['ios/Headers/*.{h}']
  s.ios.source_files = ['ios/Headers/*.{h}',"ios/Modules/module.modulemap"]
  s.ios.resource = ['ios/Resources/*.bundle']
  s.ios.module_map   = "ios/Modules/module.modulemap"
  s.dependency "KVOController"
  s.dependency "SSZipArchive"
s.pod_target_xcconfig = { "VALID_ARCHS" => "armv7 arm64" }
end
 # shell_commit=297fd17596c208c485166c6d7830721fac440e19
 

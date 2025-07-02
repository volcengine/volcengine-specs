Pod::Spec.new do |s|
  s.name             = "TTNetworkManager"
  s.version          = "5.2.210.19-alpha.1-tob"
  s.summary          = "iOS client network sdk"
  s.description      = "Network SDK for iOS"
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  s.author           = { "dongyangfan" => "dongyangfan@bytedance.com" }
  s.source           = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/TTNetworkManager/5.2.210.19-alpha.1-tob/TTNetworkManager.zip" }
  s.platform     = :ios, '10.0'
  s.requires_arc = true
  s.ios.frameworks = 'WebKit', 'JavaScriptCore'
  s.libraries = "c++"
  s.vendored_framework = 'TTNetworkManager/TTNetworkManager.xcframework'
  s.preserve_paths = 'TTNetworkManager/TTNetworkManager.xcframework'
end

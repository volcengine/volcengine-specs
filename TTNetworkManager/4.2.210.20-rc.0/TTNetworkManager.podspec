Pod::Spec.new do |s|
  s.name             = "TTNetworkManager"
  s.version          = "4.2.210.20-rc.0"
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

  s.source           = { :http => "https://hstob-cdn-tos.volccdn.com/volcengine/TTNetworkManager/4.2.210.20-rc.0/TTNetworkManager.zip" }

  s.platform     = :ios, '10.0'
  s.requires_arc = true
  s.pod_target_xcconfig = {
    # 'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.ios.frameworks = 'WebKit', 'JavaScriptCore'
  s.libraries = "c++"
  
  s.vendored_framework = 'TTNetworkManager/TTNetworkManager.framework'
  
end

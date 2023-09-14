Pod::Spec.new do |s|
  s.name = "BDHTTPDNS"
  s.version = "0.14.2"
  s.summary = "BDHTTPDNS is a toB sdk of httpdns"
  s.authors = {"liuzhe.1939"=>"liuzhe.1939@bytedance.com"}
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.description = "BDHTTPDNS is a toB sdk of httpdns."
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/BDHTTPDNS-ios/#{s.version}/BDHTTPDNS.zip" }

  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }

  valid_archs = ['armv7','arm64','x86_64']
  s.xcconfig = {
      'VALID_ARCHS' =>  valid_archs.join(' '),
  }

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.ios.deployment_target = '9.0'
  s.static_framework = true
  s.preserve_paths = "*"

  s.subspec 'Core' do |core|
    core.preserve_paths = 'Core'
    core.source_files = 'Core/*'
    core.public_header_files = 'Core/*.h'
    core.vendored_library = 'Core/libBytedanceHTTPDNS.a'
    core.libraries = 'BytedanceHTTPDNS'
    core.frameworks = 'SystemConfiguration', 'CoreTelephony'
  end

  s.subspec 'TTNet' do |ttnet|
    ttnet.preserve_paths = 'TTNet'
    ttnet.source_files = 'TTNet/*'
    ttnet.public_header_files = 'TTNet/*.h'
    ttnet.dependency 'TTNetworkManager', '5.0.29.8'
  end



end

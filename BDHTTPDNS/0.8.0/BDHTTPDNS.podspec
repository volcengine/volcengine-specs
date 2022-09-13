Pod::Spec.new do |s|
  s.name = "BDHTTPDNS"
  s.version = "0.8.0"
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

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.ios.deployment_target    = '8.0'
  s.preserve_paths = '*'
  s.vendored_library = 'libBytedanceHTTPDNS.a'
  s.libraries = 'BytedanceHTTPDNS'
  s.source_files = '*'
  s.public_header_files = 'BDHTTPDNS/TTDnsResolver.h', 'BDHTTPDNS/TTDnsExportResult.h'
  s.frameworks = 'SystemConfiguration', 'CoreTelephony'
end

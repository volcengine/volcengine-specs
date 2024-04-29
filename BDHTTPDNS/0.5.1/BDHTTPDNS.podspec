Pod::Spec.new do |s|
  s.name = "BDHTTPDNS"
  s.version = "0.5.1"
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

  valid_archs = ['arm64','x86_64']
  s.xcconfig = {
      'VALID_ARCHS' =>  valid_archs.join(' '),
  }

  s.ios.deployment_target = '9.0'
  s.static_framework = true

  s.preserve_paths = '**/*'
  s.source_files = '**/*'
  s.public_header_files = '**/*.h'

  s.vendored_library = 'libBytedanceHTTPDNS.a'
  s.libraries = 'BytedanceHTTPDNS'
  s.frameworks = 'SystemConfiguration', 'CoreTelephony'

end

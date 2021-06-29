Pod::Spec.new do |s|
  s.name             = 'mars_gecko_ios'
  s.version          = '2.0.9'
  s.summary          = 'A solution for online resource downloading & management'
  s.description      = <<-DESC
                       A solution for online resource downloading & management.
                       DESC
  s.homepage         = 'https://github.com/volcengine/volcengine-specs/tree/master/OneKit'
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }

  s.author           = { 'Mars' => 'mars@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/mars_gecko_ios/#{s.version.to_s}/mars_gecko_ios.zip" }

  s.platform = :ios, '7.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.default_subspecs = 'Core'

  s.static_framework = true
  
  #s.pod_target_xcconfig = { 'EXCLUDED_SOURCE_FILE_NAMES' => '*-dummy.m' }
  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "GECKO_SPEC_VERSION=@\\\"#{s.version.to_s}\\\"",
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'Core' do |ss|
    ss.dependency 'SSZipArchive'
    ss.dependency 'OneKit', '>= 0.2.1'
    ss.libraries = 'bz2'

    ss.vendored_libraries = [
      'mars_gecko_ios/Core/libmars_gecko_ios_Core_awesome_ios.a'
    ]
    
    ss.public_header_files = [
      'mars_gecko_ios/Core/IESGeckoKit.h',
      'mars_gecko_ios/Core/IESGeckoDefines.h',
      'mars_gecko_ios/Core/IESGurdProtocolDefines.h',
      'mars_gecko_ios/Core/IESGurdKit+Experiment.h',
      'mars_gecko_ios/Core/IESGurdKit+ExtraParams.h',
      'mars_gecko_ios/Core/IESGurdKit+InternalPackages.h',
      'mars_gecko_ios/Core/IESGurdRegisterModel.h',
      'mars_gecko_ios/Core/IESGurdFetchResourcesParams.h',
      'mars_gecko_ios/Core/IESGurdLoadResourcesParams.h',
      'mars_gecko_ios/Core/IESGurdUnzipPackageInfo.h',
      'mars_gecko_ios/Core/IESGurdCacheConfiguration.h',
      'mars_gecko_ios/Core/IESGurdDownloadPackageInfo.h',
      'mars_gecko_ios/Core/IESGeckoResourceModel.h',
      'mars_gecko_ios/Core/IESGurdNetworkResponse.h' ]

    ss.source_files = 'mars_gecko_ios/Core/**/*.{h,m}'
  end
end

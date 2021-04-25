Pod::Spec.new do |s|
  s.name             = 'BDXBridgeKitToB'
  s.version          = '1.0.7'
  s.summary          = 'BDXBridgeKitToB is the iOS SDK of X Bridge'
  
  s.description      = <<-DESC
  BDXBridgeKitToB provides not only a mechanism to register & manage your custom bridge methods with clean interfaces,
  but also a set of general bridge methods which are standardized with FE & Android side.
  DESC
  
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hulizhen' => 'hulizhen@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }
  
  s.ios.deployment_target = '9.0'
  s.static_framework = true
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.subspec 'Core' do |core|
    core.vendored_libraries = 'BDXBridgeKitToB/Classes/Core/**/*.a'
    core.public_header_files = 'BDXBridgeKitToB/Classes/Core/*.h'
    core.source_files = 'BDXBridgeKitToB/Classes/Core/*.h'
    core.dependency 'OneKit/BDMantle'
  end
  
  s.subspec 'Containers' do |containers|
    containers.dependency 'BDXBridgeKitToB/Core'

    containers.subspec 'Web' do |web|
      web.vendored_libraries = 'BDXBridgeKitToB/Classes/Containers/Web/*.a'
    end
  end

  s.subspec 'Engines' do |engines|
    engines.dependency 'BDXBridgeKitToB/Core'
    
    engines.subspec 'TTBridgeUnifyAdapter' do |adapter|
      adapter.subspec 'CoreEngine' do |core|
        core.vendored_libraries = 'BDXBridgeKitToB/Classes/Engines/TTBridgeUnifyAdapter/**/*.a'
        core.dependency 'OKJSBridgeToB', '>=1.0.5'
      end
      
      adapter.subspec 'WebEngine' do |web|
        web.dependency 'BDXBridgeKitToB/Engines/TTBridgeUnifyAdapter/CoreEngine'
        web.dependency 'OKJSBridgeToB', '>=1.0.5'
      end
    end
  end

  s.subspec 'Methods' do |methods|
    methods.dependency 'BDXBridgeKitToB/Core'
    methods.subspec 'Framework' do |framework|
      framework.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Framework/*.a'
    end

    methods.subspec 'Event' do |event|
      event.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Event/*.a'
      event.private_header_files = 'BDXBridgeKitToB/Classes/Methods/Event/*+Internal.h'
    end
    
    methods.subspec 'System' do |system|
      system.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/System/*.a'
      system.frameworks = 'MessageUI'
    end

    methods.subspec 'Network' do |network|
      network.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Network/*.a'
      network.dependency 'OneKit/Reachability'
      network.dependency 'TTNetworkManager'
    end
    
    methods.subspec 'Storage' do |storage|
      storage.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Storage/*.a'
    end
    
    methods.subspec 'Account' do |account|
      account.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Account/*.a'
    end

    methods.subspec 'Log' do |log|
      log.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Log/*.a'
    end

    methods.subspec 'Info' do |info|
      info.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Info/*.a'
      info.dependency 'OneKit/Reachability'
      info.dependency 'OneKit/ByteDanceKit'
    end

    methods.subspec 'Media' do |media|
      media.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Media/*.a'
      media.dependency 'OneKit/Reachability'
      media.dependency 'TTNetworkManager'
    end

    methods.subspec 'Route' do |route|
      route.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Route/*.a'
    end

    methods.subspec 'UI' do |ui|
      ui.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/UI/*.a'
    end

    methods.subspec 'Open' do |open|
      open.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Open/*.a'
      open.dependency 'QRCodeReaderViewController', '4.0.2'
    end

    methods.subspec 'Development' do |development|
      development.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/Development/*.a'
    end

    methods.subspec 'ScreenShot' do |screenShot|
      screenShot.vendored_libraries = 'BDXBridgeKitToB/Classes/Methods/ScreenShot/*.a'
      screenShot.dependency 'OneKit/Screenshot'
      screenShot.frameworks = 'PhotoKit'
    end
  end

  s.default_subspecs = 'Core', 'Containers/Web', 'Engines/TTBridgeUnifyAdapter/WebEngine', 'Methods'
end

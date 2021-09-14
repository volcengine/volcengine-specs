Pod::Spec.new do |s|
    s.name             = 'RangersAppLog'
    s.version          = '6.3.3-rc.0'
    s.summary          = 'ByteDance Rangers AppLog.'
    s.description      = 'ByteDance Rangers AppLog SDK.'
    s.homepage         = 'https://github.com/bytedance/RangersAppLog'
    s.license          = {
      :type => 'Copyright',
      :text => <<-LICENSE
                Bytedance copyright
      LICENSE
    }
    s.author           = { 'zhuyuanqing' => 'zhuyuanqing@bytedance.com' }
    s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/RangersAppLog/6.3.3-rc.0/RangersAppLog.zip"}
    
    s.ios.deployment_target = '9.0'
    s.requires_arc = true
    s.static_framework = true
    s.pod_target_xcconfig = {
      'OTHER_LDFLAGS' => '-lObjC',
      'DEFINES_MODULE' => 'YES',
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    s.user_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
  
    s.default_subspecs = ['Core', 'Log', 'Host/CN']
    
    s.subspec 'Core' do |bd|
      bd.vendored_library = 'RangersAppLog/Classes/Core/*.a'
      bd.frameworks = 'UIKit','Foundation','Security', 'CoreTelephony', 'CoreFoundation', 'SystemConfiguration', 'CoreGraphics', 'WebKit'
      bd.library = 'z','sqlite3'
      bd.dependency 'OneKit/BaseKit'
      bd.dependency 'OneKit/StartUp'
      bd.source_files = 'RangersAppLog/Classes/Core/*.{h,m,c}'
      bd.public_header_files = 'RangersAppLog/Classes/Core/*.h'
      bd.resource_bundles = {
        'RangersAppLog' => ['RangersAppLog/Asserts/Core/*.js']
      }
    end
  
    s.subspec 'Host' do |bd|
      bd.dependency 'RangersAppLog/Core'
      bd.subspec 'CN' do |cn|
        cn.source_files = 'RangersAppLog/Classes/Host/CN/*.{h,m,c}'
        cn.public_header_files = 'RangersAppLog/Classes/Host/CN/*.h'
        cn.vendored_library = 'RangersAppLog/Classes/Host/CN/*.a'
      end
      bd.subspec 'SG' do |sg|
        sg.source_files = 'RangersAppLog/Classes/Host/SG/*.{h,m,c}'
        sg.public_header_files = 'RangersAppLog/Classes/Host/SG/*.h'
        sg.vendored_library = 'RangersAppLog/Classes/Host/SG/*.a'
      end
      bd.subspec 'VA' do |va|
        va.source_files = 'RangersAppLog/Classes/Host/VA/*.{h,m,c}'
        va.public_header_files = 'RangersAppLog/Classes/Host/VA/*.h'
        va.vendored_library = 'RangersAppLog/Classes/Host/VA/*.a'
      end
    end
  
    s.subspec 'Log' do |bd|
      bd.vendored_library = 'RangersAppLog/Classes/Log/*.a'
      bd.dependency 'RangersAppLog/Core'
    end
  
    s.subspec 'Unique' do |bd|
      bd.vendored_library = 'RangersAppLog/Classes/Unique/*.a'
      bd.frameworks = 'AdSupport'
      bd.weak_frameworks = 'AppTrackingTransparency'
      bd.dependency 'RangersAppLog/Core'
      bd.source_files = 'RangersAppLog/Classes/Unique/*.{h,m,c}'
      bd.public_header_files = 'RangersAppLog/Classes/Unique/*.h'
    end
  
    s.subspec 'CAID' do |ss|
      ss.vendored_library = 'RangersAppLog/Classes/CAID/*.a'
      ss.dependency 'RangersAppLog/Core'
    end

    # Apple Search Ads
    s.subspec 'ASA' do |asa|
        asa.vendored_library = 'RangersAppLog/Classes/ASA/*.a'
        asa.frameworks =  'iAd'
        asa.weak_frameworks = 'AdServices'
        asa.dependency 'RangersAppLog/Core'
        asa.source_files = 'RangersAppLog/Classes/ASA/*.{h,m}'
        asa.public_header_files = 'RangersAppLog/Classes/ASA/*.h'
    end
    
    # disable or enable features
    s.subspec 'Flags' do |flags|
        flags.dependency 'RangersAppLog/Core'
        flags.subspec 'DisableiAd' do |ss|
            ss.vendored_library = 'RangersAppLog/Classes/Flags/DisableiAd/*.a'
            ss.source_files = 'RangersAppLog/Classes/Flags/DisableiAd/*.{h,m}'
            ss.public_header_files = 'RangersAppLog/Classes/Flags/DisableiAd/*.h'
        end
    end
    
    s.subspec 'UITracker' do |bd|
      bd.vendored_library = 'RangersAppLog/Classes/UITracker/*.a'
      bd.frameworks = 'Foundation','UIKit','WebKit'
      bd.dependency 'RangersAppLog/Core'
      bd.source_files = 'RangersAppLog/Classes/UITracker/*.{h,m,c}'
      bd.public_header_files = 'RangersAppLog/Classes/UITracker/*.h'
    end
  
    s.subspec 'Picker' do |bd|
      bd.vendored_library = 'RangersAppLog/Classes/Picker/*.a'
      bd.frameworks = 'Foundation','UIKit','WebKit','CoreText'
      bd.dependency 'RangersAppLog/Log'
      bd.dependency 'RangersAppLog/UITracker'
      bd.source_files = 'RangersAppLog/Classes/Picker/*.{h,m,c}'
      bd.public_header_files = 'RangersAppLog/Classes/Picker/*.h'
    end
  
    s.subspec 'OneKit' do |onekit|
      onekit.vendored_library = 'RangersAppLog/Classes/OneKit/*.a'
      onekit.dependency 'RangersAppLog/Core'
      onekit.dependency 'OneKit/StartUp'
      onekit.dependency 'OneKit/Service'
      # onekit.source_files = 'RangersAppLog/Classes/OneKit/Tasks/**/*.h'
      # onekit.public_header_files = 'RangersAppLog/Classes/OneKit/Tasks/**/*.h'
    end

  # ===========================================================================
    s.subspec 'VolMetaSecML' do |ss|
      ss.vendored_library = 'RangersAppLog/Classes/VolMetaSecML/*.a'
      ss.frameworks = 'CoreMotion'
      ss.dependency 'VolMetaSecML', '4.3.0.5-bugfix'
      ss.public_header_files = 'RangersAppLog/Classes/VolMetaSecML/RALSecML.h'
      ss.source_files = 'RangersAppLog/Classes/VolMetaSecML/RALSecML.{h,m}'
    end
    
    # C接口Bridge。在Unity Native Plugin等场景下使用。一般可以忽略。 
    s.subspec 'CBridge' do |c|
      c.dependency 'RangersAppLog/Core'
      c.vendored_library = 'RangersAppLog/Classes/CBridge/*.a'
      c.source_files = 'RangersAppLog/Classes/CBridge/*.{h,m}'
      c.public_header_files = 'RangersAppLog/Classes/CBridge/*.h'
    end
    
  end
  
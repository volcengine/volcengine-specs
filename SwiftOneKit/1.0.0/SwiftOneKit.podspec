Pod::Spec.new do |s|
  s.name             = 'SwiftOneKit'
  s.version          = '1.0.0'
  s.summary          = 'SwiftOneKit Kit.'
  s.description      = 'A swift iOS fundamental framework'
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = { 
        :type => 'Copyright',
        :text => <<-LICENSE
                Bytedance copyright
        LICENSE
  }
  s.author           = { 'duanwenbin' => 'bob170731@gmail.com' }
  s.source           = {
    :git => 'git@github.com:volcengine/veMARS_SwiftOneKit.git',
    :tag => s.version.to_s
  }
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.static_framework = true
  s.swift_version = '5.0'
  s.pod_target_xcconfig = {
   'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
  
  s.subspec 'BaseKit' do |d|
    d.frameworks =  'Foundation'
    d.dependency 'OneKit/BaseKit'
    d.source_files = 'SwiftOneKit/BaseKit/*.{swift}'
  end
  
  s.subspec 'Service' do |d|
    d.frameworks =  'Foundation'
    d.dependency 'OneKit/Service'
    d.source_files = 'SwiftOneKit/Service/*.{swift}'
  end
  
end

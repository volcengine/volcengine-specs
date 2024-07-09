Pod::Spec.new do |s|
  s.name             = 'EffectOneKit'
  s.version          = '1.1.0.1-karrot-eolite'
  s.summary = "EffectOneKit"
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              EffectOne copyright
    LICENSE
  }
  s.authors = "EffectOne"
  s.homepage = "https://github.com/volcengine/volcengine-specs"
  s.description = "make better video editing and development experience"
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/EffectOneKit/1.1.0.1-karrot-eolite/EffectOneKit.xcframework.zip"}

  s.ios.deployment_target = '9.0'

  s.vendored_frameworks = "EffectOneKit.xcframework"
end

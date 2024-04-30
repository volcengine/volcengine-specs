Pod::Spec.new do |s|
  s.name             = 'EffectOneKit'
  s.version          = '1.0.0.1-byteplus'
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
  s.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{$EFFECT_ONE_KEY}/1.0.0.1-byteplus/EffectOneKit.xcframework.zip"}

  s.ios.deployment_target = '9.0'

  s.vendored_frameworks = "EffectOneKit.xcframework"
end

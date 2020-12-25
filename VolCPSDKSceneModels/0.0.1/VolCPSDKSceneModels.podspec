#
# Be sure to run `pod lib lint MSSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name         = "VolCPSDKSceneModels"
  s.version      = "1.0.0"
  s.summary      = "VolCPSDKSceneModels"
  s.homepage     = 'https://github.com/volcengine/volcengine-specs'
  s.author       = { "zhangzijin" => "zhangzijin.ccc@bytedance.com" }
  s.source           = { :http => 'https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/VolCPSDKSceneModels/0.0.1/VolCPSDKSceneModels.zip'}
  s.description      = <<-DESC
  CPSDK SCENE MODELS
                       DESC
  s.ios.deployment_target = '9.0'

  # CPSDK 支持的场景
  SceneModels = [
      'CPSceneTypeRoleName'
  ]#SceneModels

  SceneModels.each do |m|
    s.subspec m do |s|
      s.requires_arc = false
        s.ios.resource_bundles = {m => ['scenes/%s/*'%m,]}
    end
  end
end

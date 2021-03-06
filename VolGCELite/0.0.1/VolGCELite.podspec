#
# Be sure to run `pod lib lint MSSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VolGCELite'
  s.version          = '0.0.1'
  s.summary          = 'GCE Lite'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS platform security SDK for all apps by pod
                       DESC
  s.homepage     = 'https://github.com/volcengine/volcengine-specs'
  s.author           = { 'zhangzijin'   => 'zhangzijin.ccc@bytedance.com' }
  s.source           = { :http => 'https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/VolGCELite/0.0.1/VolGCELite.zip'}
  s.ios.deployment_target = '9.0'
  
  s.module_name = 'VolGCELite'
  s.library = 'c++'
  s.vendored_frameworks = "VolGCELite/GCELite.framework"
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

end

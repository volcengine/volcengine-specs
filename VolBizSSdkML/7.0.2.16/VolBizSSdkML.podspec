#
# Be sure to run `pod lib lint VolBizSSdkML.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VolBizSSdkML'
  s.version          = '7.0.2.16'
  s.summary          = "#{s.name} sdk for iOS"
  s.description      = <<-DESC
  iOS platform security SDK for all apps by pod
                       DESC
  s.homepage         = 'https://github.com/volcengine/volcengine-specs'
  s.license          = { :type => 'MIT', :text => <<-VOL_LICENSE
                    MIT License

                    Copyright (c) 2024 Volcengine
                    
                    Permission is hereby granted, free of charge, to any person obtaining a copy
                    of this software and associated documentation files (the "Software"), to deal
                    in the Software without restriction, including without limitation the rights
                    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                    copies of the Software, and to permit persons to whom the Software is
                    furnished to do so, subject to the following conditions:
                    
                    The above copyright notice and this permission notice shall be included in all
                    copies or substantial portions of the Software.
                    
                    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
                    SOFTWARE.
                  VOL_LICENSE
}
  s.author           = { 'liqiang.victor'        => 'liqiang.victor@bytedance.com' }
  s.source           = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/#{s.name}/#{s.version}/#{s.name}.zip" }
  s.ios.deployment_target = '12.0'

  s.library = 'resolv.9', 'c++', 'z'
  s.frameworks = 'MessageUI', 'CoreTelephony', 'SystemConfiguration', 'CoreMotion','UIKit','JavaScriptCore','CoreLocation'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'OTHER_LDFLAGS' => '$(inherited) -lbizssdk_ml' }

  s.public_header_files = "#{s.name}/*.h"
  s.source_files = "#{s.name}/*"
  s.vendored_libraries = "#{s.name}/libbizssdk_ml.a"
  s.preserve_paths = "#{s.name}/*"
end

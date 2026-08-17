Pod::Spec.new do |s|
  s.name             = 'YYText'
  s.version          = '1.1.3.1-binary'
  s.summary          = 'Powerful text framework for iOS to display and edit rich text (ByteDance internal bugfix version).'
  s.description      = <<-DESC
    YYText is a powerful iOS text framework that extends iOS's text system
    with rich text display, async rendering, and text editing capabilities.
    This is a ByteDance-maintained binary distribution with internal bugfixes
    (e.g. boundary crash on empty array).
  DESC

  s.homepage         = 'https://github.com/ibireme/YYText'
  s.license          = { :type => 'MIT', :file => 'YYText/LICENSE' }
  s.author           = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'

  s.platform         = :ios, '12.0'
  s.requires_arc     = true

  s.source           = {
    :http => 'https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/YYText/1.1.3.1-binary/YYText.zip'
  }

  # ===== 系统框架依赖 =====
  s.frameworks       = 'UIKit', 'CoreFoundation', 'CoreText',
                       'QuartzCore', 'Accelerate', 'MobileCoreServices',
                       'Foundation', 'JavaScriptCore'

  # ===== 产物声明：XCFramework =====
  # zip 解压后目录结构：
  #   LICENSE
  #   README.md
  #   YYText.xcframework/   ← 包含真机 + 模拟器切片，头文件已内置
  s.vendored_frameworks = 'YYText/YYText.xcframework'
  s.preserve_paths = 'YYText/YYText.xcframework'

  # ===== 编译配置 =====
  s.user_target_xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
  s.pod_target_xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'GCC_PREPROCESSOR_DEFINITIONS[config=Release]' => '$(inherited) NDEBUG=1'
  }
end

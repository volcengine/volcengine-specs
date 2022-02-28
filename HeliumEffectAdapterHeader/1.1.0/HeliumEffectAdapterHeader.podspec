Pod::Spec.new do |spec|

  spec.name                = "HeliumEffectAdapterHeader"
  spec.version             = "1.1.0"
  spec.summary             = "Helium Effect Adapter Header File."

  spec.description         = spec.summary

  spec.homepage            = "https://github.com/volcengine/volcengine-specs"

  spec.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Bytedance copyright
    LICENSE
  }
  spec.author              = { "gejunchen" => "gejunchen@bytedance.com" }
  spec.source = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/HeliumEffectAdapterHeader/1.1.0/helium_effect_adapter_header.zip" }

  spec.source_files        = "helium_effect_adapter_header/include/**/*.h"

  spec.public_header_files = "helium_effect_adapter_header/include/**/*.h"

end

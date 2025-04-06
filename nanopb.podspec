Pod::Spec.new do |s|
  s.name         = "nanopb"
  # CocoaPods minor version is minor * 10,000 + patch * 100 + fourth
  s.version      = "3.30910.0"
  s.summary      = "Protocol buffers with small code size."

  s.description  = <<-DESC
                    Nanopb is a small code-size Protocol Buffers implementation
                    in ansi C. It is especially suitable for use in
                    microcontrollers, but fits any memory restricted system.
                   DESC

  s.homepage     = "https://github.com/nanopb/nanopb"
  s.license      = { :type => 'zlib', :file => 'LICENSE' }
  s.author       = { "Petteri Aimonen" => "jpa@nanopb.mail.kapsi.fi" }
  s.source       = { :git => "https://github.com/kuria-dev/nanopb.git", :tag => "0.3.9.10" }

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '7.0'

  s.requires_arc = false
  s.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) PB_FIELD_32BIT=1 PB_NO_PACKED_STRUCTS=1 PB_ENABLE_MALLOC=1' }

  s.source_files  = 'nanopb/*.{h,c}'
  s.public_header_files  = 'nanopb/*.h'

  s.subspec 'encode' do |e|
    e.public_header_files = ['nanopb/pb.h', 'nanopb/pb_encode.h', 'nanopb/pb_common.h']
    e.source_files = ['nanopb/pb.h', 'nanopb/pb_common.h', 'nanopb/pb_common.c', 'nanopb/pb_encode.h', 'nanopb/pb_encode.c']
  end

  s.subspec 'decode' do |d|
    d.public_header_files = ['nanopb/pb.h', 'nanopb/pb_decode.h', 'nanopb/pb_common.h']
    d.source_files = ['nanopb/pb.h', 'nanopb/pb_common.h', 'nanopb/pb_common.c', 'nanopb/pb_decode.h', 'nanopb/pb_decode.c']
  end

  s.module_name  = "nanopb"

  # s.resource_bundles = {
  #   "#{s.module_name}_Privacy" => 'spm_resources/PrivacyInfo.xcprivacy'
  # }
end

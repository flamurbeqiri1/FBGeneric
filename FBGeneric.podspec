Pod::Spec.new do |spec|
  spec.name         = "FBGeneric"
  spec.version      = "0.0.1"
  spec.summary      = "FBGeneric a library that has Services and Helpers and Extensions."
  spec.description  = <<-DESC
  FBGeneric a library that has Services and Helpers and Extensions.
                   DESC
  spec.homepage     = "https://github.com/flamurbeqiri1/FBGeneric"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Flamur Beqiri" => "flamurbeqiri1@gmail.com" }
  spec.ios.deployment_target = "12.0"
  spec.source       = { :git => "https://github.com/flamurbeqiri1/FBGeneric.git", :tag => "#{spec.version}" }
  spec.source_files  = "FBGeneric/**/*.{h,m}"
end

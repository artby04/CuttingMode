Pod::Spec.new do |s|
  s.name             = 'GeneralModule'
  s.author          = { "Username" => "Artyom" }
  s.version          = '1.0.0'
  s.summary          = 'General module'
  s.homepage        = "https://github.com/username/MyCustomPod"
  s.source          = { :git => "https://github.com/username/MyCustomPod.git", :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'

  s.source_files = '**/*.{swift,m}', 'GeneralModule.h'

  s.dependency 'SnapKit'
  s.dependency 'UIModule'
end

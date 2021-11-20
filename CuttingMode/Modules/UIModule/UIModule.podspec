Pod::Spec.new do |s|
  s.name             = 'UIModule'
  s.author          = { "Username" => "Artyom" }
  s.version          = '1.0.0'
  s.summary          = 'Module for UI components equal for other modules.'
  s.homepage        = "https://github.com/username/MyCustomPod"
  s.source          = { :git => "https://github.com/username/MyCustomPod.git", :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'

  s.source_files = '**/*.{swift,m}'

  s.dependency 'SnapKit'
end

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

def native_pods
  pod 'SnapKit'
end

def native_modules
  pod 'GeneralModule', :path => 'CuttingMode/Modules/GeneralModule'
  pod 'UIModule', :path => 'CuttingMode/Modules/UIModule'
end

target 'CuttingMode' do
  native_pods
  native_modules
end

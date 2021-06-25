platform :ios, '14.5'
use_frameworks!

target 'Jade-Mainframe' do
    pod 'SwiftGen', '~> 6.0'
    pod 'SwiftFormat/CLI'
    pod 'SwiftLint'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
    config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
  end
 end
end

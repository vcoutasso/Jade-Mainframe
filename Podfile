platform :ios, '14.4'
use_frameworks!

target 'Teco' do
    pod 'SwiftGen', '~> 6.0'
    pod 'SwiftFormat/CLI'
    pod 'SwiftLint'
end

post_install do |installer|
  # Download and set pre-commit hook file. The purpose of this is to ensure that SwiftFormat will be ran before commiting
  system("PRE_COMMIT=\".git/hooks/pre-commit\" sh -c 'if [ ! -e \"${PRE_COMMIT}\" ]; then echo \"Downloading git pre-commit hook file..\" && curl -s https://gist.githubusercontent.com/vcoutasso/5933653035713e5e9a53be8e93e5ac0b/raw/c589a8f3fb9443f54726820d2645e669593f32e5/pre-commit > $PRE_COMMIT && chmod +x $PRE_COMMIT; fi'")
  # Download and set post-checkout hook file. This ensures that xcodegen is ran before installing pods
  system("POST_CHECKOUT=\".git/hooks/post-checkout\" sh -c 'if [ ! -e \"${POST_CHECKOUT}\" ]; then echo \"Downloading git post-checkout hook file..\" && curl -s https://gist.githubusercontent.com/vcoutasso/ce5542c63a268166c8d182b4372f98b2/raw/cf3c8614c1e4183fd0fc3cbe181c8555d852c3b5/post-checkout > $POST_CHECKOUT && chmod +x $POST_CHECKOUT; fi'")
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
    config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
  end
 end
end

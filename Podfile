# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Tata_AIG_Assignment' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Tata_AIG_Assignment

  pod 'PKHUD'
  pod 'IQKeyboardManagerSwift'
  pod 'Alamofire'
  pod 'SDWebImage'


  target 'Tata_AIG_AssignmentTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Tata_AIG_AssignmentUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end

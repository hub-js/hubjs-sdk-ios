source 'https://cdn.cocoapods.org/'

abstract_target :example do
  use_frameworks!
  inhibit_all_warnings!
  project 'HubjsTracker'
  workspace 'HubjsTracker'

  target :iOSExampleApp do
    platform :ios, '10.0'
    project 'Example/ios/ios'
    pod 'HubjsTracker', path: './'
  end

  target :macOSExampleApp do
    platform :osx, '10.13'
    project 'Example/macos/macos'
    pod 'HubjsTracker', path: './'
  end

  target :tvOSExampleApp do
    platform :tvos, '10.2'
    project 'Example/tvos/tvos'
    pod 'HubjsTracker', path: './'
  end

end

target 'HubjsTrackerTests' do
  use_frameworks!
  platform :ios, '9.0'
  inhibit_all_warnings!
  project 'HubjsTracker'
  workspace 'HubjsTracker'
  inherit! :search_paths
  
  pod 'Quick', '~> 3.0'
  pod 'Nimble', '~> 9.0'
end

Pod::Spec.new do |spec|
  spec.name         = "HubjsTracker"
  spec.version      = "1.0.0"
  spec.summary      = "A Hubjs Tracker written in Swift for iOS, tvOS and macOS apps."
  spec.homepage     = "https://github.com/hubjs/hubjs-sdk-ios/"
  spec.license      = {  }
  spec.author       = { "Nguyen Ba Cong" => "ngbacong@gmail.com"}
  spec.source       = { :git => "https://github.com/hubjs/hubjs-sdk-ios.git", :tag => "v#{spec.version}" }
  spec.ios.deployment_target = '10.0'
  spec.tvos.deployment_target = '10.0'
  spec.osx.deployment_target = '10.12'
  spec.requires_arc = true
  spec.default_subspecs = 'Core'
  spec.swift_version = '5.0'
  
  spec.ios.frameworks = 'UIKit'
  spec.tvos.frameworks = 'UIKit'
  
  spec.subspec 'Core' do |core|
  	core.source_files = 'HubjsTracker/*.swift'
  end
end

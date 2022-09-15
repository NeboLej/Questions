source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

def shared_pods
  pod 'Alamofire', '~> 4.7'
  pod 'RxSwift',    '~> 6.1'
  pod 'RxCocoa',    '~> 6.1'
  pod 'RxRelay',    '~> 6.1'
  pod 'GRDB.swift', '4.2.1'
  pod 'SwiftMVVM-Rx-SOA', :git => 'https://github.com/AlexExiv/SwiftMVVM-Rx-SOA.git', :branch => 'rxswift-6.1'
  pod 'RxEntity', :git => 'https://github.com/AlexExiv/RxEntity-Swift.git', :branch => 'release/0.7.0'
end

target 'Questions' do
  shared_pods
end

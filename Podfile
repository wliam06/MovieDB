platform :ios, '10.0'

use_frameworks!

def frameworks
  pod 'Alamofire', '~> 5.2'
  pod 'RxSwift'
  pod 'RxCocoa'
end

def test_frameworks
  pod 'RxBlocking', '6.2.0'
  pod 'RxTest', '6.2.0'
end

target 'MovieDB' do
  frameworks
end

target 'MovieDBTests' do
  inherit! :search_paths
  frameworks
end

target 'MovieDBUITests' do
  inherit! :search_paths
  frameworks
end
platform :ios, '10.0'

use_frameworks!

def frameworks
  pod 'Alamofire', '5.4.3'
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'RxAlamofire', '6.1.1'
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
  test_frameworks
end

target 'MovieDBUITests' do
  inherit! :search_paths
  test_frameworks
end
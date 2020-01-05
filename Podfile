source 'git@github.com:wliam06/MovieSpecs.git'

platform :ios, '9.0'
inhibit_all_warnings!

use_frameworks!

def movie_frameworks
  pod 'MovieSDK'#, :path => '../MovieFreeAPI'
end

target 'MovieDB' do
  movie_frameworks
end

target 'MovieDBTests' do
  inherit! :search_paths
  movie_frameworks
end

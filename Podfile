# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'git@github.com:wliam06/MovieSpecs.git'
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

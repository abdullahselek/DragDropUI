platform :ios, '9.0'
use_frameworks!

def product_pods
	pod 'DragDropUI', :path => '.'
end

workspace 'DragDropUI.xcworkspace'
project 'DragDropUI.xcodeproj'

target 'DragDropUITests' do
	inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
end

target 'Sample' do
	project 'Sample/Sample.xcodeproj'
    inherit! :search_paths
    product_pods
end

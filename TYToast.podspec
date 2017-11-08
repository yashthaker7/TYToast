#
# Be sure to run `pod lib lint TYToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TYToast'
  s.version          = '0.1.0'
  s.summary          = 'TYToast is an swift category that adds toast notifications to the UIView object class.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 TYToast is intended to be simple, lightweight, and easy to use. Most toast notifications can be triggered with a single line of code.
                       DESC

  s.homepage         = 'https://github.com/yashthaker7/TYToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yashthaker7' => 'yashthaker7@gmail.com' }
  s.source           = { :git => 'https://github.com/yashthaker7/TYToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TYToast/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TYToast' => ['TYToast/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

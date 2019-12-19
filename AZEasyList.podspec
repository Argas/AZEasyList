#
# Be sure to run `pod lib lint AZEasyList.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AZEasyList'
  s.version          = '0.0.5'
  s.summary          = 'Draws UI in the UITableView or stackView from the models'
  s.swift_versions = ['4.2', '5.0', '5.1']
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Draws UI in the UITableView or stackView from the models.
It can draw view graph from the models graph
                       DESC

  s.homepage         = 'https://github.com/Argas/AZEasyList'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aleksey Zverev' => 'argas.91@gmail.com' }
  s.source           = { :git => 'https://github.com/Argas/AZEasyList.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'AZEasyList/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AZEasyList' => ['AZEasyList/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

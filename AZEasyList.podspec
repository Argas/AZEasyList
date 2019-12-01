#
# Be sure to run `pod lib lint AZEasyList.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AZEasyList'
  s.version          = '0.1.0'
  s.summary          = 'Draws UI in the UITableView or stackView from the models'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Draws UI in the UITableView or stackView from the models
                       DESC

  s.homepage         = 'https://github.com/argas.91@gmail.com/AZEasyList'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aleksey Zverev' => 'argas.91@gmail.com' }
  s.source           = { :git => 'https://github.com/argas.91@gmail.com/AZEasyList.git', :tag => s.version.to_s }
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

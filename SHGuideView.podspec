#
# Be sure to run `pod lib lint SHGuideView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'SHGuideView'
s.version          = '0.1.0'
s.summary          = 'A simple custom GuideView.'
s.homepage         = 'https://github.com/harushuu/SHGuideView'
s.screenshots      = 'https://github.com/harushuu/SHGuideView/raw/master/Screenshots.gif'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { '@harushuu' => 'hunter4n@gmail.com' }
s.source           = { :git => 'https://github.com/harushuu/SHGuideView.git', :tag => '0.1.0' }
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = 'SHGuideView/*'
s.frameworks = 'UIKit'
s.dependency 'BFPaperButton', '~> 2.0.29'
s.dependency 'Masonry', '~> 0.6.4'

end

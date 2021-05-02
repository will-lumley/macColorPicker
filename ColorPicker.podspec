#
# Be sure to run `pod lib lint ColorPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name         = "ColorPicker"
  s.version      = "1.0.0"
  s.summary      = "A pure Swift library to detect favicons use by a website."
  s.homepage     = "https://github.com/will-lumley/ColorPicker.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  
  s.description      = <<-DESC
    ColorPicker is a tiny, pure Swift library designed for macOS applications that allows you to let your users easily choose a color.
                          DESC

  s.author             = { "William Lumley" => "will@lumley.io" }
  s.social_media_url   = "http://twitter.com/wlumley95"

  s.osx.deployment_target = "10.12"
  
  s.swift_version         = '5.0'
  
  s.source       = { :git => "https://github.com/will-lumley/ColorPicker.git", :tag => s.version.to_s }
  
  s.source_files = 'Sources/**/*/*'
end

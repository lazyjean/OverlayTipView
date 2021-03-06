# coding: utf-8
#
# Be sure to run `pod lib lint OverlayTipView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OverlayTipView'
  s.version          = '0.2.0'
  s.summary          = '浮层提示工具类'
  s.description      = <<-DESC
                        浮层提示工具类, 设计为UIView的扩展
                       DESC
  s.homepage         = 'https://github.com/lazyjean/OverlayTipView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuzhen' => 'lazy66@me.com' }
  s.source           = { :git => 'https://github.com/lazyjean/OverlayTipView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'OverlayTipView/**/*'
  s.public_header_files = 'OverlayTipView/**/*.h'
  s.frameworks = 'UIKit'
end

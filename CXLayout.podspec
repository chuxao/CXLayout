Pod::Spec.new do |s|
 s.name     = 'CXLayout'
 s.version  = '1.0'
 s.license  = { :type => "MIT", :file => "LICENSE" }
 s.summary  = 'Harness the power of Auto Layout NSLayoutConstraints with a simplified, chainable and expressive syntax.'
 s.homepage = 'https://github.com/chuxiaojiajia/CXLayout'
 s.author   = { 'xiao chu' => '1402778172@qq.com' }
 s.source   = { :git => 'https://github.com/chuxiaojiajia/CXLayout.git', :tag => "1.0" }
 s.platform = :ios
 s.source_files = 'CXLayout/*.{h,m}'
 s.ios.deployment_target = '7.0'
 s.frameworks = 'Foundation', 'UIKit'
 s.requires_arc = true
end

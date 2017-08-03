Pod::Spec.new do |s|
  s.name             = 'ScrollHorizontallyView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ScrollHorizontally.'
  s.homepage         = 'https://github.com/Jiexiang617/ScrollHorizontallyView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jiexiang' => 'jiexiang617@gmail.com' }
  s.source           = { :git => 'https://github.com/Jiexiang617/ScrollHorizontallyView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'ScrollHorizontally/Classes/**/*'
  s.resources = 'ScrollHorizontally/Classes/*.xib'
  s.requires_arc = true
end

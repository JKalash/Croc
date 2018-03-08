Pod::Spec.new do |s|
  s.name             = 'Croc'
  s.version          = '0.0.1'
  s.summary          = 'Elegant Emoji Parsing in Swift'
 
  s.description      = <<-DESC
A lightweight emoji string parsing library. Count the number of emojis in a string. Strip away emojis or non-emoji character. Fetch set of emojis from a string.
                       DESC
 
  s.homepage         = 'https://github.com/JKalash/Croc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joseph Kalash' => 'josephkalash@gmail.com' }
  s.source           = { :git => 'https://github.com/JKalash/Croc.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.{swift}'
 
end

Pod::Spec.new do |s|
  s.name             = 'JKEmoji'
  s.version          = '0.1.0'
  s.summary          = 'Elegant Emoji Parsing in Swift'
 
  s.description      = <<-DESC
A lightweight emoji string parsing library. Count the number of emojis in a string. Strip away emojis or non-emoji character. Fetch set of emojis from a string.
                       DESC
 
  s.homepage         = 'https://github.com/JKalash/JKEmoji'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joseph Kalash' => 'josephkalash@gmail.com' }
  s.source           = { :git => 'https://github.com/JKalash/JKEmoji.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'JKEmoji/JKEmoji.swift'
 
end

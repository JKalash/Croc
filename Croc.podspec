Pod::Spec.new do |s|
  s.name             = 'Croc'
  s.version          = '0.1.1'
  s.summary          = 'Elegant Emoji Parsing in Swift'
 
  s.description      = <<-DESC
  Croc is a library for parsing emojis on iOS. It provides a simple and lightweight interface for detecting, generating, categorizing and managing emoji characters, making emoji-powered features an easy task for developers.
                       DESC
 
  s.homepage         = 'https://github.com/JKalash/Croc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe Kalash' => 'josephkalash@gmail.com' }
  s.source           = { :git => 'https://github.com/JKalash/Croc.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.swift_version = '4.2'
  
  s.source_files = 'Source/*.swift'
  s.resources = 'py/*.json'
 
end

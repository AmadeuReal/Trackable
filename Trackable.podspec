
Pod::Spec.new do |s|
  s.name             = 'Trackable'
  s.version          = '0.1.0'
  s.summary          = 'Control variable changes.'

  s.description      = <<-DESC
Just a small lib that helps you gain control of your variables
                       DESC

  s.homepage         = 'https://github.com/AmadeuReal/Trackable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AmadeuReal' => 'amadeureal@hotmail.com' }
  s.source           = { :git => 'https://github.com/AmadeuReal/Trackable.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AmadeuReal'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Trackable/Classes/**/*'
  s.frameworks = 'Foundation'
end

Gem::Specification.new do |s|
  s.name        = 'sinatra-fix_951'
  s.version     = '1.0.1'
  s.description = "Fix bug #951 in Sinatra version 1.4.5"
  s.summary     = "Fixes bug on Sinatra 1.4.5 you get 'Undefined method join for <#String:123123132>'"
  s.authors     = ["Josh Cheek"]
  s.email       = "josh.cheek@gmail.com"
  s.homepage    = "https://github.com/JoshCheek/sinatra-fix_951"
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = ['test.rb']

  s.add_dependency 'sinatra', '= 1.4.5'
end

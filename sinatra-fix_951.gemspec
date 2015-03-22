Gem::Specification.new do |s|
  s.name        = 'sinatra-fix_951'
  s.version     = '1.0.0'
  s.description = "Fix bug #951 in Sinatra version 1.4.5"
  s.summary     = "My students at the Turing School of Software and Design have been hitting this bug for three or four months now. Finally decided to just fix it."
  s.authors     = ["Josh Cheek"]
  s.email       = "josh.cheek@gmail.com"
  s.homepage    = "https://github.com/JoshCheek/sinatra-fix_951"
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = ['test.rb']

  s.add_dependency 'sinatra', '= 1.4.5'
end

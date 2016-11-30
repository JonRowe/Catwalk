# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "catwalk/version"

Gem::Specification.new do |s|
  s.name        = "catwalk"
  s.version     = Catwalk::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jon Rowe"]
  s.email       = ["hello@jonrowe.co.uk"]
  s.homepage    = "http://github.com/JonRowe/catwalk"
  s.summary     = %q{Catwalk is a gem for showing off models. It allows you to seperate presentation logic from data models.}
  s.description = %q{Catwalk is a gem for showing off models. It allows you to seperate presentation logic from data models.}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/* .autotest`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  if RUBY_VERSION.to_f >= 2
    s.add_development_dependency "rake", '~> 11.0'
  else
    s.add_development_dependency "rake", '~> 10.0'
  end
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'autotest-standalone'

  if RUBY_VERSION.to_f == 1.8 || RUBY_VERSION == '1.9.2'
    s.add_development_dependency 'activemodel', '~> 3.2'
    s.add_development_dependency 'i18n', '<= 0.6.11'
    s.add_development_dependency 'cucumber', '< 2.0.0'
  else
    if RUBY_VERSION < '2.2.2'
      s.add_development_dependency 'activemodel', '< 5'
    else
      s.add_development_dependency 'activemodel'
    end
    s.add_development_dependency 'cucumber'
  end
end

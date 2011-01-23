# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "catwalk/version"

Gem::Specification.new do |s|
  s.name        = "catwalk"
  s.version     = Catwalk::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jon Rowe"]
  s.email       = ["hello@jonrowe.co.uk"]
  s.homepage    = "http://github.com/jonrowe/catwalk"
  s.summary     = %q{Catwalk is a gem for showing off models. It allows you to seperate presentation logic from data models.}
  s.description = %q{Catwalk is a gem for showing off models. It allows you to seperate presentation logic from data models.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {.autotest,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

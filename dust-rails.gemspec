# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dust-rails/version"

Gem::Specification.new do |s|
  s.name        = "dust-rails"
  s.version     = Dust::Rails::VERSION
  s.authors     = ["Hoseong Hwang"]
  s.email       = ["thefron@wafflestudio.com"]
  s.homepage    = "https://github.com/thefron/dust-rails"
  s.summary     = %q{Use dust.js with rails}
  s.description = %q{This gem makes you dust.js easy to use with rails.}

  s.rubyforge_project = "dust-rails"

  s.add_dependency('rails', '~> 3.1.0')
  s.add_dependency('tilt')
  s.add_dependency('execjs')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

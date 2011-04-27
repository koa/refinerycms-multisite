# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "refinerycms-multisite/version"

Gem::Specification.new do |s|
  s.name        = "refinerycms-multisite"
  s.version     = Refinerycms::Multisite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andreas König"]
  s.email       = ["koa@panter.ch"]
  s.homepage    = ""
  s.summary     = %q{Multisite-Plugin for Refinery-CMS}
  s.description = %q{Manage multiple Site with Refinery-CMS}

  s.rubyforge_project = "refinerycms-multisite"
  s.add_dependency "refinerycms-pages"
  s.add_development_dependency "refinerycms-testing"
  s.add_development_dependency "shoulda-matchers"


  s.files         = `git ls-files | grep -v ^script`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

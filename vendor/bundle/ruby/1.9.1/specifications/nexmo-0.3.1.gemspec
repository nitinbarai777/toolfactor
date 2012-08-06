# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "nexmo"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Craft"]
  s.date = "2012-05-28"
  s.description = "A simple wrapper for the Nexmo API"
  s.email = ["mail@timcraft.com"]
  s.homepage = "http://github.com/timcraft/nexmo"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "See description"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, ["~> 1.5"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<json>, ["~> 1.5"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, ["~> 1.5"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end

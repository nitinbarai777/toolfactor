# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "nifty-generators"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Bates"]
  s.date = "2010-04-19"
  s.description = "A collection of useful Rails generator scripts for scaffolding, layout files, authentication, and more."
  s.email = "ryan@railscasts.com"
  s.homepage = "http://github.com/ryanb/nifty-generators"
  s.require_paths = ["lib"]
  s.rubyforge_project = "nifty-generators"
  s.rubygems_version = "1.8.24"
  s.summary = "A collection of useful Rails generator scripts."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

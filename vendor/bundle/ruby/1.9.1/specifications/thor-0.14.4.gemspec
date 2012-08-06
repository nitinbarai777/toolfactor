# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "thor"
  s.version = "0.14.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yehuda Katz", "Jos\u{c3}\u{a9} Valim"]
  s.date = "2010-11-04"
  s.description = "A scripting framework that replaces rake, sake and rubigen"
  s.email = "ruby-thor@googlegroups.com"
  s.executables = ["thor", "rake2thor"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "LICENSE", "README.md", "Thorfile"]
  s.files = ["bin/thor", "bin/rake2thor", "CHANGELOG.rdoc", "LICENSE", "README.md", "Thorfile"]
  s.homepage = "http://yehudakatz.com"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "textmate"
  s.rubygems_version = "1.8.24"
  s.summary = "A scripting framework that replaces rake, sake and rubigen"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

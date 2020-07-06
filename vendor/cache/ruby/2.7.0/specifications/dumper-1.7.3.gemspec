# -*- encoding: utf-8 -*-
# stub: dumper 1.7.3 ruby lib

Gem::Specification.new do |s|
  s.name = "dumper".freeze
  s.version = "1.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kenn Ejima".freeze]
  s.date = "2017-11-09"
  s.description = "Dumper is a backup management system that offers a whole new way to take daily backups of your databases.".freeze
  s.email = ["kenn.ejima@gmail.com".freeze]
  s.executables = ["dumper".freeze]
  s.files = ["bin/dumper".freeze]
  s.homepage = "https://github.com/kenn/dumper".freeze
  s.rubygems_version = "3.1.3".freeze
  s.summary = "The Dumper Agent for Rails".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<multi_json>.freeze, [">= 1.0"])
    s.add_runtime_dependency(%q<multipart-post>.freeze, [">= 1.1.5"])
    s.add_runtime_dependency(%q<posix-spawn>.freeze, [">= 0.3.6"])
    s.add_development_dependency(%q<mongo_mapper>.freeze, [">= 0"])
    s.add_development_dependency(%q<mongoid>.freeze, [">= 0"])
    s.add_development_dependency(%q<rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<redis>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<multi_json>.freeze, [">= 1.0"])
    s.add_dependency(%q<multipart-post>.freeze, [">= 1.1.5"])
    s.add_dependency(%q<posix-spawn>.freeze, [">= 0.3.6"])
    s.add_dependency(%q<mongo_mapper>.freeze, [">= 0"])
    s.add_dependency(%q<mongoid>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<redis>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end

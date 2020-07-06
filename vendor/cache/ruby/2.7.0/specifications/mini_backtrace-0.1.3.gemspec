# -*- encoding: utf-8 -*-
# stub: mini_backtrace 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "mini_backtrace".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ken Collins".freeze]
  s.date = "2012-01-03"
  s.description = "MiniBacktrace allows you to take advantage of the Rails.backtrace_cleaner when using MiniTest. This includes everyone using Rails 3 with Ruby 1.9.".freeze
  s.email = ["ken@metaskills.net".freeze]
  s.homepage = "http://github.com/metaskills/mini_backtrace".freeze
  s.rubygems_version = "3.1.3".freeze
  s.summary = "Integrates the Rails.backtrace_cleaner with MiniTest.".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<minitest>.freeze, ["> 1.2.0"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 2.3.3"])
  else
    s.add_dependency(%q<minitest>.freeze, ["> 1.2.0"])
    s.add_dependency(%q<rails>.freeze, [">= 2.3.3"])
  end
end

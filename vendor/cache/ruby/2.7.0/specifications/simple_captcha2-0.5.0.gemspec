# -*- encoding: utf-8 -*-
# stub: simple_captcha2 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_captcha2".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Pavlo Galeta".freeze, "Igor Galeta".freeze, "Stefan Wienert".freeze, "Konrad Mallok".freeze]
  s.date = "2019-12-05"
  s.description = "SimpleCaptcha is available to be used with Rails 3 + 4 or above and also it provides the backward compatibility with previous versions of Rails.".freeze
  s.email = "stwienert@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/pludoni/simple-captcha".freeze
  s.rubygems_version = "3.1.3".freeze
  s.summary = "SimpleCaptcha is the simplest and a robust captcha plugin.".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.1"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_development_dependency(%q<capybara-mechanize>.freeze, [">= 0"])
    s.add_development_dependency(%q<poltergeist>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<capybara-mechanize>.freeze, [">= 0"])
    s.add_dependency(%q<poltergeist>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dynamic_sass}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Lea"]
  s.date = %q{2009-06-11}
  s.email = %q{contrib@tomlea.co.uk}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "test/dynamic_sass_test.rb", "test/test_helper.rb", "rails/init.rb", "config/routes.rb", "app/controllers", "app/controllers/dynamic_sass", "app/controllers/dynamic_sass/stylesheets_controller.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://cwninja.com/}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Plugin to generate SASS on the fly instead of before each request.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end

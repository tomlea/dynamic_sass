RAILS_ENV = ENV["RAILS_ENV"] = "test"
RAILS_ROOT = File.join(File.dirname(__FILE__), "..")

require "rubygems"

gem "rails"
require "initializer"

Rails::Initializer

module Rails
  def vendor_rails?
    false
  end
  class Initializer
    def load_environment
    end
  end
  extend self
end

require "active_support"
require "action_controller"
require "haml"
require "sass"

Rails::Initializer.run(:set_load_path)

require 'test_help'
require "shoulda"
require "dynamic_sass/stylesheets_controller"
require File.join(File.dirname(__FILE__), *%w[.. config routes])


require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  
  # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  require "rails/application"
  Spork.trap_method(Rails::Application, :reload_routes!)
  
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Capybara
  require 'capybara/rails'
  require 'capybara/rspec'
  
  Capybara.default_host = 'http://www.example.com'
  Capybara.server_port = 3567
  Capybara.app_host = 'http://lvh.me:3567'
  

  RSpec.configure do |config|
    # Mock Framework
    config.mock_with :rspec
  end
  
  OmniAuth.config.test_mode = true
end

Spork.each_run do
  RSpec.configure do |config|
    # Filtering
    config.filter_run_excluding :manual => true
    config.filter_run_excluding :integration => true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
  end
  
  # Requires supporting ruby files
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  Dir[Rails.root.join("spec/**/*_examples.rb")].each {|f| require f}
  
  # # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  # Factory.definition_file_paths = [File.join(Rails.root, 'spec', 'factories')]
  # Factory.find_definitions
end
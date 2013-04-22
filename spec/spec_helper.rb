require 'rubygems'
require 'spork'
require 'capybara/poltergeist'

Spork.prefork do

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'database_cleaner'

  Capybara.javascript_driver = :selenium # :selenium (Firefox) :poltergeist (headless browser)
  Capybara.server_port = '54163'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  Dir[Rails.root.join("spec/helpers/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|

    config.mock_with :mocha
    config.use_transactional_fixtures = false
    config.color_enabled = true

    config.include Warden::Test::Helpers, :type => :feature
    config.include FeatureMacros, :type => :feature

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
end

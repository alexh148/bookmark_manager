require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'helper'
require_relative '../app.rb'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = BookmarkApp

RSpec.configure do |config|
  config.before(:each) do
    truncate_test_db
  end
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

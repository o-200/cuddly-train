# frozen_string_literal: true

require 'rspec'
require 'rack/test'
require 'database_cleaner'
require 'database_cleaner-sequel'

require_relative '../app/router/application_router'
require_relative '../app/router/user_router'
require_relative '../config/database/connection'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    DB = Config::Database::Connection.new.db

    DatabaseCleaner[:sequel].strategy = :transaction
    DatabaseCleaner[:sequel].clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].start
  end

  config.after(:each) do
    DatabaseCleaner[:sequel].clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
end

def app
  App::Router::ApplicationRouter
end

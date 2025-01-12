# frozen_string_literal: true

source 'https://rubygems.org' do
  gem 'sequel', '~> 5.88'
  gem 'sqlite3', '~> 2.5.0'

  gem 'puma', '~> 6.5'
  gem 'rack', '~> 3.1'

  gem 'interactor', '~> 3.1'

  gem 'bcrypt', '~> 3.1'
  gem 'dry-validation', '~> 1.11'

  group :test do
    gem 'capybara', '~> 3.40'
    gem 'database_cleaner', '~> 2.1'
    gem 'database_cleaner-sequel'
    gem 'rack-test'
    gem 'rspec'
  end

  group :development do
    gem 'rubocop'
    gem 'rubocop-capybara'
    gem 'rubocop-rspec'
    gem 'rubocop-sequel'
  end
end

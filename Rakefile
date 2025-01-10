# frozen_string_literal: true

require 'sequel'
require_relative 'config/database/connection'

namespace :db do
  DB = Config::Database::Connection.new.db
  MIGRATIONS_PATH = './config/database/migrations'

  migrate = lambda do |version|
    Sequel.extension :migration
    Sequel::Migrator.run(DB, MIGRATIONS_PATH, target: version)
  end

  task :migrate do
    migrate.call(nil)
  end

  task :rollback do
    latest = DB[:schema_info].select_map(:version).first
    migrate.call(latest - 1)
  end

  task :reset do
    migrate.call(0)
    Sequel::Migrator.run(DB, MIGRATIONS_PATH)
  end
end

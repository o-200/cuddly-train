# frozen_string_literal: true

require_relative 'app/router/application_router'
require_relative 'app/router/user_router'

require_relative 'config/database/connection'

DB = Config::Database::Connection.connect

unless DB.table_exists?(:users)
  DB.create_table(:users) do
    primary_key :id
    String :name, null: false
    Integer :age, null: false
    DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
  end
end

run App::Router::ApplicationRouter

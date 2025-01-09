# frozen_string_literal: true

require_relative 'app/router/application_router'
require_relative 'app/router/user_router'
require_relative 'config/database/connection'

DB = Config::Database::Connection.new.db

run App::Router::ApplicationRouter

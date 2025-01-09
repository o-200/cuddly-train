# frozen_string_literal: true

require 'sequel'
require 'logger'

module Config
  module Database
    class Connection
      attr_reader :db

      def initialize
        @db = Sequel.sqlite('./config/database/database.db', logger: Logger.new($stdout))
      end
    end
  end
end

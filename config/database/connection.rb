# frozen_string_literal: true

require 'sequel'

module Config
  module Database
    class Connection
      def self.connect
        @connect ||= Sequel.sqlite('./config/database/database.db')
      end

      def self.db
        connect
      end
    end
  end
end

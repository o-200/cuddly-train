# frozen_string_literal: true

module App
  module Repositories
    class UserRepository
      def all
        DB[:users].all
      end

      def find_by(*params)
        DB[:users].find(params).first
      end

      def create(params)
        DB[:users] << params
      end
    end
  end
end

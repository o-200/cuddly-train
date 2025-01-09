# frozen_string_literal: true

module App
  module Presenters
    class User
      def initialize(entity)
        @name       = entity.name
        @age        = entity.age
        @created_at = entity.created_at
      end
    end
  end
end

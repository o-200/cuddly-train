# frozen_string_literal: true

module App
  module Presenters
    module User
      class Registration
        def initialize(entity)
          @email      = entity.email
          @created_at = entity.created_at
        end

        def present
          {
            email: @email,
            created_at: @created_at
          }
        end
      end
    end
  end
end

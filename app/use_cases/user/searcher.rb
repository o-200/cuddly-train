# frozen_string_literal: true

require_relative '../../entities/user'
require_relative '../../services/user_service'

module App
  module UseCases
    module User
      class Searcher
        def call(params)
          user = UserService.new.find_uparaser(params)
          Entities::User.new(user)
        end
      end
    end
  end
end

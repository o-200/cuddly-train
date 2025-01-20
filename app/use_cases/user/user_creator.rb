# frozen_string_literal: true

require_relative '../application_use_case'
require_relative '../../entities/user'
require_relative '../../repositories/user_repository'

module App
  module UseCases
    module User
      class UserCreator < ApplicationUseCase
        def call(params)
          user = Entities::User.new(params)
          Repositories::UserRepository.new.create(user.to_h)
          user
        end
      end
    end
  end
end

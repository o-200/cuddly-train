# frozen_string_literal: true

require_relative '../application_use_case'
require_relative '../../entities/user'
require_relative '../../repositories/user_repository'

module App
  module UseCases
    module User
      class Searcher < ApplicationUseCase
        def call(params)
          user = Repositories::UserRepository.new.find_by(params)
          Entities::User.new(user)
        end
      end
    end
  end
end

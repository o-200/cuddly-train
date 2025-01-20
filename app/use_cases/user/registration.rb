# frozen_string_literal: true

require_relative 'user_creator'
require_relative '../application_use_case'
require_relative '../../entities/user'
require_relative '../../validations/user/registration'
require_relative '../../repositories/user_repository'

module App
  module UseCases
    module User
      class Registration < ApplicationUseCase
        def call
          validation = App::Validations::User::Registration.new.call(params)
          if validation.success?
            UserCreator.new.call(params)
          else
            context.fail!(errors: validation.errors.to_h)
          end
        end
      end
    end
  end
end

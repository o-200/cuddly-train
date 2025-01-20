# frozen_string_literal: true

require_relative 'user_searcher'
require_relative '../application_use_case'
require_relative '../../validations/user/authorization'

module App
  module UseCases
    module User
      class Authorization < ApplicationUseCase
        def call
          validation = Validations::User::Authorization.new.call(params)
          context.fail!(errors: validation.errors.to_h) if validation.failure?

          user = Searcher.new.call(params)
          if user.authenticate(params[:password])
            context.token = JWT.encode({ user_id: user.id }, SECRET_KEY, 'HS256')
          else
            context.fail!(errors: 'wrong password')
          end
        end
      end
    end
  end
end

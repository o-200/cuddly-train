# frozen_string_literal: true

require 'bcrypt'
require 'jwt'

require_relative 'application_use_case'
require_relative 'searcher'
require_relative '../../entities/user'
require_relative '../../validations/user/registration'
require_relative '../../validations/user/authorization'

module App
  module UseCases
    module User
      class Authorization < ApplicationUseCase
        include BCrypt

        def call
          validation = Validations::User::Authorization.new.call(params)
          context.fail!(errors: validation.errors.to_h) if validation.failure?

          user = DB[:users].find(email: params[:email]).first
          user_entity = App::Entities::User.new(user)

          if user_entity.authenticate(params[:password])
            context.token = JWT.encode({ user_id: user[:id] }, SECRET_KEY, 'HS256')
          else
            context.fail!(errors: 'wrong password')
          end
        end
      end
    end
  end
end

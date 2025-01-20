# frozen_string_literal: true

require_relative 'application_controller'
require_relative '../use_cases/user/registration'
require_relative '../use_cases/user/authorization'

module App
  module Controllers
    class UserController < ApplicationController
      def register(params)
        registration = UseCases::User::Registration.call(params: normalize_params(params))
        if registration.success?
          {
            message: 'User successfully created!',
            user: Presenters::User::Registration.new(registration).present
          }
        else
          { errors: registration.errors }
        end
      end

      def login(params)
        authorization = UseCases::User::Authorization.call(params: normalize_params(params))
        if authorization.success?
          { token: authorization.token }
        else
          { errors: authorization.errors }
        end
      end
    end
  end
end

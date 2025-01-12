# frozen_string_literal: true

require 'bcrypt'

require_relative 'application_use_case'
require_relative '../../entities/user'
require_relative '../../validations/user/registration'

module App
  module UseCases
    module User
      class Registration < ApplicationUseCase
        include Interactor

        def call
          params = context.params.transform_keys(&:to_sym).merge!(created_at: Time.now)

          validation = App::Validations::User::Registration.new.call(params)
          if validation.success?
            user = Entities::User.new(params)
            DB[:users] << user.to_h
          else
            context.fail!(errors: validation.errors.to_h)
          end
        end
      end
    end
  end
end

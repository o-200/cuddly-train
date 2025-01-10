# frozen_string_literal: true

require_relative 'application_use_case'
require_relative '../../entities/user'

module App
  module UseCases
    module User
      class UserCreator < ApplicationUseCase
        def call(params)
          params = params.transform_keys(&:to_sym)
          params.merge!(created_at: Time.now)

          raise unless params[:name]
          raise unless params[:age]

          user = Entities::User.new(params)
          DB[:users] << user.to_h

          user
        end
      end
    end
  end
end

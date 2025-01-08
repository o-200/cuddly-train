# frozen_string_literal: true

require_relative '../../entities/user'

module App
  module UseCases
    module User
      class UserCreator < ApplicationUseCase
        def self.call(params)
          params = params.transform_keys(&:to_sym)

          raise unless params[:name]
          raise unless params[:age]

          user = Entities::User.new(params)
          DB[:users] << user.present

          user
        end
      end
    end
  end
end

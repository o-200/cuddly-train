# frozen_string_literal: true

require_relative 'application_controller'

module App
  module Controllers
    class UserController < ApplicationController
      def register(params)
        registration = UseCases::User::Registration.call(params: params)
        if registration.success?
          Presenters::User::Registration.new(registration).present
        else
          { errors: registration.errors }
        end
      end
    end
  end
end

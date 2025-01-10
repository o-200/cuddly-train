# frozen_string_literal: true

require_relative 'application_controller'

module App
  module Controllers
    class UserController < ApplicationController
      def show(params)
        user = UseCases::User::Searcher.new.call(params)
        Presenters::User.new(user).present
      end

      def create(params)
        user = UseCases::User::UserCreator.new.call(params)
        Presenters::User.new(user).present
      end
    end
  end
end

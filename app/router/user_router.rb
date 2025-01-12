# frozen_string_literal: true

require_relative 'application_router'
require_relative '../controllers/users_controller'

module App
  module Router
    class UserRouter < ApplicationRouter
      route do |r|
        r.on 'users' do
          r.is 'register' do
            r.post do
              Controllers::UserController.new.register(r.params)
            end
          end
        end
      end
    end
  end
end

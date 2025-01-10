# frozen_string_literal: true

require_relative 'application_router'
require_relative '../controllers/users_controller'

module App
  module Router
    class UserRouter < ApplicationRouter
      route do |r|
        r.on 'users' do
          r.on Integer do |id|
            r.get do
              Controllers::UserController.new.show(r.params.merge(id: id))
            end
          end

          r.get do
            { users: DB[:users].all }
          end

          r.post do
            Controllers::UserController.new.create(r.params)
          end
        end
      end
    end
  end
end

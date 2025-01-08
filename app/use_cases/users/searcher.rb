# frozen_string_literal: true

require_relative '../../entities/user'

module App
  module UseCases
    module User
      class Searcher
        def self.call(params)
          raise unless params[:id]

          user = DB[:users].find(params).first
          Entities::User.new(user)
        end
      end
    end
  end
end

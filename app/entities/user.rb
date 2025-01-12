# frozen_string_literal: true

module App
  module Entities
    class User
      attr_accessor :email, :password, :created_at

      def initialize(params)
        @email         = params[:email]
        @password_hash = BCrypt::Password.create(params[:password])
        @created_at = params[:created_at]
      end

      def to_h
        {
          email: @email,
          password_hash: @password_hash,
          created_at: @created_at
        }
      end
    end
  end
end

# frozen_string_literal: true

require 'bcrypt'

module App
  module Entities
    class User
      include BCrypt

      attr_accessor :email, :password_digest, :created_at

      def initialize(params)
        @email = params[:email]
        @password_digest = params[:password_digest] || BCrypt::Password.create(params[:password])
        @created_at = params[:created_at]
      end

      def to_h
        {
          email: @email,
          password_digest: @password_digest,
          created_at: @created_at
        }
      end

      def password=(new_password)
        @password_digest = BCrypt::Password.create(new_password)
      end

      def authenticate(password)
        BCrypt::Password.new(@password_digest) == password
      end
    end
  end
end

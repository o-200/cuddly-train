# frozen_string_literal: true

require 'interactor'

require_relative '../../presenters/user/registration'

module App
  module UseCases
    class ApplicationUseCase
      include Interactor
      delegate :params, to: :context

      SECRET_KEY = '3q2-7w==8f1g2h3j4k5l6m7n8o9p0q1r2s3t4u5v6w7x8y9z0a1b2c3d4e5f6g7h8i9j'
    end

    class Error < RuntimeError
    end

    class ValidationError < Error
    end
  end
end

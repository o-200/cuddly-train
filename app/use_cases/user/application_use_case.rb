# frozen_string_literal: true

require 'interactor'

require_relative '../../presenters/user/registration'

module App
  module UseCases
    class ApplicationUseCase
    end

    class Error < RuntimeError
    end

    class ValidationError < Error
    end
  end
end

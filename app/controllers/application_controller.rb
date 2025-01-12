# frozen_string_literal: true

require_relative '../use_cases/user/registration'

module App
  module Controllers
    class ApplicationController
    end

    class Error < RuntimeError
    end

    class ValidationError < Error
    end
  end
end

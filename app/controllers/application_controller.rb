# frozen_string_literal: true

require_relative '../use_cases/user/registration'
require_relative '../use_cases/user/authorization'

module App
  module Controllers
    class ApplicationController
      def normalize_params(params)
        params.transform_keys(&:to_sym).merge!(created_at: Time.now)
      end
    end

    class Error < RuntimeError
    end

    class ValidationError < Error
    end
  end
end

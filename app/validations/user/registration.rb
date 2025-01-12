# frozen_string_literal: true

require 'dry-validation'

module App
  module Validations
    module User
      class Registration < Dry::Validation::Contract
        params do
          required(:email).value(:string)
          required(:password).value(:string)
        end
      end
    end
  end
end

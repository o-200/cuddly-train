# frozen_string_literal: true

module App
  module Entities
    class User
      attr_accessor :name, :age

      def initialize(params)
        @name = params[:name]
        @age  = params[:age]
      end

      def present
        {
          name: @name,
          age: @age
        }
      end
    end
  end
end

# frozen_string_literal: true

module App
  module Entities
    class User
      attr_accessor :name, :age, :created_at

      def initialize(params)
        @name       = params[:name]
        @age        = params[:age]
        @created_at = params[:created_at]
      end

      def to_h
        {
          name: @name,
          age: @age,
          created_at: @created_at
        }
      end
    end
  end
end

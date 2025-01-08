# frozen_string_literal: true

require 'roda'

module App
  module Router
    class ApplicationRouter < Roda
      plugin :json, classes: [Array, Hash]

      route do |r|
        r.root { { message: 'Welcome' } }

        r.run UserRouter
      end
    end
  end
end

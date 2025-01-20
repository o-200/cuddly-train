# frozen_string_literal: true

require 'spec_helper'
require 'bcrypt'

RSpec.describe App::Router::UserRouter, type: :request do
  describe '#POST' do
    let(:time_now) { Time.now }

    before do
      DB[:users] << { email: params[:email], password_digest: BCrypt::Password.create(params[:password]) } # TODO: use FactoryBot
      post 'users/login', params
    end

    context 'success' do
      let(:params) { { email: 'Dmitrij', password: 'password' } }

      context 'response' do
        it 'is successful' do
          expect(last_response).to be_ok # TODO: be_created
        end

        it 'has keys' do
          json_response = JSON.parse(last_response.body)

          expect(json_response).to have_key('token')
        end
      end
    end

    context 'failure' do
      let(:params) { { email: 'Dmitrij' } }

      context 'response' do
        it 'is unsuccessful' do
          expect(last_response).to be_ok # TODO: be_unprocessable_entity
        end

        it 'has error keys' do
          json_response = JSON.parse(last_response.body)

          expect(json_response).to have_key('errors')
        end
      end
    end
  end
end

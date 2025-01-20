# frozen_string_literal: true

require 'spec_helper'

RSpec.describe App::Router::UserRouter, type: :request do
  describe '#POST' do
    let(:time_now) { Time.now }

    before do
      post 'users/register', params
    end

    context 'success' do
      let(:params) { { email: 'Dmitrij', password: 'password' } }

      context 'response' do
        it 'is successful' do
          expect(last_response).to be_ok # TODO: be_created
        end

        it 'has keys' do
          json_response = JSON.parse(last_response.body)

          expect(json_response).to have_key('message')
          expect(json_response).to have_key('user')
          expect(json_response['user']).to have_key('email')
          expect(json_response['user']).to have_key('created_at')
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

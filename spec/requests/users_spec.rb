# frozen_string_literal: true

require 'spec_helper'

RSpec.describe App::Router::UserRouter, type: :request do
  describe '#GET' do
    context 'list' do
      before do
        10.times { |n| DB[:users] << { name: 'name', age: n } }
        get '/users'
      end

      it 'response must be success' do
        expect(last_response).to be_ok
      end

      it "have 'users' at the beginning" do
        json_response = JSON.parse(last_response.body)
        expect(json_response).to have_key('users') # { users: {} }
      end

      it 'contains the required keys in each hash' do
        json_response = JSON.parse(last_response.body)
        users_response = json_response['users']
        required_keys = %w[age created_at id name]

        users_response.each do |hash|
          expect(hash.keys).to include(*required_keys)
        end
      end
    end
  end

  describe '#POST' do
    let(:time_now) { Time.now }

    before do
      post '/users', { name: 'Dmitrij', age: 18 }
    end

    it 'response must be success' do
      expect(last_response).to be_ok
    end

    it 'response must be success' do
      json_response = JSON.parse(last_response.body)

      expect(json_response).to eq({
                                    'age' => '18',
                                    'created_at' => time_now.strftime('%Y-%m-%d %H:%M:%S %z').to_s,
                                    'name' => 'Dmitrij'
                                  })
    end
  end
end

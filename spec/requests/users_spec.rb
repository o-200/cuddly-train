# frozen_string_literal: true

require 'spec_helper'

RSpec.describe App::Router::ApplicationRouter, type: :request do
  before do
    10.times { |n| DB[:users] << { name: 'name', age: n } }
    get '/users'
  end

  it "returns JSON with message 'Welcome'" do
    expect(last_response).to be_ok
  end

  it "have 'users' at the beginning" do
    json_response = JSON.parse(last_response.body)
    expect(json_response).to have_key("users")
  end

  it 'contains the required keys in each hash' do
    json_response = JSON.parse(last_response.body)
    users_response = json_response["users"]
    required_keys = ["age", "created_at", "id", "name"]

    users_response.each do |hash|
      expect(hash.keys).to include(*required_keys)
    end
  end
end

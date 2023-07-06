# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET /users/:id' do
    it 'returns http success for existing record' do
      user = User.new(email: 'a@b.com', first_name: "Bob")
      user.save!

      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'returns http 404 for missing record' do
      get "/users/0"
      expect(response).to have_http_status(404)
    end
  end
end

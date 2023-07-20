require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'UsersController' do
    context 'GET index' do
      before(:example) do
        get '/users'
      end

      it 'success for index action' do
        expect(response).to have_http_status(:success)
      end

      it 'Render correct templete for index action' do
        expect(response).to render_template(:index)
      end

      it 'Correct body placeholder text for index action' do
        expect(response.body).to include('Here is a list of users')
      end
    end

    context 'GET show' do
      before(:example) do
        get '/users/1'
      end

      it 'Success for show action' do
        expect(response).to have_http_status(:success)
      end

      it 'Render correct templete for show action' do
        expect(response).to render_template(:show)
      end

    end
  end
end
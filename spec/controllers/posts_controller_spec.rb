require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'Make a get request to index' do
    before(:example) do
      get '/users/183/posts'
    end

    it 'Response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'Response body includes correct text' do
      expect(response.body).to include('This is Gulalai Ahmadi posts list')
    end
  end

  context 'Make a get request to user' do
    before(:example) do
      get '/users/183/posts/213'
    end

    it 'Response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the :index template' do
      expect(response).to render_template(:show)
    end

    it 'Response body includes correct text' do
      expect(response.body).to include('This is selected post')
    end
  end
end
